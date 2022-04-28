import 'package:flutter/material.dart';

import 'form.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page de connexion Maison de lorraine'),
        backgroundColor: Colors.yellowAccent[100],
        titleTextStyle:
            const TextStyle(color: Colors.blue, fontWeight: FontWeight.w900),
      ),
      backgroundColor: Colors.yellowAccent[100],
      body: const Center(child: MyCustomForm()),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seance n°'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first screen when tapped.
            Navigator.pop(context);
          },
          child: const Text('Revenir !'),
        ),
      ),
    );
  }
}
