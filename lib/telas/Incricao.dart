import 'package:flutter/material.dart';

class Incricao extends StatefulWidget {
  @override
  _IncricaoState createState() => _IncricaoState();
}

class _IncricaoState extends State<Incricao> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
        child: Text(
          "Inscrições",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}