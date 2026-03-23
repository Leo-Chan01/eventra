import 'package:flutter/material.dart';

class EventraEmailTextField extends StatefulWidget {
  const EventraEmailTextField({super.key});

  @override
  State<EventraEmailTextField> createState() => _EventraEmailTextFieldState();
}

class _EventraEmailTextFieldState extends State<EventraEmailTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Enter your email address',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
