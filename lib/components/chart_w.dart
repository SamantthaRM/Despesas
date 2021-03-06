import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {

   final List<Transaction> recentTransaction;

   Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransacitons {
    return List.generate(7, (index) {
      
      final weekDay = DateTime.now().subtract(
        Duration(days: index)
      );

      double totalSum = 0.0;

      for(var i = 0; i < recentTransaction.length; i++) {
       bool sameDay = recentTransaction[i].datetime.day == weekDay.day;
       bool sameMonth = recentTransaction[i].datetime.month == weekDay.month;
       bool sameYear = recentTransaction[i].datetime.year == weekDay.year;
      
      if(sameDay && sameMonth && sameYear) {
        totalSum += recentTransaction[i].value; 
       }
      }

     
      return {
        'day': DateFormat.E().format(weekDay)[0],
         'value': totalSum, 
         };
    });
  }

  double get _weekTotalValue {
    return groupedTransacitons.fold(0.0,(sum, tr) {
     return sum + (tr['value'] as double);
    });
  }


  @override

  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 7,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransacitons.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: tr ['day'].toString(),
                value: tr ['value'] as double,
                percentage: (tr['value'] as double)  / _weekTotalValue,
                ),
            );
             }).toList(),
        ),
      ),
    );
  }
}