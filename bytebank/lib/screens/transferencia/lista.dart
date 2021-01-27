import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: Consumer<Transferencias>(builder: (context, transferencias, child) {
        return ListView.builder(
            itemCount: transferencias.transferencias.length,
            itemBuilder: (context, indice) {
              final transferencia = transferencias.transferencias[indice];
              return ItemTransferencia(transferencia);
            });
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia; // _ é o metodo privado

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: Card(
          child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.toStringValor()),
        subtitle: Text(_transferencia.toStringConta()),
      )),
    );
  }
}
