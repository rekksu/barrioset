import 'package:barrio/pages/docuPage.dart';
import 'package:barrio/pages/homePage.dart';
import 'package:barrio/pages/hotlinePage.dart';
import 'package:barrio/pages/login.dart';
import 'package:barrio/pages/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    UserHome(),
    UserDocu(),
    UserHotline(),
    UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Admin"),
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: Icon(
              Icons.logout,
            ),
          )
        ],
      ),
        body: _pages[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color.fromRGBO(241,241,241,1.000)
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          // icon colors
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 35,), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.insert_drive_file, size: 35,), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.local_phone_rounded, size: 35,), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person, size: 35,), label: ''),
          ],
        ),
      ),
    );
  }


  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }
}