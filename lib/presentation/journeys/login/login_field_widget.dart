import 'package:flutter/material.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/extension/size_extension.dart';

class LabelFieldWidget extends StatelessWidget {
  final Key? textFieldKey;
  final String label;
  final String hintText;
  final bool isPasswordField;
  final TextEditingController controller;

  const LabelFieldWidget({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.isPasswordField = false,
    this.textFieldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Sizes.dimen_8.h.toDouble()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
          TextField(
            key: textFieldKey,
            obscureText: isPasswordField,
            obscuringCharacter: '*',
            controller: controller,
            style: TextStyle(fontSize: 20, color: Colors.white),
            decoration: InputDecoration(
              hintText: hintText,
            ),
          ),
        ],
      ),
    );
  }
}
