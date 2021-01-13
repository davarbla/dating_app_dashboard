import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  // Variables
  final Widget child;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double borderRadius;

  DefaultButton(
      {@required this.child,
      @required this.onPressed,
      this.width,
      this.height,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 45,
      child: RaisedButton(
        child: child,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 28.0)),
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
      ),
    );
  }
}
