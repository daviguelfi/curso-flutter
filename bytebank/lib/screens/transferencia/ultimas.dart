import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'lista.dart';

final _titulo = 'Últimas transferências';

class UltimasTransfererencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Text(
            _titulo,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        Consumer<Transferencias>(builder: (context, transferencias, child) {
          final _ultimasTransferencias =
              transferencias.transferencias.reversed.toList();
          final _quantidade = transferencias.transferencias.length;
          int tamanho = 2;
          if (_quantidade == 0) {
            return SemTransferencia();
          }
          if (_quantidade < 2) {
            tamanho = _quantidade;
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            shrinkWrap: true,
            itemCount: tamanho,
            itemBuilder: (context, indice) {
              return ItemTransferencia(
                _ultimasTransferencias[indice],
              );
            },
          );
        }),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: RaisedButton(
            child: Text('Ver todas transferências'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ListaTransferencias();
              }));
              // saldo.adiciona(10);
            },
          ),
        ),
      ],
    );
  }
}

class SemTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Você ainda não cadastrou nenhuma transferencia',
            textAlign: TextAlign.center,
          )),
    );
  }
}
