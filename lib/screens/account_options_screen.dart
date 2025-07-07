import 'package:flutter/material.dart';
import 'package:homeworks_01/routes/app_routes.dart';
import 'package:homeworks_01/widgets/logo_widget.dart';

class AccountOptionsScreen extends StatelessWidget {
  const AccountOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoWidget(),
            SizedBox(height: 170),
            _createAccountBtn(context),
            SizedBox(height: 20),
            _loginBtn(context),
          ],
        ),
      ),
    );
  }

  // Widget get _logo {
  //   return Image.asset("assets/images/book_logo.png", width: 310);
  // }

  Widget _createAccountBtn(BuildContext context) {
    return SizedBox(
      width: 340,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        onPressed: () {
          AppRoutes.key.currentState?.pushReplacementNamed(
            AppRoutes.accountRegistration,
          );
        },
        child: Text('Create Account'),
      ),
    );
  }

  Widget _loginBtn(BuildContext context) {
    return SizedBox(
      width: 340,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.red,
          side: const BorderSide(color: Colors.red, width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        onPressed: () {
          AppRoutes.key.currentState?.pushReplacementNamed(
            AppRoutes.mainScreen,
          );
        },
        child: const Text('Log In as Guest'),
      ),
    );
  }
}
