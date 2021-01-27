import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/models/transferencias.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/dashboard/dashboard.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Saldo(valor: 10),
      ),
      ChangeNotifierProvider(
        create: (context) => Transferencias(),
      ),
    ],
    child: BytebankApp(),
  ));
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            backgroundColor: Colors.grey[200],
            primaryColor: Colors.purple[900],
            accentColor: Colors.purple[900],
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.purple[900],
              textTheme: ButtonTextTheme.primary,
            )),
        home: Dashboard());
  }
}
