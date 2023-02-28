// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:learn/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool buttonTapped = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() => {buttonTapped = true});

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.HOME);
      setState(() => {buttonTapped = false});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.asset(
              "assets/img/login.png",
              fit: BoxFit.contain,
              height: 300,
              width: 300,
            ),
            SizedBox(height: 20),
            Text("Welcome $name",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 32.0),
              child: Column(children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Username", hintText: "Enter username"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Username can not be empty";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password", hintText: "Enter password"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password can not be empty";
                    } else if (value.length < 6) {
                      return "Password can not be shorter than 6 characters";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Material(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(buttonTapped ? 50 : 8),
                  child: InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: 50,
                      width: buttonTapped ? 50 : 150,
                      alignment: Alignment.center,
                      child: buttonTapped
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text("login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                    ),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    ));
  }
}
