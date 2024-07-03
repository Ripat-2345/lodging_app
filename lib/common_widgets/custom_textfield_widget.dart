import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String labelText;
  final TextStyle labelTextStyle;
  final double height;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextStyle style;
  final String hintText;
  final TextStyle hintStyle;
  final Color borderColor;
  final Color focusedBorderColor;
  final TextEditingController? controller;
  final bool isReadOnly;
  const CustomTextFieldWidget({
    super.key,
    required this.labelText,
    required this.labelTextStyle,
    this.height = 45,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    required this.style,
    this.hintText = "",
    required this.hintStyle,
    this.borderColor = const Color(0XFF0C356A),
    this.focusedBorderColor = const Color(0XFFFFC436),
    this.controller,
    this.isReadOnly = false,
  });

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool isShowPassword = true;
  bool isReadOnly = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText.isNotEmpty
            ? Text(
                widget.labelText,
                style: widget.labelTextStyle,
              )
            : const SizedBox(),
        const SizedBox(height: 5),
        SizedBox(
          height: widget.height,
          child: TextField(
            controller: widget.controller,
            obscureText: widget.obscureText ? isShowPassword : false,
            keyboardType: widget.keyboardType,
            style: widget.style,
            readOnly: widget.isReadOnly ? isReadOnly : false,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: widget.hintStyle,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: widget.borderColor, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: widget.focusedBorderColor, width: 1),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              suffixIcon: widget.obscureText
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isShowPassword = !isShowPassword;
                        });
                      },
                      icon: isShowPassword
                          ? const Icon(
                              Icons.remove_red_eye_sharp,
                              size: 24,
                            )
                          : const Icon(
                              Icons.remove_red_eye_outlined,
                              size: 24,
                            ),
                    )
                  : const SizedBox(),
            ),
          ),
        ),
      ],
    );
  }
}
