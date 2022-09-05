import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/helper/appcolors.dart';
import 'package:project/login/loginPage.dart';
import 'package:project/models/users.dart';

import '../pages/categorylistpage.dart';
import '../widgets/iconfont.dart';

class SignUpPage extends StatefulWidget {

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _username = TextEditingController();
  final _email = TextEditingController();
  final _pwd = TextEditingController();
  final _cpwd = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Text error = Text('');
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    Color iconColor = Theme.of(context).primaryColor == Colors.black54
        ? Colors.white : Colors.black;

    return Scaffold(
      body: SingleChildScrollView(
        child:  Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(14, 44, 14, 14),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      IconFont(
                        iconName: 'a',
                        color: iconColor,
                        size: 44,
                      ),
                      SizedBox(height: 24,),
                      Text("Username",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        validator: (username)=> username!.isEmpty ? 'Enter a username': null,
                        controller: _username,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          hintText: "Enter a Username",
                          suffixIcon: Icon(
                            Icons.person,
                            color: AppColors.main_color,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50,),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.main_color, width: 2,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("Email id",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        validator: (email){
                          if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email!)){
                            return 'Enter a valid email address';
                          }
                          else
                            return null;
                        },

                        controller: _email,

                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          hintText: "Enter your email address",
                          suffixIcon: Icon(
                            Icons.email,
                            color: AppColors.main_color,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50,),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.main_color, width: 2,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("Password",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _pwd,
                        validator: (password)=> password!.isEmpty ? 'Enter a password': null,

                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.start,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          suffixIcon: Icon(
                            Icons.visibility,
                            color: AppColors.main_color,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              50,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.main_color, width: 2,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "Confirm Password",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (_pwd.text != _cpwd.text){
                            return 'Password doesnot match';
                          }
                        },
                        controller: _cpwd,

                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.start,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Confirm password",
                          suffixIcon: Icon(
                            Icons.visibility,
                            color: AppColors.main_color,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              50,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.main_color, width: 2,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),


                      InkWell(
                        onTap: () async {

                          if (_formKey.currentState!.validate()){
                            setState(() => isLoading = true);
                            bool docExists = await checkData();
                            if (docExists){
                              setState(() => error = Text('Username already exists. Please try another',
                                  style: TextStyle(color: Colors.red, fontSize: 14) ),  );
                              isLoading = false;
                            }
                            else {
                              addUser();
                              Navigator.pop(context);
                            }

                          }

                        },
                        child: isLoading ? CircularProgressIndicator(color: AppColors.main_color,) :
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
                          child: const Text('Register',
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.text,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      error,
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            // vertical: 20,
                          ),
                          // padding: EdgeInsets.all(15),
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                'Already have an account ?',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Login',
                                style: TextStyle(
                                  color: AppColors.main_color,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ),

          ],
        ),
      )
    );
  }

  Future<bool> checkData() async {
    try {
      var variable = await FirebaseFirestore.instance.collection('users')
          .doc(_username.text).get();

      Map<String, dynamic>? data = variable.data();
      if (data != null){
        return true;
      }
      else
        return false;
    }
    catch(e){
      throw e;
    }

  }

  Future addUser() async {
      final docUserInfo = FirebaseFirestore.instance.collection('users').doc(_username.text);

      final user = Users(
          password: _pwd.text,
          username: _username.text,
          email: _email.text
      );

      final json = user.toJson();
      await docUserInfo.set(json);
  }
}