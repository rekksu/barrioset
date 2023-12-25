import 'package:barrio/pages/fourthPage.dart';
import 'package:flutter/material.dart';
import 'package:barrio/components/buttons.dart';
import 'package:barrio/components/dots.dart';
import 'package:barrio/components/topimage.dart';
import 'package:barrio/components/logo.dart';
import 'package:barrio/pages/ThirdPage.dart';
import 'package:barrio/pages/secondPage.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({
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

              Logo(image: 'lib/images/logo.png', height: 50,),

                //Skip Button
                  SkipButt(
                    onTap: () {
                      goFourthPage(context);
                    },
                  ),

               const SizedBox(height: 15),         

              //Image
              TopImage(topimage: 'lib/images/first.png', height: 230,),


              //For Spacing
              const SizedBox(height: 60),

              //Below Child Text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  'Receive the latest information about events and developments in your barangay.', //eme lang to pakipalitan 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              //For Spacing
              const SizedBox(height: 200),

              //Navigation Dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Dots(
                    color: Color.fromARGB(255, 0, 0, 0),
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
                    onTap: () {
                      goFourthPage(context);
                    },
                    color: Color.fromARGB(255, 136, 137, 138),
                    borderRadius: BorderRadius.circular(8),
                    edgeInsets:
                        EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  ),
                ],
              ),

              //For Spacing
              const SizedBox(height: 30),

              //Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  //For Spacing
                  const SizedBox(width: 5),

                  //Next Button
                  NextButt(
                    
                    onTap: () {
                      goSecondPage(context);
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
