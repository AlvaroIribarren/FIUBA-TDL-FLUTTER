import 'package:flutter/material.dart';
import 'package:truco_argentino_hardcoders/Screens/Login/login_screen.dart';
import 'package:truco_argentino_hardcoders/Screens/Signup/signup_screen.dart';
import 'package:truco_argentino_hardcoders/Screens/Welcome/components/background.dart';
import 'package:truco_argentino_hardcoders/components/common/rounded_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Truco Argentino",
              style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset(
              "assets/images/truco_logo.png",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "INICIAR SESION",
              color: Colors.blue,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "REGISTRARSE",
              color: Colors.green,
              textColor: Colors.white,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
