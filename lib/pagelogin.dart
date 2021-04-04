import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = 'yovie@gmail.com';
  String password = '123';

  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final formkey = new GlobalKey<FormState>();
  get formKey => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(
      //   title: Text('Morfeen Official'),
      // ),
      backgroundColor: Colors.blue[300],
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              // Container(
              //   padding: EdgeInsets.all(50),
              //   child: Image.asset(

              //   ),
              // ),
              _formBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formBuilder() {
    return Form(
      key: formKey,
      // autovalidate: true,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: usernameController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white),
              validator: (value) {
                return value.isEmpty ? "Username Tidak Boleh Kosong" : null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 10)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.5)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.5)),
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              style: TextStyle(color: Colors.white),
              validator: (value) {
                return value.isEmpty ? "Password Tidak Boleh Kosong" : null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.5)),
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            child: FlatButton(
              onPressed: () {},
              child: Text(
                'Lupa Password ?',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () async {
              if (formKey.currentState.validate() &&
                  usernameController.text.toString() == username) {
            var login = await navigateToHome(context, null);
              }
            },

            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.07,
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 24, color: Colors.blue[300]),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: FlatButton(
              child: Text(
                'Buat akun',
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  navigateToHome(BuildContext context, param1) {}
}