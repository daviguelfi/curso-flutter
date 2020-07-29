import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
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
            Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: 'Número da conta',
                dica: '0000'),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: 'Valor',
                dica: '00.00',
                icone: Icons.monetization_on),
            RaisedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text('Confirmar'),
            ),
          ],
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
    ;
  }
}

class ListaTransferencias extends StatelessWidget {
  // Stateful modifica de maneira dinamica
  // Stateless não modifica o conteudo

  final List<Transferencia> _transferencias = List();

  @override
  Widget build(BuildContext context) {
    _transferencias.add(Transferencia(100.00, 100));
    return Scaffold(
        appBar: AppBar(
          title: Text("Transferências"),
        ),
        body: ListView.builder(
          itemCount: _transferencias.length,
          itemBuilder: (context, indice) {
            final transferencia = _transferencias[indice];
            return ItemTransferencia(transferencia);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final Future<Transferencia> future =
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormularioTransferencia();
            }));
            future.then((transferenciaRecebida) {
              debugPrint('Criando transferência');
              debugPrint('$transferenciaRecebida');
              _transferencias.add(transferenciaRecebida);
            });
          },
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

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  // ^ maneira como o flutter entende que os recursos serão opcionais

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
