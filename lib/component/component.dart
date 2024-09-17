// components.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget buildCustomTextField({
  required TextEditingController controller,
  required String labelText,
  TextInputType inputType = TextInputType.text,
}) {
  return TextField(
    controller: controller,
    keyboardType: inputType,
    inputFormatters: inputType == TextInputType.number
        ? [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*'))]
        : [],
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.blueGrey),
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.blue),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
    ),
  );
}

Widget buildElevatedButton({
  required VoidCallback onPressed,
  required String label,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(label),
  );
}
