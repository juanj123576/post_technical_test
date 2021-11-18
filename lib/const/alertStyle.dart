import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'colors.dart';

var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: true,
    isOverlayTapDismiss: false,
    descStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
    animationDuration: const Duration(milliseconds: 500),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
      side: const BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
      color: basicColor,
    ),
    constraints: const BoxConstraints.expand(width: 300),
    //First to chars "55" represents transparency of color
    overlayColor: const Color(0x55000000),
    alertElevation: 0,
    alertAlignment: Alignment.center);
