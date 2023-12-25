import 'package:flutter/material.dart';
import 'package:barrio/components/buttons.dart';
import 'package:barrio/components/textbox.dart';
import 'package:barrio/components/logo.dart';
import 'package:barrio/pages/register.dart';
import 'package:barrio/pages/registerOne.dart';
import 'package:barrio/pages/registerTwo.dart';
import 'package:barrio/pages/accountCreated.dart';


class RegisterThree extends StatelessWidget {
   final _username = new TextEditingController();
   final _password = new TextEditingController();
   final _confirmpass = new TextEditingController();
  RegisterThree ({super.key});

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
        return RegisterTwo();
      },
    ));
  }

  void goRegisterThree(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return  RegisterThree();
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

                TextBox(controller: _username, hintText: 'Username', 
                ),
                const SizedBox(height: 10),
                TextBox(controller: _password, hintText: 'Password',
                 ),
                const SizedBox(height: 10),
                TextBox(controller: _confirmpass, hintText: 'Re-type Password',
                ),
                const SizedBox(height: 10),
                
              
          

                const SizedBox(height: 80),

                Row(
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
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
