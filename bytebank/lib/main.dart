import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Criando Transferência"),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controladorCampoNumeroConta,
                style: TextStyle(
                  fontSize: 24.0,
                ),
                decoration: InputDecoration(
                  labelText: 'Número da conta',
                  hintText: '0000',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controladorCampoValor,
                style: TextStyle(
                  fontSize: 24.0,
                ),
                decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: 'Valor da transferência',
                  hintText: '0.00',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            RaisedButton(
              onPressed: () {
                debugPrint('clicou no confirmar');
                final int numeroConta =
                    int.tryParse(_controladorCampoNumeroConta.text);
                final double valor =
                    double.tryParse(_controladorCampoValor.text);

                if (numeroConta != null && valor != null) {
                  final transferenciaCriada = Transferencia(valor, numeroConta);
                  debugPrint('$transferenciaCriada');
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$transferenciaCriada'),
                    ),
                  );
                }
              },
              child: Text('Confirmar'),
            ),
          ],
        ));
  }
}

class ListaTransferencias extends StatelessWidget {
  // Stateful modifica de maneira dinamica
  // Stateless não modifica o conteudo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            ItemTransferencia(Transferencia(100, 1000)),
            ItemTransferencia(Transferencia(200, 2000)),
            ItemTransferencia(Transferencia(300, 3000)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        ));
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

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numerConta: $numerConta}';
  }
}
