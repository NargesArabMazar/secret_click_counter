Secret Click Counter
A Flutter package that counts clicks on any widget and displays a dialog with encrypted developers' names after 40 clicks.
Installation
Add the package to your pubspec.yaml:
dependencies:
  secret_click_counter: ^1.0.0

Then run the following command to fetch the package:
flutter pub get

Usage
To use the package, wrap any widget with a GestureDetector and call SecretClickCounter().handleClick(context) on tap. Below is a complete example:
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

Click Counting: Triggers a dialog after exactly 40 clicks.
Security: Developers' names are encrypted for protection.
Flexibility: Easily integrates with any Flutter widget.

Contributing
Contributions are welcome! Please submit a pull request or open an issue on the GitHub repository.
License
This package is licensed under the MIT License. See the LICENSE file for details.
