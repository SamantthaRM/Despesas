import 'package:flutter/material.dart';

class ChartBar  extends StatelessWidget {

  final String? label;
  final double? value;
  final double? percentage;

  ChartBar({
    this.label, 
    this.value, 
    this.percentage
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(
          child: Text('${value!.toStringAsFixed(2)}',
          style:TextStyle(color: Colors.black)
           ),
          ),
        SizedBox(height: 5,),
          Container(
            height: 60,
            width: 10,
            child: Stack(
              alignment: Alignment.bottomCenter,
             children: <Widget>[
               Container(
                 decoration: BoxDecoration(
                   border: Border.all(
                     color: Colors.blueGrey,
                     width: 1.0,
                   ),
                   color: Color.fromRGBO(220, 220, 220, 1),
                   borderRadius: BorderRadius.circular(5)
                 ),
               ),
               FractionallySizedBox(
                 heightFactor: percentage,
                 child: Container(
                   decoration: BoxDecoration(
                     color: Theme.of(context).primaryColor,
                     borderRadius: BorderRadius.circular(5)
                   ) ,
                 ),
               ),
             ],
            ),
          ),
        SizedBox(height: 5),
        Text(label!,style:TextStyle(color: Colors.black)),
      ],   
    );
  }
}