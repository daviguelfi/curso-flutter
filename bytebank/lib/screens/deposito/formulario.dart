import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = 'Receber depósito';
const _dicaCampoValor = '0.00';
const _rotuloCampoValor = 'Valor';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioDeposito extends StatelessWidget {
  final TextEditingController _controladorCampoValor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorCampoValor,
                rotulo: _rotuloCampoValor,
                dica: _dicaCampoValor,
                icone: Icons.monetization_on),
            RaisedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () => _criaDeposito(context),
            ),
          ],
        ),
      ),
    );
  }

  _criaDeposito(BuildContext context) {
    final double valor = double.tryParse(_controladorCampoValor.text);
    final depositoValido = _validaDeposito(valor);
    if (depositoValido) {
      _ataulizaEstado(context, valor);
      Navigator.pop(context);
    }
  }

  _validaDeposito(valor) {
    final _campoPreenchido = valor != null;

    return _campoPreenchido;
  }

  _ataulizaEstado(context, valor) {
    Provider.of<Saldo>(context, listen: false).adiciona(valor);
  }
}
