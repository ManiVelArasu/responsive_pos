import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveCustomTextField extends StatefulWidget {
  final String? title;
  final String? errorText;
  final bool isPassword;
  final TextEditingController? controller;
  final Function(String val)? onChanged;
  final double? width;
  final double? height;
  const ResponsiveCustomTextField({
    super.key,
    this.title,
    this.errorText,
    this.isPassword = false,
    this.controller,
    this.onChanged,
    this.width,
    this.height,
  });

  @override
  State<ResponsiveCustomTextField> createState() =>
      _ResponsiveCustomTextFieldState();
}

class _ResponsiveCustomTextFieldState extends State<ResponsiveCustomTextField> {
  bool isPassVisible = false;
  bool isFieldEmpty = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        if (widget.title != null)
          Container(
            margin: EdgeInsets.only(
                left: size.width * 0.01, bottom: size.height * 0.01),
            height: size.height * 0.03,
            width: double.infinity,
            child: Text(widget.title ?? '',
                style: TextStyle(
                  fontSize: (size.height + size.width) / 2 * 0.03 / 2,
                )),
          ),
        Container(
          height: widget.height ?? size.height * 0.06,
          width: widget.width ?? size.width * 0.30,
          // padding: EdgeInsets.all(size.width * 0.001),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            onChanged: (value) {
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
              setState(() {
                isFieldEmpty = value.isEmpty;
              });
            },
            obscureText: widget.isPassword && !isPassVisible,
            style: TextStyle(
              fontSize: (size.height + size.width) / 2 * 0.03 / 2,
            ),
            decoration: InputDecoration(
                counterText: "",
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.only(
                    left: size.width * 0.01,
                    right: size.width * 0.01,
                    top: size.height * 0.01,
                    bottom: size.height * 0.01),
                prefixStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                suffixIcon: widget.isPassword
                    ? IconButton(
                  icon: Icon(
                    !isPassVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    size: (size.height + size.width) / 2 * 0.02,
                  ),
                  onPressed: () {
                    setState(
                          () {
                        isPassVisible = !isPassVisible;
                      },
                    );
                  },
                )
                    : null),
            controller: widget.controller,
            validator: (value) {
              return isFieldEmpty ? 'Field cannot be empty' : null;
            },
          ),
        ),
        if (widget.errorText != null)
          Container(
            margin: EdgeInsets.only(left: size.width * 0.01),
            height: size.height * 0.02,
            width: double.infinity,
            child: Text(widget.errorText ?? '',
                style: TextStyle(
                    fontSize: (size.height + size.width) / 2 * 0.03 / 3,
                    color: Colors.red)),
          ),
      ],
    );
  }
}
