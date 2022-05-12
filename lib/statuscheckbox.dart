import 'package:flutter/material.dart';

enum StatutCandidat {encours, refuse, admis}

class StatusCheckBox extends StatefulWidget {
  const StatusCheckBox({ Key? key }) : super(key: key);
  
  @override
  State<StatusCheckBox> createState() => _StatusCheckBoxState();
}

class _StatusCheckBoxState extends State<StatusCheckBox> {
  StatutCandidat? _status = StatutCandidat.encours;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        ListTile(
          title: const Text('en cours'),
          leading: Radio<StatutCandidat>(
            value: StatutCandidat.encours,
            groupValue: _status,
            onChanged: (StatutCandidat? value) {
              setState(() {
                _status = value;
              });
            })
        ),

        ListTile(
          title: const Text('refuse'),
          leading: Radio<StatutCandidat>(
            value: StatutCandidat.refuse,
            groupValue: _status,
            onChanged: (StatutCandidat? value) {
              setState(() {
                _status = value;
              });
            })
        ),

        ListTile(
          title: const Text('admis'),
          leading: Radio<StatutCandidat>(
            value:StatutCandidat.admis,
            groupValue: _status,
            onChanged: (StatutCandidat? value) {
              setState(() {
                _status = value;
              });
            }
            )
        ),
        Text("$_status")
      ]      
    );
  }
}