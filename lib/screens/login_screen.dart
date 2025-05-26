import 'package:flutter/material.dart';
import 'package:homeworks_01/screens/account_options_screen.dart';
import 'package:homeworks_01/screens/account_registration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginStateScreen();
}

class _LoginStateScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _logo,
            SizedBox(height: 25),
            _userTxt,
            _passtxt,
            _forgetPass,
            _loginBtn,
            _or,
            _faceAndMail,
            _register(context),
          ],
        ),
      ),
    );
  }

  Widget get _logo {
    return Padding(
      padding: const EdgeInsets.only(top: 60, bottom: 60),
      child: Image.asset("assets/images/book_logo.png", width: 270),
    );
  }

  Widget get _or {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 20),
      child: Text("Or", style: TextStyle(color: Colors.grey)),
    );
  }

  Widget get _faceAndMail {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 35),
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

  Widget _register(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Text(
                "Don't have an account yet?",
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
                      builder: (context) => AccountRegistration(),
                    ),
                  );
                },
                child: Text('Register', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _userTxt {
    return Padding(
      padding: const EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 15),
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

  Widget get _passtxt {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 5),
      child: TextFormField(
        style: TextStyle(fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
          labelText: "Password",
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          suffixIcon: Icon(Icons.visibility_off_outlined, color: Colors.grey),
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

  Widget get _forgetPass {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15, right: 20, bottom: 20),
          child: SizedBox(
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
              child: Text('Forget Password', style: TextStyle(fontSize: 18)),
            ),
          ),
        ),
      ],
    );
  }

  Widget get _loginBtn {
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
          'Log In',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
