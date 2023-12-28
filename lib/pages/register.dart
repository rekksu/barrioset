// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:barrio/components/buttons.dart';
import 'package:barrio/components/logo.dart';
import 'package:barrio/pages/registerOne.dart';
import 'package:barrio/pages/fourthPage.dart';
import 'package:flutter/services.dart';

final _formkey = GlobalKey<FormState>();

class Register extends StatelessWidget {
  Register({super.key});

  var gender = [
    'Male',
    'Female',
  ];

  var valueChoose;

  void goFourthPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return const fourthPage();
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

  @override
  Widget build(BuildContext context) {
    final _fname = new TextEditingController();
    final _lname = new TextEditingController();
    final _midname = new TextEditingController();
    final _age = new TextEditingController();
    final _gender = new TextEditingController();
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
                        'Personal Info',
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
       
                // FirstName txtfield
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    controller: _fname,
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
                      hintText: 'First Name',
                      hintStyle: const TextStyle(
                          fontSize: 20.0, color: Color(0xFFB9B9B9)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Input First name';
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

                 // MiddleName txtfield
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    controller: _midname,
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
                      hintText: 'Middle Name',
                      hintStyle: const TextStyle(
                          fontSize: 20.0, color: Color(0xFFB9B9B9)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Input Middle name';
                      } else {
                        return null;
                      }
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),               
                    ],
                  ),
                ),
               // const SizedBox(height: 10),

                // Lastname txtfield
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    controller: _lname,
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
                      hintText: 'Last Name',
                      hintStyle: const TextStyle(
                          fontSize: 20.0, color: Color(0xFFB9B9B9)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Input Last name';
                      } else {
                        return null;
                      }
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),       
                    ],
                  ),
                ),
              // const SizedBox(height: 10),            

                // Age txtfield
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    controller: _age,
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
                      hintText: 'Age',
                      hintStyle: const TextStyle(
                          fontSize: 20.0, color: Color(0xFFB9B9B9)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Input Age';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(2),
                    ],
                  ),
                ),
               // const SizedBox(height: 10),

                // Gender Dropdown
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: DropdownButtonFormField(
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
                      hintText: 'Gender',
                      hintStyle: const TextStyle(
                          fontSize: 20.0, color: Color(0xFFB9B9B9)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                    ),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    value: valueChoose,
                    onChanged: (newValue) {
                      valueChoose = newValue;
                    },
                    items: gender.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please Select Gender';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              // const SizedBox(height: 10),

                const SizedBox(height: 40),

                // Button Next
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterOne(
                                firstname: _fname.text.capitalize(),
                                lastname: _lname.text.capitalize(),
                                midname: _midname.text.capitalize(),
                                age: _age.text,
                                gender: valueChoose,
                              )));
                      /*ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing !!')),
                      );*/
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
                    const SizedBox(width: 5),

                    //Next Button
                    NextButt(
                      onTap: () {
                        goRegisterOne(context);
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

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.capitalize(),
      selection: newValue.selection,
    );
  }
}

extension StringExtension on String {
  String capitalize() {
     return 
       "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
