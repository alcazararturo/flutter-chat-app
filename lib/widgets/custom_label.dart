import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  final String msg;
  final String text;
  final String ruta;
  const CustomLabel(
      {Key key, @required this.msg, @required this.text, @required this.ruta})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(this.msg,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.w300)),
          SizedBox(height: 10),
          GestureDetector(
            child: Text(
              this.text,
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, this.ruta);
            },
          ),
        ],
      ),
    );
  }
}
