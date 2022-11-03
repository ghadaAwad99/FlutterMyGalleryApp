import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key, required this.onPressed, this.color, required this.child,
  }) : super(key: key);
  final Function onPressed;
  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: color ?? Colors.blueAccent)),
        onPressed: () {
          onPressed();
        },
        color: color,
        textColor: Colors.white,
        child: child,
      ),
    );
  }
}