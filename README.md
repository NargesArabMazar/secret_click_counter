Secret Click Counter
A Flutter package that counts clicks on any widget and shows a dialog with developers' names after 40 clicks.
Installation
Add this to your pubspec.yaml:
dependencies:
  secret_click_counter: ^1.0.0

Then run:
flutter pub get

Usage
Wrap any widget with a GestureDetector and call SecretClickCounter().handleClick(context) on tap:
import 'package:flutter/material.dart';
import 'package:secret_click_counter/secret_click_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Test Secret Click Counter')),
        body: Center(
          child: GestureDetector(
            onTap: () => SecretClickCounter().handleClick(context),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Tap Me 40 Times!',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Features

Counts clicks and shows a dialog after 40 clicks.
Encrypts developers' names for security.
Easy to integrate with any Flutter widget.

