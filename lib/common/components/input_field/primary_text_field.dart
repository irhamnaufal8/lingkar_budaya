import 'package:flutter/material.dart';
import 'package:lingkar_budaya/common/resources/colors.dart';
import 'package:lingkar_budaya/common/resources/fonts.dart';

class PrimaryTextField extends StatefulWidget {
  final String placeholder;

  PrimaryTextField({required this.placeholder});

  @override
  _PrimaryTextFieldState createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: BaseColors.inputGrey,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: TextField(
          onChanged: (value) {
            setState(() {
              getText(value);
            });
            // _textEditingController.text = value;
          },
          controller: _textEditingController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.placeholder,
          ),
          style: Poppins.regular(14),
        ),
      ),
    );
  }

  String getValue() {
    return _textEditingController.text;
  }

  String getText(String text) {
    return text;
  }
}
