// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import 'api_call.dart';

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  String? email;
  String? password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: FormHelper.inputFieldWidget(
            context,
            'email',
            'email',
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "L'email ne peut être vide";
              }
              return null;
            },
            (value) {
              email = value;
            },
            textColor: Colors.red,
            borderColor: Colors.blue,
            borderRadius: 10,
            hintColor: Colors.blue, 
          ),
        ),
        FormHelper.inputFieldWidget(
          context,
          'password',
          'password',
          (onValidateVal) {
            if (onValidateVal.isEmpty) {
              return "Le password ne peut être vide";
            }
            return null;
          },
          (value) {
            password = value;
          },
          obscureText: true,
          borderRadius: 10,
          textColor: Colors.blue,
          borderColor: Colors.blue,
          hintColor: Colors.blue,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: FormHelper.submitButton("Connexion", () {
            dynamic validate = _formKey.currentState?.validate();
            if (validate != null && validate) {
              _formKey.currentState?.save();
              Users.login(context, email, password);
            }
          },
              btnColor: Colors.yellow,
              borderColor: Colors.blue,
              txtColor: Colors.blue,
              borderRadius: 10),
        )
      ]),
    );
  }
}
