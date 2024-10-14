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
    return Scaffold(
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
              _buildButton(context, '7'),
              _buildButton(context, '8'),
              _buildButton(context, '9'),
              _buildButton(context, '/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton(context, '4'),
              _buildButton(context, '5'),
              _buildButton(context, '6'),
              _buildButton(context, '*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton(context, '1'),
              _buildButton(context, '2'),
              _buildButton(context, '3'),
              _buildButton(context, '-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton(context, '0'),
              _buildButton(context, 'C'),
              _buildButton(context, '='),
              _buildButton(context, '+'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String label) {
    final calculator = Provider.of<CalculatorModel>(context, listen: false);

    return ElevatedButton(
      onPressed: () {
        if (label == 'C') {
          calculator.clear();
        } else if (label == '=') {
          calculator.calculate();
        } else if (['+', '-', '*', '/'].contains(label)) {
          calculator.inputOperation(label);
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