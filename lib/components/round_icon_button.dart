import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.child, this.onPressed});
  final Widget? child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: child,
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 45,
        height: 45,
      ),
      shape: CircleBorder(),
      fillColor: Colors.amber,
      onPressed: onPressed,
    );
  }
}
