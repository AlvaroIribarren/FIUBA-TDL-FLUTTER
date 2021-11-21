import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? " ¿No tenés una cuenta? " : " ¿Ya tenés cuenta? ",
          style: TextStyle(color: Colors.blue.shade400),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Registrate" : "Ingresa",
            style: TextStyle(
              color: Colors.blue.shade400,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
