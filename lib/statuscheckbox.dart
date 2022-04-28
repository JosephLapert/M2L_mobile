import 'package:flutter/material.dart';

enum StatutCandidat {refuse, admis}

class StatusCheckBox extends StatefulWidget {
  const StatusCheckBox({ Key? key }) : super(key: key);

  @override
  State<StatusCheckBox> createState() => _StatusCheckBoxState();
}

class _StatusCheckBoxState extends State<StatusCheckBox> {
  StatutCandidat? _candidat = StatutCandidat.refuse;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('refuse'),
          leading: Radio<StatutCandidat>(
            value: StatutCandidat.refuse,
            groupValue: _candidat,
            onChanged: (StatutCandidat? value) {
              setState(() {
                _candidat = value;
              });
            })
        ),

        ListTile(
          title: const Text('admis'),
          leading: Radio<StatutCandidat>(
            value:StatutCandidat.admis,
            groupValue: _candidat,
            onChanged: (StatutCandidat? value) {
              setState(() {
                _candidat = value;
              });
            }
            )
        )
      ]      
    );
  }
}