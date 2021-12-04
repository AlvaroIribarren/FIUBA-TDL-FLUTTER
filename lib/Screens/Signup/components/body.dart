import 'package:flutter/material.dart';
import 'package:truco_argentino_hardcoders/Screens/Login/login_screen.dart';
import 'package:truco_argentino_hardcoders/Screens/Signup/components/background.dart';
import 'package:truco_argentino_hardcoders/Screens/main_screen.dart';
import 'package:truco_argentino_hardcoders/api/UserSchema.dart';
import 'package:truco_argentino_hardcoders/api/api.dart';
import 'package:truco_argentino_hardcoders/components/common/already_have_an_account_acheck.dart';
import 'package:truco_argentino_hardcoders/components/common/error_dialog.dart';
import 'package:truco_argentino_hardcoders/components/common/rounded_button.dart';
import 'package:truco_argentino_hardcoders/components/common/rounded_input_field.dart';
import 'package:truco_argentino_hardcoders/components/common/rounded_password_field.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String email = "";
    String pass = "";
    final api = Api();
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/cartas-fuertes.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.04),
            Text(
              "Ingresa tus datos para crear la cuenta",
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900),
            ),
            SizedBox(height: size.height * 0.04),
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                pass = value;
              },
            ),
            RoundedButton(
              color: Colors.green.shade300,
              text: "REGISTRARSE",
              press: () async {
                UserSchema response = await api.postNewUser(email, pass);
                if (response.id != 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MainScreen();
                      },
                    ),
                  );
                } else {
                  return showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => ErrorDialog());
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
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
          ],
        ),
      ),
    );
  }
}
