import 'package:flutter/material.dart';

class TransactionForm  extends StatelessWidget {

  final titleControler = TextEditingController();
  final valueControler = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  _submitForm() {
    final title = titleControler.text;
    final value = double.tryParse(valueControler.text) ?? 0 ;
    
    if(title.isEmpty || value <=0 ) {
      return;
    }
    onSubmit(title, value);
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
                      decoration: InputDecoration(
                        labelText: 'Título',
                      ),
                    ),
                    TextField(
                      controller: valueControler,
                      keyboardType: TextInputType.number,
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
                        color: Colors.blue[900],
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