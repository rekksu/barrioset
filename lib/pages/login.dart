import 'package:flutter/material.dart';
import 'package:barrio/components/buttons.dart';
import 'package:barrio/components/textbox.dart';
import 'package:barrio/components/logo.dart';



class Login extends StatelessWidget {
  final _username = new TextEditingController();
  final _password = new TextEditingController();
  Login({super.key});

  void goLogin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return  Login();
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
                          fontSize: 35,
                          fontWeight: FontWeight.bold
                          
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
              

                const SizedBox(height: 20),


                Row(
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
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
