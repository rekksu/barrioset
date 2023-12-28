import 'package:flutter/material.dart';

class SkipButt extends StatelessWidget {
  final Function()? onTap;
  const SkipButt({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.fromLTRB(280, 0, 2, 0),
        child: Text(
          'Skip',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Color(0xFF898989),
          ),
        ),
      ),
    );
  }
}

class LoginAcc extends StatelessWidget {
  final Function()? onTap;
  const LoginAcc({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: RichText(
          text: const TextSpan(
            text: "Already have an Account? ",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                text: "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Color(0xFF0D1282),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegAcc extends StatelessWidget {
  final Function()? onTap;
  const RegAcc({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: RichText(
          text: const TextSpan(
            text: "Don't have an Account? ",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                text: "Sign Up",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Color(0xFF0D1282),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NextButt extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final BorderRadius borderRadius;
  const NextButt(
      {super.key, this.onTap, required this.text, required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(123, 10, 123, 10),
        decoration: BoxDecoration(
          color: Color(0xFF0D1282),
          borderRadius: borderRadius,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class BackButt extends StatelessWidget {
  final Function()? onTap;
  const BackButt({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 280, 0),
        child: Text(
          'Back',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Color(0xFF898989),
          ),
        ),
      ),
    );
  }
}
