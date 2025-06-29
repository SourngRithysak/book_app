import 'package:flutter/material.dart';
import 'package:homeworks_01/data/auth_share_pref.dart';
import 'package:homeworks_01/routes/app_routes.dart';
import 'package:homeworks_01/screens/account_options_screen.dart';
import 'package:homeworks_01/screens/social_login.dart';
import 'package:homeworks_01/widgets/logo_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginStateScreen();
}

class _LoginStateScreen extends State<LoginScreen> {
  bool _isValidEmail = false;

  bool _isValidPass = false;

  bool _obscureText = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _logo,
              SizedBox(height: 25),
              _emailTxt,
              _passtxt,
              _forgetPass,
              _loginBtn(context),
              _or,
              SocialLogin(),
              _register(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _logo {
    return Padding(
      padding: const EdgeInsets.only(top: 60, bottom: 60),
      child: LogoWidget(),
    );
  }

  Widget get _or {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 20),
      child: Text("Or", style: TextStyle(color: Colors.grey)),
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
                  AppRoutes.key.currentState?.pushReplacementNamed(
                    AppRoutes.accountRegistration,
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

  Widget get _emailTxt {
    return Padding(
      padding: EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 20),
      child: TextFormField(
        controller: _emailController,
        style: TextStyle(fontSize: 15, color: Colors.black),
        onChanged: (value) {
          if (value.contains("@")) {
            setState(() {
              _isValidEmail = true;
            });
          } else {
            setState(() {
              _isValidEmail = false;
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
              _isValidEmail
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

  Widget get _passtxt {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 5),
      child: TextFormField(
        controller: _passwordController,
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
        style: TextStyle(fontSize: 15, color: Colors.black),
        obscureText: _obscureText,
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

  Widget _loginBtn(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width,
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
            String email = _emailController.text;
            String password = _passwordController.text;

            AppRoutes.key.currentState?.pushReplacementNamed(
              AppRoutes.mainScreen,
            );

            AuthSharePref.login(email, password);
          } else {}
        },
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
