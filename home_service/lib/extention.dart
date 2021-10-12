import 'package:flutter/material.dart';

extension OnPressed on Widget {
  Widget ripple(Function() onPressed, {required borderRadius}) {
    return Stack(
      fit: StackFit.expand,
      children: [
        this,
        Positioned(
          top: 0,
          left: 0,
          bottom: 0,
          right: 0,
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(borderRadius),
            child: InkWell(
              onTap: onPressed,
              splashColor: Colors.grey,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          
        ),
      ],
    );
  }
}
