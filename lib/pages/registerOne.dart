import 'package:flutter/material.dart';
import 'package:barrio/components/buttons.dart';
import 'package:barrio/components/textbox.dart';
import 'package:barrio/components/logo.dart';
import 'package:barrio/pages/register.dart';
import 'package:barrio/pages/registerTwo.dart';
import 'package:flutter/services.dart';

final _formkey = GlobalKey<FormState>();

class RegisterOne extends StatelessWidget {
  RegisterOne(
      {super.key,
      required this.firstname,
      required this.lastname,
      required this.midname,
      required this.age,
      required this.gender});
  final String firstname;
  final String lastname;
  final String midname;
  final String age;
  final String gender;

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

  @override
  Widget build(BuildContext context) {
    final _housenum = TextEditingController();
    final _street = TextEditingController();
    final _barangay = TextEditingController();
    final _city = TextEditingController();

    print(firstname);
    print(lastname);
    print(midname);
    print(age);
    print(gender);
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
                    goRegister(context);
                  },
                ),

                SizedBox(height: 100),

                //Registration Text
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Address',
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

                // House Number txtfield
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    controller: _housenum,
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
                      hintText: 'House Number',
                      hintStyle: const TextStyle(
                          fontSize: 20.0, color: Color(0xFFB9B9B9)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Input House Number Address';
                      } else {
                        return null;
                      }
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[# 0-9 a-z A-Z]")),                                       
                    ],
                  ),
                ),
                //const SizedBox(height: 10),

                // Street txtfield
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    controller: _street,
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
                      hintText: 'Street',
                      hintStyle: const TextStyle(
                          fontSize: 20.0, color: Color(0xFFB9B9B9)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Input Street Address';
                      } else {
                        return null;
                      }
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[0-9 a-z A-Z]")),                                  
                    ],
                  ),
                ),
                //const SizedBox(height: 10),

                // Barangay txtfield
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    controller: _barangay,
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
                      hintText: 'Barangay',
                      hintStyle: const TextStyle(
                          fontSize: 20.0, color: Color(0xFFB9B9B9)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Input Barangay Address';
                      } else {
                        return null;
                      }
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),                                                   
                    ],
                  ),
                ),
                //const SizedBox(height: 10),

                // City txtfield
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    controller: _city,
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
                      hintText: 'City',
                      hintStyle: const TextStyle(
                          fontSize: 20.0, color: Color(0xFFB9B9B9)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Input City Address';
                      } else {
                        return null;
                      }
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),                                                        
                    ],
                  ),
                ),
                //const SizedBox(height: 10),
                const SizedBox(height: 10),

                // Next Button 
                const SizedBox(height: 90),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                        Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RegisterTwo(
                              firstname: firstname.capitalize(),
                              lastname: lastname.capitalize(),
                              midname: midname.capitalize(),
                              age: age,
                              gender: gender,
                              housenum: _housenum.text,
                              street: _street.text.capitalize(),
                              barangay: _barangay.text.capitalize(),
                              city: _city.text.capitalize(),
                            )));
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
                        goRegisterTwo(context);
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
}
