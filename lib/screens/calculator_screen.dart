import 'package:calculator/widgets/button_widget.dart';
import 'package:flutter/material.dart';

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
  String? result;
  String? input = '';
  void onPressed(String value) {
    if (value == 'c') {
      _inputController.text = '';
      _resultController.text = '';
      number1 = '';
      number2 = '';
      result = '';
      input = '';
    } else if (value == 'backSpace') {
      if (input != null && input!.length > 0) {
        input = input!.substring(0, input!.length - 1);
        _inputController.text = input!;
      }
    } else if (value == '=') {
      if (input!.isEmpty) {
        result = 'Error';
        _resultController.text = result!;
      } else {
        result = outputResult();
        _resultController.text = result!;
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
                          onPressed: () => onPressed('c'),
                        ),
                        ButtonWidget(
                          buttonText: '÷',
                          buttonColor: Colors.grey.shade200,
                          buttonHeight: 1,
                          onPressed: () => onPressed('÷'),
                        ),
                        ButtonWidget(
                          buttonText: '×',
                          buttonColor: Colors.grey.shade200,
                          buttonHeight: 1,
                          onPressed: () => onPressed('×'),
                        ),
                      ]),
                      TableRow(children: [
                        ButtonWidget(
                          buttonText: '7',
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          onPressed: () => onPressed('7'),
                        ),
                        ButtonWidget(
                          buttonText: '8',
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          onPressed: () => onPressed('8'),
                        ),
                        ButtonWidget(
                          buttonText: '9',
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          onPressed: () => onPressed('9'),
                        ),
                      ]),
                      TableRow(children: [
                        ButtonWidget(
                          buttonText: '4',
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          onPressed: () => onPressed('4'),
                        ),
                        ButtonWidget(
                          buttonText: '5',
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          onPressed: () => onPressed('5'),
                        ),
                        ButtonWidget(
                          buttonText: '6',
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          onPressed: () => onPressed('6'),
                        ),
                      ]),
                      TableRow(children: [
                        ButtonWidget(
                          buttonText: '1',
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          onPressed: () => onPressed('1'),
                        ),
                        ButtonWidget(
                          buttonText: '2',
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          onPressed: () => onPressed('2'),
                        ),
                        ButtonWidget(
                          buttonText: '3',
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          onPressed: () => onPressed('3'),
                        ),
                      ]),
                      TableRow(children: [
                        ButtonWidget(
                          buttonText: '%',
                          buttonColor: Colors.grey.shade200,
                          buttonHeight: 1,
                          onPressed: () => onPressed('%'),
                        ),
                        ButtonWidget(
                          buttonText: '0',
                          buttonColor: Colors.white,
                          buttonHeight: 1,
                          onPressed: () => onPressed('0'),
                        ),
                        ButtonWidget(
                          buttonText: '.',
                          buttonColor: Colors.grey.shade200,
                          buttonHeight: 1,
                          onPressed: () => onPressed('.'),
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
                          onPressed: () => onPressed('backSpace'),
                        ),
                      ]),
                      TableRow(children: [
                        ButtonWidget(
                          buttonText: '-',
                          buttonColor: Colors.grey.shade200,
                          buttonHeight: 1,
                          onPressed: () => onPressed('-'),
                        ),
                      ]),
                      TableRow(children: [
                        ButtonWidget(
                          buttonText: '+',
                          buttonColor: Colors.grey.shade200,
                          buttonHeight: 1,
                          onPressed: () => onPressed('+'),
                        ),
                      ]),
                      TableRow(children: [
                        ButtonWidget(
                          buttonText: '=',
                          buttonColor: Colors.grey.shade200,
                          buttonHeight: 2,
                          onPressed: () => onPressed('='),
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
