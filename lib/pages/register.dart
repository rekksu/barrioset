import 'package:flutter/material.dart';
import 'package:barrio/components/buttons.dart';
import 'package:barrio/components/textbox.dart';
import 'package:barrio/components/logo.dart';
import 'package:barrio/pages/registerOne.dart';
import 'package:barrio/pages/fourthPage.dart';

final _formkey = GlobalKey<FormState>();

class Register extends StatelessWidget {
  Register({super.key});

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
                    goFourthPage(context);
                  },
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
                TextBox(
                    controller: _fname,
                    hintText: 'First Name',
                    ),
                const SizedBox(height: 10),
                TextBox(
                    controller: _lname,
                    hintText: 'Last Name',
                 ),
                const SizedBox(height: 10),
                TextBox(
                    controller: _midname,
                    hintText: 'Middle Name',
                    ),
                const SizedBox(height: 10),
                TextBox(
                    controller: _age,
                    hintText: 'Age',
                    ),
                const SizedBox(height: 10),
                TextBox(
                    controller: _gender,
                    hintText: 'Gender',
                    ),
                const SizedBox(height: 10),

                const SizedBox(height: 80),

                ElevatedButton(
                  onPressed: () {               
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RegisterOne(
                              firstname: _fname.text,
                              lastname: _lname.text,
                              midname: _midname.text,
                              age: _age.text,
                              gender: _gender.text,
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
