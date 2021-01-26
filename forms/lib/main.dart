import 'package:flutter/material.dart';

import 'model/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController _controllerName =
      TextEditingController(); //controll value of the field and model
  final TextEditingController _controllerValue = TextEditingController();
  final TextEditingController _controllerAmount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastrando coisas',
      theme: ThemeData(
          backgroundColor: Colors.grey[200],
          primaryColor: Colors.purple[900],
          accentColor: Colors.blue[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.purple[700],
            textTheme: ButtonTextTheme.primary,
          )),
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text('Cadastrando coisas'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controllerName,
                decoration: InputDecoration(labelText: 'Nome'),
              ), // change value of the model
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controllerAmount,
                  decoration: InputDecoration(labelText: 'Quantidade'),
                  keyboardType: TextInputType.number,
                  // keyboardType: ,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controllerValue,
                  decoration: InputDecoration(labelText: 'Valor'),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: RaisedButton(
                  child: Text('Cadastrar'),
                  onPressed: () {
                    final String name =
                        _controllerName.text; // get value of the text field
                    final double value = double.tryParse(_controllerValue.text);
                    final int amount = int.tryParse(_controllerAmount.text);

                    final Product newProduct = Product(name, amount, value);
                    print(newProduct);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
