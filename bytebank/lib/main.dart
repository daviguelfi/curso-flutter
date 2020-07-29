import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListaTransferencias(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    ),
  ));
}

class ListaTransferencias extends StatelessWidget {
  // Stateful modifica de maneira dinamica
  // Stateless não modifica o conteudo

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ItemTransferencia(Transferencia(100, 1000)),
        ItemTransferencia(Transferencia(200, 2000)),
        ItemTransferencia(Transferencia(300, 3000)),
      ],
    );
  }
}

class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia; // _ é o metodo privado

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia.valor.toString()),
      subtitle: Text(_transferencia.numerConta.toString()),
    ));
  }
}

class Transferencia {
  final double valor;
  final int numerConta;

  Transferencia(this.valor, this.numerConta);
}
