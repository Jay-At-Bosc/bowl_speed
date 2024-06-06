// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({super.key, required this.label, this.onTap});

  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      tileColor: Colors.amber[100],
      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      onTap: onTap,
    );
  }
}