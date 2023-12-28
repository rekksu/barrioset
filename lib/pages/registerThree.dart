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
import 'package:flutter/services.dart';
import 'package:email_auth/email_auth.dart';

final _formkey = GlobalKey<FormState>();

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
          firstname: firstname,
          lastname: lastname,
          midname: midname,
          age: age,
          gender: gender,
        );
      },
    ));
  }

  void goRegisterTwo(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return RegisterTwo(
          firstname: firstname,
          lastname: lastname,
          midname: midname,
          age: age,
          gender: gender,
          housenum: housenum,
          street: street,
          barangay: barangay,
          city: city,
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
        child: Form(
          key: _formkey,
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

                // Username txtfield
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    controller: _username,
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
                      hintText: 'Username',
                      hintStyle: const TextStyle(
                          fontSize: 20.0, color: Color(0xFFB9B9B9)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Username cannot be empty';
                      } else {
                        return null;
                      }
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp("[0-9 a-z A-Z]")),
                    ],
                  ),
                ),
                //const SizedBox(height: 10),

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
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                //const SizedBox(height: 10),

                // Confirm Password txtfield
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    controller: _confirmpass,
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
                      hintText: 'Confirm Password',
                      hintStyle: const TextStyle(
                          fontSize: 20.0, color: Color(0xFFB9B9B9)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                    ),
                    validator: (value) {
                      if (_confirmpass.text != _password.text) {
                        return "Password did not match";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                //const SizedBox(height: 10),

                const SizedBox(height: 10),

                const SizedBox(height: 200),

                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      register(email, _password.text, role);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AccountCreated()));
                    }
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
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
      'firstname': firstname.capitalize(),
      'lastname': lastname.capitalize(),
      'middlename': midname.capitalize(),
      'age': age,
      'gender': gender,
      'housenumber': housenum,
      'street': street.capitalize(),
      'barangay': barangay.capitalize(),
      'city': city.capitalize(),
      'phonenumber': phonenum,
      'email': email,
      'role': role,
      'username': _username.text,
      'password': _password.text
    });
  }
}
