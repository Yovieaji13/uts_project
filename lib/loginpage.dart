import 'package:flutter/material.dart';
import 'dart:async';
import 'package:uts_project/dbhelper.dart';
import 'package:uts_project/home.dart';
import 'package:uts_project/login.dart';

class LoginPage extends StatefulWidget {
  static  final String id = 'loginpage';
  Login currentUser;

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  DbHelper dbHelper = DbHelper();
  String username = 'yovie@gmail.com';
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final formkey = new GlobalKey<FormState>();
  

  // @override
  // void initState() {
  //   super.initState();
  //   updateListView();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Text(
                  'Welcome To Aplikasi Stock Morfeen ', style: TextStyle(color: Colors.white, fontSize:20,),
                ),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Image(
                  image: NetworkImage('https://scontent-cgk1-1.xx.fbcdn.net/v/t1.6435-9/104438863_3351848721706094_7197417179988458720_n.jpg?_nc_cat=111&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=AJUTwes14LYAX_GEXn_&_nc_ht=scontent-cgk1-1.xx&oh=5a0fcd1ca7d47831e2cb8eb26e65caf1&oe=608F2152'),
                ),
              ),
              _formBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formBuilder() {
 return Form(
      key: formkey,
      // autovalidate: true,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: usernameController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white),
              validator: (username) {
                return username.isEmpty ? "*Mohon diisi" : null;
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
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              style: TextStyle(color: Colors.white),
              validator: (password) {
                return password.isEmpty ? "*Mohon diisi" : null;
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
            onPressed: () async{
              if (formkey.currentState.validate() &&
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
                  style: TextStyle(fontSize: 24, color: Colors.blueGrey),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: FlatButton(
              child: Text(
                'Registrasi',
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

  Future<LoginPage> navigateToHome(BuildContext context, LoginPage loginPage) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return Home();
    }));
    return result;
  }
}
