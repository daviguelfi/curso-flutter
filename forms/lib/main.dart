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
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastrando coisas'),
        ),
        body: Column(
          children: [
            TextField(
              controller: _controllerName,
            ), // change value of the model
            TextField(
              controller: _controllerAmount,
              // keyboardType: ,
            ),
            TextField(
              controller: _controllerValue,
            ),
            RaisedButton(
              child: Text('Cadastrar'),
              onPressed: () {
                final String name =
                    _controllerName.text; // get value of the text field
                final double value = double.tryParse(_controllerValue.text);
                final int amount = int.tryParse(_controllerAmount.text);

                final Product newProduct = Product(name, amount, value);
                print(newProduct);
              },
            )
          ],
        ),
      ),
    );
  }
}
