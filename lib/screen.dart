import 'package:flutter/material.dart';

import 'form.dart';

import 'statuscheckbox.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page de connexion Maison de lorraine'),
      ),
      body: const Center(
        child: MyCustomForm()
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/third');
            },
            child: const Text('Passer au Third Screen'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Revenir!'),
          ),
        ],
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Statut d'inscription de"),
      ),
      body: Column(
        children: <Widget> [
          const StatusCheckBox(),
          Center (

          child: ElevatedButton(
          onPressed: () {
            // Navigate back to first screen when tapped.
            Navigator.pop(context);
          },
          child: const Text('Soumettre statut!'),
          ),
          )
        ]
      ),
    );
  }
}