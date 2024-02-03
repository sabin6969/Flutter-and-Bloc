import 'package:flutter/material.dart';

abstract class LoginEvent {}

class LoginButtonPressedEvent {
  final GlobalKey<FormState> globalKey;
  LoginButtonPressedEvent({required this.globalKey});
}
