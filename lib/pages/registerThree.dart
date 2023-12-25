import 'package:barrio/pages/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:barrio/components/buttons.dart';
import 'package:barrio/components/textbox.dart';
import 'package:barrio/components/logo.dart';
import 'package:barrio/pages/register.dart';
import 'package:barrio/pages/registerOne.dart';
import 'package:barrio/pages/registerTwo.dart';
import 'package:barrio/pages/accountCreated.dart';

final _auth = FirebaseAuth.instance;
final _username = new TextEditingController();
final _password = new TextEditingController();
final _confirmpass = new TextEditingController();

class RegisterThree extends StatelessWidget {
  RegisterThree(
      {super.key,
      required this.firstname,
      required this.lastname,
      required this.midname,
      required this.age,
      required this.gender,
      required this.housenum,
      required this.street,
      required this.barangay,
      required this.city,
      required this.phonenum,
      required this.email});
  final String firstname;
  final String lastname;
  final String midname;
  final String age;
  final String gender;

  final String housenum;
  final String street;
  final String barangay;
  final String city;

  final String phonenum;
  final String email;

  void goRegister(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return Register();
      },
    ));
  }

  void goRegisterOne(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return RegisterOne(
          firstname: '',
          lastname: '',
          midname: '',
          age: '',
          gender: '',
        );
      },
    ));
  }

  void goRegisterTwo(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return RegisterTwo(
          firstname: '',
          lastname: '',
          midname: '',
          age: '',
          gender: '',
          housenum: '',
          street: '',
          barangay: '',
          city: '',
        );
      },
    ));
  }

  void goRegisterThree(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return RegisterThree(
          firstname: '',
          lastname: '',
          midname: '',
          age: '',
          gender: '',
          housenum: '',
          street: '',
          barangay: '',
          city: '',
          phonenum: '',
          email: '',
        );
      },
    ));
  }

  void goAccCreated(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return const AccountCreated();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {

    String role = 'resident';

    print(firstname);
    print(lastname);
    print(midname);
    print(age);
    print(gender);

    print(housenum);
    print(street);
    print(barangay);
    print(city);

    print(phonenum);
    print(email);
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

                //Back Button
                BackButt(
                  onTap: () {
                    goRegisterTwo(context);
                  },
                ),

                SizedBox(height: 100),

                //Registration Text
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Others',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Kindly fill out all the information to register an account',
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                TextBox(
                  controller: _username,
                  hintText: 'Username',
                ),
                const SizedBox(height: 10),
                TextBox(
                  controller: _password,
                  hintText: 'Password',
                ),
                const SizedBox(height: 10),
                TextBox(
                  controller: _confirmpass,
                  hintText: 'Re-type Password',
                ),
                const SizedBox(height: 10),

                const SizedBox(height: 80),

                ElevatedButton(
                  onPressed: () {
                    register(email, _password.text, role);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AccountCreated(                            
                            )));
                  },
                  child: Text(
                    "Next",
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
                  const SizedBox(width: 15),

                  //Next Button
                  NextButt(
                    
                    onTap: () {
                      goAccCreated(context);
                    },
                    text: 'Next',
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

  void register(String email, String password, String role) async {
    CircularProgressIndicator();
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {postDetailsToFirestore(email, role)})
        .catchError((e) {});
  }

  postDetailsToFirestore(String email, String role) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({
      'firstname': firstname,
      'lastname': lastname,
      'middlename': midname,
      'age': age,
      'gender': gender,

      'housenumber': housenum,
      'street': street,
      'barangay': barangay,
      'city': city,

      'phonenumber': phonenum,
      'email': email,
      'role': role,
      
      'username': _username.text,
      'password': _password.text

      });
  }
}
