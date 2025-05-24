import 'package:flutter/material.dart';

class AccountOptionsScreen extends StatelessWidget {
  const AccountOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_logo, SizedBox(height: 170,) ,_createAccountBtn, SizedBox(height: 20,), _loginBtn],
        ),
      ),
    );
  }

  Widget get _logo {
    return Image.asset("assets/images/book_logo.png", width: 350,);
  }

  Widget get _createAccountBtn {
    return SizedBox(
      width: 340,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {},
        child: Text('Create Account'),
      ),
    );
  }

  Widget get _loginBtn{
    return SizedBox(
      width: 340,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.red,
          side: BorderSide(color: Colors.red, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {},
        child: Text('Log In as Guest'),
      ),
    );
  }
}
