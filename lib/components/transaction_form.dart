import 'package:flutter/material.dart';

class TransactionForm  extends StatefulWidget {

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleControler = TextEditingController();

  final valueControler = TextEditingController();

  _submitForm() {
    final title = titleControler.text;
    final value = double.tryParse(valueControler.text) ?? 0 ;
    
    if(title.isEmpty || value <=0 ) {
      return;
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget> [
                    TextField(
                      controller: titleControler,
                      style: TextStyle(color: Colors.black),
                      onSubmitted: (_) => _submitForm(),
                      decoration: InputDecoration(
                        labelText: 'Título',
                      ),
                    ),
                    TextField(
                      controller: valueControler,
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.number,
                      onSubmitted: (_) => _submitForm(),
                      decoration: InputDecoration(
                        labelText: 'Valor(R\$)',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget> [
                    TextButton(
                      child: Text('Nova Transação',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                      onPressed: _submitForm,         
                     ),
                    ],
                   ),
                  ],
                ),
              ),
            );
  }
}