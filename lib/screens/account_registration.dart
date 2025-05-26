// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class AccountRegistration extends StatefulWidget{
  const AccountRegistration({super.key});

  @override
  State<AccountRegistration> createState() => _accountStateRegistration();
}

class _accountStateRegistration extends State<AccountRegistration>{

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
            _password
          ],
        ),
      ),
    );
  }

  Widget get _logo{
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 60, bottom: 10),
        child: Image.asset("assets/images/book_logo.png", width: 270),
      ),
    );
  }

  Widget get _fullName{
    return Padding(
      padding: EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 15),
      child: TextFormField(
        style: TextStyle(fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
          labelText: "Fullname",
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Colors.black
          ),
          suffixIcon: Icon(Icons.close, color: Colors.grey,),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey, width: 1)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey, width: 1)
          )
        ),
      ),
    );
  }

  Widget get _userName{
    return Padding(
      padding: EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 15),
      child: TextFormField(
        style: TextStyle(fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
          labelText: "Username",
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Colors.black
          ),
          suffixIcon: Icon(Icons.close, color: Colors.grey,),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey, width: 1)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey, width: 1)
          )
        ),
      ),
    );
  }

  Widget get _email{
    return Padding(
      padding: EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 15),
      child: TextFormField(
        style: TextStyle(fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
          labelText: "Email",
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Colors.black
          ),
          suffixIcon: Icon(Icons.close, color: Colors.grey,),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey, width: 1)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey, width: 1)
          )
        ),
      ),
    );
  }

  Widget get _password{
    return Padding(
      padding: EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 15),
      child: TextFormField(
        style: TextStyle(fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
          labelText: "Password",
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Colors.black
          ),
          suffixIcon: Icon(Icons.visibility_off, color: Colors.grey,),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey, width: 1)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey, width: 1)
          )
        ),
      ),
    );
  }
}