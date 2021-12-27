import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';
import 'dart:ui';
main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.lightGreenAccent[700],
        fontFamily: 'Quicksand',
        textTheme: ThemeData.dark().textTheme.copyWith(
          headline6: TextStyle(
             fontFamily: 'RobotoCondensed-BoldItalic',
             fontSize: 18,
             fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
           headline6: TextStyle(
             fontFamily: 'RobotoCondensed-BoldItalic',
             fontSize: 27,
           ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _transactions = [
    //Transaction(
       // id: 't1',
      // title: 'Tênis de corrida novo',
       // value: 250.70,
      //  datetime: DateTime.now()
      //  ),
   // Transaction(
   //     id: 't2',
    //    title: 'Conta da Netflix',
     //   value: 57.70,
    //    datetime: DateTime.now()                  
    //    ),
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

         Navigator.of(context).pop();
  }

_openTransactionFormModal(BuildContext context) {
  showModalBottomSheet(
    context:context, 
    builder: (_) {
      return TransactionForm(_addTransaction);
      }
    );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Card(
                color: Colors.lightGreenAccent[700],
                child: Text('Gráfico'),
                elevation: 5,
              ),
            ),
            TransactionList(_transactions),
            ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
  }
}
