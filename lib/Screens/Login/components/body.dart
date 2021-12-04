import 'package:flutter/material.dart';
import 'package:truco_argentino_hardcoders/Screens/Login/components/background.dart';
import 'package:truco_argentino_hardcoders/Screens/Signup/signup_screen.dart';
import 'package:truco_argentino_hardcoders/Screens/main_screen.dart';
import 'package:truco_argentino_hardcoders/api/api.dart';
import 'package:truco_argentino_hardcoders/components/common/already_have_an_account_acheck.dart';
import 'package:truco_argentino_hardcoders/components/common/rounded_button.dart';
import 'package:truco_argentino_hardcoders/components/common/rounded_input_field.dart';
import 'package:truco_argentino_hardcoders/components/common/rounded_password_field.dart';

class Body extends StatelessWidget {
  String email = "";
  String pass = "";
  Api api = Api();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/cartas-espadas.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.04),
            Text(
              "Ingresa tus datos",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900),
            ),
            SizedBox(height: size.height * 0.03),
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
              color: Colors.green.shade400,
              text: "INICIAR SESION",
              press: () async {
                // TODO: DESCOMENTAR PARA REHABILITAR LOGIN!
                // LoginResponse response = await api.login(email, pass);

                // if (response.user.id != 0) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MainScreen();
                    },
                  ),
                  (Route<dynamic> route) => false,
                );
                // }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
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
