import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';

class TransactionList  extends StatelessWidget {

  final List<Transaction> transactions;

  TransactionList(this.transactions);
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty 
      ? Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            'No transactions registered.',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 200,
            child: Image.asset(
              'assets/images/waiting.png',
            fit: BoxFit.cover,
            ),
          ),
        ],
      )
      : ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final tr = transactions[index];
          return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'R\$ ${tr.value.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tr.title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            DateFormat('d  MMM  y').format(tr.datetime),
                            style: TextStyle(
                              fontSize: 16,
                              foreground: Paint()
                                ..shader = ui.Gradient.linear(
                                  const Offset(0, 20),
                                  const Offset(150, 20),
                                  <Color>[
                                    Colors.black,
                                    Colors.red,
                                  ],
                                ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },    
            ),
    );
  }
}