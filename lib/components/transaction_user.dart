import 'dart:math';

import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Tênis de corrida novo',
        value: 250.70,
        datetime: DateTime.now()
        ),
    Transaction(
        id: 't2',
        title: 'Conta da Netflix',
        value: 57.70,
        datetime: DateTime.now()
        ),
  ];

  _addTransaction(var title, var value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
       title: title,
        value: value,
         datetime: DateTime.now(),
         );

         setState(() {
           _transactions.add(newTransaction);
         });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(_transactions),
        TransactionForm(_addTransaction),
      ],
    );
  }
}