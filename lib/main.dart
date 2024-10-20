import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calculator_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CalculatorModel(),
      child: MyApp(),

    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<CalculatorModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(24),
                child: Text(
                  calculator.display,
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _values(context, 'C'),
                _values(context, '%'),
                _values(context, 'Del'),
                _values(context, '/'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _values(context, '7'),
                _values(context, '8'),
                _values(context, '9'),
                _values(context, '*'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _values(context, '4'),
                _values(context, '5'),
                _values(context, '6'),
                _values(context, '-'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _values(context, '1'),
                _values(context, '2'),
                _values(context, '3'),
                _values(context, '+'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _values(context, '.'),
                _values(context, '0'),
                _values(context, '00'),
                _values(context, '='),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _values(BuildContext context, String label) {
    final calculator = Provider.of<CalculatorModel>(context, listen: false);

    return ElevatedButton(
      onPressed: () {
        if (label == 'C') {
          calculator.clear();
        } else if (label == '=') {
          calculator.calculate();
        } else if (['+', '-', '*', '/','%'].contains(label)) {
          calculator.inputOperation(label);
        }else if(label == 'Del'){
          calculator.delete();
        } else {
          calculator.inputNumber(label);
        }
      },
      child: Text(label, style: TextStyle(fontSize: 24)),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20),
        shape: CircleBorder(),
      ),
    );
  }
}