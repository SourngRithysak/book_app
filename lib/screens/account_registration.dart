// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:homeworks_01/screens/account_options_screen.dart';
import 'package:homeworks_01/screens/login_screen.dart';

class AccountRegistration extends StatefulWidget {
  const AccountRegistration({super.key});

  @override
  State<AccountRegistration> createState() => _accountStateRegistration();
}

class _accountStateRegistration extends State<AccountRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _logo,
            _fullName,
            _userName,
            _email,
            _password,
            _createBtn,
            _or,
            _faceAndMail,
            _login(context)
          ],
        ),
      ),
    );
  }

  Widget get _logo {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 0),
        child: Image.asset("assets/images/book_logo.png", width: 270),
      ),
    );
  }

  Widget get _fullName {
    return Padding(
      padding: EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 15),
      child: TextFormField(
        style: TextStyle(fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
          labelText: "Fullname",
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          suffixIcon: Icon(Icons.close, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
        ),
      ),
    );
  }

  Widget get _userName {
    return Padding(
      padding: EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 15),
      child: TextFormField(
        style: TextStyle(fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
          labelText: "Username",
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          suffixIcon: Icon(Icons.close, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
        ),
      ),
    );
  }

  Widget get _email {
    return Padding(
      padding: EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 15),
      child: TextFormField(
        style: TextStyle(fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
          labelText: "Email",
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          suffixIcon: Icon(Icons.close, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
        ),
      ),
    );
  }

  Widget get _password {
    return Padding(
      padding: EdgeInsets.only(top: 15, right: 20, left: 20, bottom:45),
      child: TextFormField(
        style: TextStyle(fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
          labelText: "Password",
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
        ),
      ),
    );
  }

  Widget get _createBtn {
    return SizedBox(
      width: 370,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        onPressed: () {},
        child: Text(
          'Create Account',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  Widget get _or {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      child: Text("Or", style: TextStyle(color: Colors.grey)),
    );
  }

  Widget get _faceAndMail {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all(Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountOptionsScreen(),
                    ),
                  );
                },
                child: Icon(Icons.facebook_sharp, color: Colors.blue, size: 30),
              ),
            ),
            SizedBox(width: 5),
            SizedBox(
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all(Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountOptionsScreen(),
                    ),
                  );
                },
                child: Icon(Icons.mail, color: Colors.red, size: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _login(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Text(
                "Already have an account?",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ),
            SizedBox(width: 5),
            SizedBox(
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all(Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: Text('Log In', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
