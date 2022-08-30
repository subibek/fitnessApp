import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/helper/appcolors.dart';
import 'package:project/login/signUpPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/pages/categorylistpage.dart';
import 'package:provider/provider.dart';

import '../mainPage.dart';
import '../widgets/iconfont.dart';

class LoginPage extends StatefulWidget {

  static String? currentUser;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _username = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Text error = Text('');
  bool isLoading = false;

  @override
  void dispose(){
    _username.dispose();
    _password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    Color iconColor = Theme.of(context).primaryColor == Colors.black54
        ? Colors.white : Colors.black;

    return Scaffold(
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconFont(
                      iconName: 'a',
                      color: iconColor,
                      size: 77,
                    ),
                    const SizedBox(height: 44),
                    TextFormField(
                      controller: _username,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.main_color, width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),

                      ),
                      validator: (value) => value!.isEmpty ? 'Enter your username': null,
                    ),
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: _password,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.main_color, width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      obscureText: true,
                      validator: (password)=> password!.isEmpty ? 'Enter a password': null,
                    ),
                    SizedBox(height: 4),
                    error,
                    SizedBox(height: 4),
                    InkWell(
                      onTap: () async {
                        String uid = _username.text;
                        String password = _password.text;
                        if (_formKey.currentState!.validate()){
                          setState(() => isLoading = true );
                          bool docExists = await signIn(uid,password);
                          if(docExists) {
                            LoginPage.currentUser = uid;
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) =>
                                    MainPage())
                            );

                          }
                          else if (docExists == false) {
                            setState(() => error = Text('Invalid Username or Password. Please try again.', style: TextStyle(color: Colors.red, fontSize: 14) ),  );
                          }
                          else
                            setState(() => error = Text('Loading', style: TextStyle(color: Colors.green, fontSize: 14) ));


                        }
                      },
                      child: isLoading ? Column(children: [CircularProgressIndicator(color: AppColors.main_color,), SizedBox(height: 10,)],) :
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(vertical: 13,),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.main_color,
                          borderRadius: const BorderRadius.all(Radius.circular(50,)),
                          border: Border.all(
                            color: AppColors.text,
                            width: 2,
                          ),
                        ),
                        child: const Text('Login',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.text,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(vertical: 13,),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.main_color,
                          borderRadius: const BorderRadius.all(Radius.circular(50,)),
                          border: Border.all(
                            color: AppColors.text,
                            width: 2,
                          ),
                        ),
                        child: const Text('Register now',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.text,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }

  Future<bool> signIn(String uid, String password) async {
    try{
      var variable = await FirebaseFirestore.instance.collection("users").doc(uid).get();

      Map<String, dynamic>? data = variable.data();

      var pwd = data!['password'];

      if(pwd == password){
        return true;
      }
      else
        return false;

    }
    catch(e){
      throw e;
    }
  }
}



