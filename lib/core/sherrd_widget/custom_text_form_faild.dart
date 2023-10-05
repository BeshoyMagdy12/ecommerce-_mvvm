import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final String? hintText;
  final bool? enabled;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final   bool obscureText;

  final void Function(String)? onChanged;

  const CustomTextFormField(
      {Key? key,
        this.prefixIcon,
        this.suffixIcon,
        this.validator,
        this.hintText,
        this.enabled,
        this.keyboardType, this.controller,
        this.obscureText=false,
        this.onChanged,
        })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20).w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(0, 1),
          ),
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextFormField(
        onChanged:onChanged ,
        obscureText:obscureText ,
        controller:controller ,
        enabled: enabled,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,

          hintText: hintText,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}
