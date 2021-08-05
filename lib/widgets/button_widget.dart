import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final buttonText;
  final buttonHeight;
  final buttonColor;
  final Widget? icon;
  final Function onPressed;
  const ButtonWidget({
    Key? key,
    required this.buttonText,
    required this.buttonHeight,
    required this.buttonColor,
    required this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: buttonColor,
          shape: BoxShape.rectangle,
        ),
        child: MaterialButton(
          onPressed: ()=>onPressed(),
          child: icon != null
              ? icon
              : Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
        ));
  }
}
