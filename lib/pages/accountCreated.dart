import 'package:flutter/material.dart';
import 'package:barrio/components/buttons.dart';
import 'package:barrio/components/logo.dart';
import 'package:barrio/components/topimage.dart';
import 'package:barrio/pages/login.dart';

class AccountCreated extends StatelessWidget {
  const AccountCreated({super.key});

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
                SizedBox(height: 10),

                TopImage(
                  topimage: 'lib/images/accCreated.png',
                  height: 230,
                ),

                SizedBox(height: 100),

                //Registration Text
                const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        'Account Created!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold
                            ),
                      ),
                    ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    'To access other features, kindly wait until your account has been verified.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

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
