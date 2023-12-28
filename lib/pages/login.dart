import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:barrio/components/buttons.dart';
import 'package:barrio/components/textbox.dart';
import 'package:barrio/components/logo.dart';
import 'admin.dart';
import 'resident.dart';

final _formkey = GlobalKey<FormState>();

final _auth = FirebaseAuth.instance;

final _email = new TextEditingController();
final _password = new TextEditingController();

class Login extends StatefulWidget {

  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void goLogin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return Login();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Logo(
                  image: 'lib/images/logo.png',
                  height: 50,
                ),

                SizedBox(height: 70),

                //Registration Text
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Welcome Back!',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Email txtfield
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                      helperText: ' ',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 199, 199, 199),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 46, 44, 44)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                          fontSize: 20.0, color: Color(0xFFB9B9B9)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email cannot be empty';
                      }
                      if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return ("Please enter a valid email");
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                // const SizedBox(height: 10),

                // Password txtfield
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    controller: _password,
                    decoration: InputDecoration(
                      helperText: ' ',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 199, 199, 199),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 46, 44, 44)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                          fontSize: 20.0, color: Color(0xFFB9B9B9)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                    ),
                    validator: (value) {
                      RegExp regex = new RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                        return 'Password cannot be empty';
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Please enter valid password min. 6 character");
                      }                    
                      else {
                        return null;
                      }
                    },                   
                  ),
                ),
                //const SizedBox(height: 10),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) { 
                    signIn(_email.text, _password.text);
                    }
                  },
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15),
                    backgroundColor: Color(0xFF0D1282),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),

                /*Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //For Spacing
                    const SizedBox(width: 5),

                    //Next Button
                    NextButt(
                      onTap: () {
                        goLogin(context);
                      },
                      text: 'Confirm',
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ],
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "admin") {
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(
              builder: (context) => Admin(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Resident(),
            ),
          );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void signIn(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      route();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
