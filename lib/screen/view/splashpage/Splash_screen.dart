import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../homepage/first.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 6),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => FirstScreen(),
          ),
        );
      },
    );
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://i.pinimg.com/originals/83/c8/9a/83c89a40ae221e05fa675cc73d487cad.gif'),
                fit: BoxFit.cover)),
      ),
    );
  }
}
