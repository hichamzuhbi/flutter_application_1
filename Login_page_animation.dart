import 'package:flutter/material.dart';

class EnterAnimation {
  EnterAnimation(this.controller) {
    controller = controller;
    circleSize = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOutBack),
    );
  }
  late AnimationController controller;
  late Animation<double> circleSize;
}
