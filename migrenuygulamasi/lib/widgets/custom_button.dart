import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final Color colors;
  final onTap;

  CustomButton(this.name, this.colors, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 70,
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        color: colors,
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        onPressed: onTap,
      ),
    );
  }
}
