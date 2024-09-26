import 'package:flutter/material.dart';

class CustomRoundedTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final double borderRadius;
  final Color borderColor;
  final Color focusedBorderColor;
  final bool obscureText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final VoidCallback? toggleVisibility;

  const CustomRoundedTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.borderRadius = 10.0,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = Colors.blue,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.toggleVisibility,
  }) : super(key: key);

  @override
  _CustomRoundedTextFieldState createState() => _CustomRoundedTextFieldState();
}

class _CustomRoundedTextFieldState extends State<CustomRoundedTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : widget.obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: widget.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: widget.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: widget.focusedBorderColor, width: 2.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: _toggleVisibility,
              )
            : widget.suffixIcon,
      ),
    );
  }
}
