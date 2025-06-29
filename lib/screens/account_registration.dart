// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:homeworks_01/data/auth_share_pref.dart';
import 'package:homeworks_01/routes/app_routes.dart';
import 'package:homeworks_01/screens/social_login.dart';
import 'package:homeworks_01/widgets/logo_widget.dart';

class AccountRegistration extends StatefulWidget {
  const AccountRegistration({super.key});

  @override
  State<AccountRegistration> createState() => _accountStateRegistration();
}

class _accountStateRegistration extends State<AccountRegistration> {
  bool _isValidMail = false;

  bool _isValidPass = false;

  bool _isValidFullName = false;

  bool _isValidUsername = false;

  bool _obscureText = false;

  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // @override
  // void dispose(){
  //   _usernameController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body);
  }

  Widget get _body {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _logo,
            _fullName,
            _userName,
            _email,
            _password,
            _createBtn,
            _or,
            SocialLogin(),
            _login(context),
          ],
        ),
      ),
    );
  }

  Widget get _logo {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 0),
        child: LogoWidget(),
      ),
    );
  }

  Widget get _fullName {
    return Padding(
      padding: EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 20),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "Please input fullname!";
          }
          return null;
        },
        controller: _fullnameController,
        onChanged: (value) {
          final isValidName = RegExp(
            r'^[a-zA-Z]+(?: [a-zA-Z]+)+$',
          ).hasMatch(value.trim());

          setState(() {
            _isValidFullName = isValidName;
          });
        },
        style: TextStyle(fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
          labelText: "Fullname",
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          suffixIcon:
              _isValidFullName
                  ? Icon(Icons.check_circle, color: Colors.green)
                  : Icon(Icons.check_circle),
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
      padding: EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 20),
      child: TextFormField(
        controller: _usernameController,
        style: TextStyle(fontSize: 15, color: Colors.black),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please input username!";
          }
          return null;
        },
        onChanged: (value) {
          final isValidUsername = RegExp(
            r'^[a-zA-Z0-9._]{3,20}$',
          ).hasMatch(value);

          setState(() {
            _isValidUsername = isValidUsername;
          });
        },
        decoration: InputDecoration(
          labelText: "Username",
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          suffixIcon:
              _isValidUsername
                  ? Icon(Icons.check_circle, color: Colors.green)
                  : Icon(Icons.check_circle),

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
      padding: EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 20),
      child: TextFormField(
        controller: _emailController,
        style: TextStyle(fontSize: 15, color: Colors.black),
        onChanged: (value) {
          if (value.contains("@")) {
            setState(() {
              _isValidMail = true;
            });
          } else {
            setState(() {
              _isValidMail = false;
            });
          }
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "Please input email!";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Email",
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          suffixIcon:
              _isValidMail
                  ? Icon(Icons.check_circle, color: Colors.green)
                  : Icon(Icons.check_circle),
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
      padding: EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 35),
      child: TextFormField(
        style: TextStyle(fontSize: 15, color: Colors.black),
        onChanged: (value) {
          if (value.length < 6) {
            setState(() {
              _isValidPass = true;
            });
          } else {
            setState(() {
              _isValidPass = false;
            });
          }
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "Please input password!";
          }

          if (_isValidPass) {
            return "Six digits or more must be entered!";
          }
          return null;
        },
        obscureText: _obscureText,
        controller: _passwordController,
        decoration: InputDecoration(
          labelText: "Password",
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          suffixIcon: GestureDetector(
            child:
                _obscureText
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility, color: Colors.green),
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
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
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            String fullname = _fullnameController.text;
            String username = _usernameController.text;
            String email = _emailController.text;
            String password = _passwordController.text;

            AppRoutes.key.currentState?.pushReplacementNamed(
              AppRoutes.mainScreen,
            );

            AuthSharePref.register(fullname, username, email, password);
          } else {}
        },
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
                  AppRoutes.key.currentState?.pushReplacementNamed(
                    AppRoutes.loginScreen,
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
