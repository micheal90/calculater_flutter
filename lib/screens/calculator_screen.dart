import 'package:calculator/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _inputController = TextEditingController();
  TextEditingController _resultController = TextEditingController();

  String? number1;
  String? number2;
  String? finalResult;
  String? input = '';

  //with math package
  String equation = "0";
  String result = "0";
  String expression = "";

  onPressed2(String buttonText) {
    // print(buttonText);
    setState(() {
      if (buttonText == "c") {
        equation = "0";
        result = "0";
        _inputController.text = '';
        _resultController.text = '';
      } else if (buttonText == "backSpace") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          _resultController.text = result;
        } catch (e) {
          result = "Error";
          _resultController.text = result;
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
        _inputController.text = equation;
      }
    });
  }

  //without package
  void onPressed1(String value) {
    if (value == 'c') {
      _inputController.text = '';
      _resultController.text = '';
      number1 = '';
      number2 = '';
      finalResult = '';
      input = '';
    } else if (value == 'backSpace') {
      if (input != null && input!.length > 0) {
        input = input!.substring(0, input!.length - 1);
        _inputController.text = input!;
      }
    } else if (value == '=') {
      if (input!.isEmpty) {
        finalResult = 'Error';
        _resultController.text = finalResult!;
      } else {
        finalResult = outputResult();
        _resultController.text = finalResult!;
      }
    } else {
      input = input! + value;
      _inputController.text = input!;
    }
  }

  String outputResult() {
    var res;
    if (input!.contains('×')) {
      var list = input!.split('×');
      number1 = list[0];
      number2 = list[1];
      res = (double.parse(number1!) * double.parse(number2!)).toString();
    } else if (input!.contains('÷')) {
      var list = input!.split('÷');
      number1 = list[0];
      number2 = list[1];
      res = (double.parse(number1!) / double.parse(number2!)).toString();
    } else if (input!.contains('-')) {
      var list = input!.split('-');
      number1 = list[0];
      number2 = list[1];
      res = (double.parse(number1!) / double.parse(number2!)).toString();
    } else if (input!.contains('+')) {
      var list = input!.split('+');
      number1 = list[0];
      number2 = list[1];
      res = (double.parse(number1!) + double.parse(number2!)).toString();
    } else {
      res = input;
    }

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Spacer(),
            Column(
              children: [
                Container(
                  child: TextFormField(
                    controller: _inputController,
                    readOnly: true,
                    showCursor: true,
                    textAlign: TextAlign.end,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15)),
                  ),
                ),
                Container(
                  child: TextFormField(
                    controller: _resultController,
                    readOnly: true,
                    showCursor: true,
                    textAlign: TextAlign.end,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15)),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Table(
                    children: [
                      TableRow(children: [
                        ButtonWidget(
                          buttonText: 'C',
                          buttonColor: Colors.grey.shade200,
                          buttonHeight: 1,
                          onPressed: () => onPressed2('c'),
                        ),
                        ButtonWidget(
                          buttonText: '÷',
                          buttonColor: Colors.grey.shade200,
                          buttonHeight: 1,
                          onPressed: () => onPressed2('÷'),
                        ),
                        ButtonWidget(
                          buttonText: '×',
                          buttonColor: Colors.grey.shade200,
                          buttonHeight: 1,
                          onPressed: () => onPressed2('×'),
                        ),
                      ]),
                      TableRow(children: [
                        ButtonWidget(
                          buttonText: '7',
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          onPressed: () => onPressed2('7'),
                        ),
                        ButtonWidget(
                          buttonText: '8',
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          onPressed: () => onPressed2('8'),
                        ),
                        ButtonWidget(
                          buttonText: '9',
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          onPressed: () => onPressed2('9'),
                        ),
                      ]),
                      TableRow(children: [
                        ButtonWidget(
                          buttonText: '4',
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          onPressed: () => onPressed2('4'),
                        ),
                        ButtonWidget(
                          buttonText: '5',
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          onPressed: () => onPressed2('5'),
                        ),
                        ButtonWidget(
                          buttonText: '6',
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          onPressed: () => onPressed2('6'),
                        ),
                      ]),
                      TableRow(children: [
                        ButtonWidget(
                          buttonText: '1',
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          onPressed: () => onPressed2('1'),
                        ),
                        ButtonWidget(
                          buttonText: '2',
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          onPressed: () => onPressed2('2'),
                        ),
                        ButtonWidget(
                          buttonText: '3',
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          onPressed: () => onPressed2('3'),
                        ),
                      ]),
                      TableRow(children: [
                        ButtonWidget(
                          buttonText: '%',
                          buttonColor: Colors.grey.shade200,
                          buttonHeight: 1,
                          onPressed: () => onPressed2('%'),
                        ),
                        ButtonWidget(
                          buttonText: '0',
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          onPressed: () => onPressed2('0'),
                        ),
                        ButtonWidget(
                          buttonText: '.',
                          buttonColor: Colors.grey.shade200,
                          buttonHeight: 1,
                          onPressed: () => onPressed2('.'),
                        ),
                      ]),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Table(
                    children: [
                      TableRow(children: [
                        ButtonWidget(
                          buttonText: '',
                          icon: Icon(
                            Icons.backspace,
                            color: Colors.blue,
                          ),
                          buttonColor: Colors.grey.shade200,
                          buttonHeight: 1,
                          onPressed: () => onPressed2('backSpace'),
                        ),
                      ]),
                      TableRow(children: [
                        ButtonWidget(
                          buttonText: '-',
                          buttonColor: Colors.grey.shade200,
                          buttonHeight: 1,
                          onPressed: () => onPressed2('-'),
                        ),
                      ]),
                      TableRow(children: [
                        ButtonWidget(
                          buttonText: '+',
                          buttonColor: Colors.grey.shade200,
                          buttonHeight: 1,
                          onPressed: () => onPressed2('+'),
                        ),
                      ]),
                      TableRow(children: [
                        ButtonWidget(
                          buttonText: '=',
                          buttonColor: Colors.grey.shade200,
                          buttonHeight: 2,
                          onPressed: () => onPressed2('='),
                        ),
                      ]),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
