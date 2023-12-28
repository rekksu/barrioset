import 'package:flutter/material.dart';
import 'package:barrio/components/buttons.dart';
import 'package:barrio/components/dots.dart';
import 'package:barrio/components/topimage.dart';
import 'package:barrio/components/logo.dart';
import 'package:barrio/pages/ThirdPage.dart';
import 'package:barrio/pages/SecondPage.dart';
import 'package:barrio/pages/firstPage.dart';
import 'package:barrio/pages/register.dart';
import 'package:barrio/pages/login.dart';

class fourthPage extends StatelessWidget {
  const fourthPage({
    super.key,
  });

  void goFirstPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return const FirstPage();
      },
    ));
  }

//create
  void goSecondPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return const SecondPage();
      },
    ));
  }

//started
  void goThirdPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return const ThirdPage();
      },
    ));
  }

  void goFourthPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return const fourthPage();
      },
    ));
  }

  void goRegister(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return Register();
      },
    ));
  }

//for Already have an account
  void gotoLogin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return Login();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //For Spacing
                const SizedBox(height: 5),

                Logo(
                  image: 'lib/images/logo.png',
                  height: 50,
                ),

                const SizedBox(height: 30),

                //Image
                TopImage(
                  topimage: 'lib/images/fourth.png',
                  height: 230,
                ),

                //For Spacing
                const SizedBox(height: 60),

                //Below Child Text
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Get easy access to health services, as well as social and educational assistance available within your barangay.', //eme lang to pakipalitan
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                //For Spacing
                const SizedBox(height: 195),

                //Navigation Dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Dots(
                      color: Color.fromARGB(255, 136, 137, 138),
                      borderRadius: BorderRadius.circular(8),
                      edgeInsets:
                          EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    ),
                    //For Spacing
                    const SizedBox(width: 5),
                    Dots(
                      onTap: () {
                        goSecondPage(context);
                      },
                      color: Color.fromARGB(255, 136, 137, 138),
                      borderRadius: BorderRadius.circular(8),
                      edgeInsets:
                          EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    ),
                    //For Spacing
                    const SizedBox(width: 5),
                    Dots(
                      onTap: () {
                        goThirdPage(context);
                      },
                      color: Color.fromARGB(255, 136, 137, 138),
                      borderRadius: BorderRadius.circular(8),
                      edgeInsets:
                          EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    ),
                    const SizedBox(width: 5),
                    Dots(
                      color: Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(8),
                      edgeInsets:
                          EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    ),
                  ],
                ),

                //For Spacing
                const SizedBox(height: 10),

                //Buttons
                //Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //For Spacing
                    const SizedBox(width: 2),

                    //Next Button
                    NextButt(
                      onTap: () {
                        goRegister(context);
                      },
                      text: 'Sign Up',
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ],
                ),
                //for Already have an account
                LoginAcc(
                  onTap: () {
                    gotoLogin(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
