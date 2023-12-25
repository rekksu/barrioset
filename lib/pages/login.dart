import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:barrio/components/buttons.dart';
import 'package:barrio/components/textbox.dart';
import 'package:barrio/components/logo.dart';
import 'admin.dart';
import 'resident.dart';

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
        child: Center(
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

                TextBox(
                  controller: _email,
                  hintText: 'Email',
                ),
                const SizedBox(height: 10),
                TextBox(
                  controller: _password,
                  hintText: 'Password',
                ),
                const SizedBox(height: 10),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    signIn(_email.text, _password.text);
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
                        horizontal: 65, vertical: 17),
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
