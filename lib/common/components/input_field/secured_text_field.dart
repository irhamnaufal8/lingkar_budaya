import 'package:flutter/material.dart';
import 'package:lingkar_budaya/common/resources/colors.dart';
import 'package:lingkar_budaya/common/resources/fonts.dart';

class SecuredTextField extends StatefulWidget {
  final String placeholder;

  SecuredTextField({required this.placeholder});

  @override
  _SecuredTextFieldState createState() => _SecuredTextFieldState();
}

class _SecuredTextFieldState extends State<SecuredTextField> {
  TextEditingController _textEditingController = TextEditingController();
  bool isVisible = false;

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
          obscureText: !isVisible,
          style: Poppins.regular(14),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.placeholder,
            suffixIcon: IconButton(
              icon: Icon(
                isVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  String getValue() {
    return _textEditingController.text;
  }
}
