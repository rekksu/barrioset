import 'package:flutter/material.dart';
import 'package:barrio/components/buttons.dart';
import 'package:barrio/components/textbox.dart';
import 'package:barrio/components/logo.dart';
import 'package:barrio/pages/register.dart';
import 'package:barrio/pages/registerOne.dart';
import 'package:barrio/pages/registerThree.dart';


class RegisterTwo extends StatelessWidget {
   RegisterTwo ({super.key, required this.firstname, required this.lastname, required this.midname, required this.age, required this.gender, required this.housenum, required this.street, required this.barangay, required this.city});
  final String firstname;
  final String lastname;
  final String midname;
  final String age;
  final String gender;

  final String housenum;
  final String street;
  final String barangay;
  final String city;


  void goRegister(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return  Register();
      },
    ));
  }

  void goRegisterOne(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return  RegisterOne(firstname: '', lastname: '', midname: '', age: '', gender: '',);
      },
    ));
  }

  void goRegisterTwo(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return  RegisterTwo(firstname: '', lastname: '', midname: '', age: '', gender: '', housenum: '', street: '', barangay: '', city: '',);
      },
    ));
  }

void goRegisterThree(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return RegisterThree(firstname: '', lastname: '', midname: '', age: '', gender: '', housenum: '', street: '', barangay: '', city: '', phonenum: '', email: '',);
      },
    ));
  }


  @override
  Widget build(BuildContext context) {
    final _phonenum = new TextEditingController();
    final _email = new TextEditingController();
    print(firstname);
    print(lastname);
    print(midname);
    print(age);
    print(gender);

    print(housenum);
    print(street);
    print(barangay);
    print(city);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                Logo(image: 'lib/images/logo.png', height: 50,),
                
                  //Back Button
                  BackButt(
                    onTap: () {
                      goRegisterOne(context);
                    },
                  ),
                  
                SizedBox(height: 100),

                //Registration Text
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Contacts',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold
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
                        'Kindly fill out all the information to register an account',
                        style: TextStyle(
                          fontSize: 11,
                          
                        ),
                        
                      ),
                     
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                TextBox(controller: _phonenum, hintText: 'Mobile Number',
                 ),
                const SizedBox(height: 10),
                TextBox(controller: _email, hintText: 'Email', 
                ),
                const SizedBox(height: 10),
              
          

                const SizedBox(height: 80),

                ElevatedButton(
                  onPressed: () {               
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RegisterThree(
                              firstname: firstname,
                              lastname: lastname,
                              midname: midname,
                              age: age,
                              gender: gender,

                              housenum: housenum,
                              street: street,
                              barangay: barangay,
                              city: city,

                              phonenum: _phonenum.text,
                              email: _email.text,
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

               /* Row(
                mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  //For Spacing
                  const SizedBox(width: 15),

                  //Next Button
                  NextButt(
                    
                    onTap: () {
                      goRegisterThree(context);
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
