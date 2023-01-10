import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../styles/app_color.dart';
import '../styles/app_icon.dart';
import '../styles/app_text_style.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.hintText,
    this.labelText,
    this.errorText,
    this.keyboardType,
    this.obscureText = false,
    this.controller,
    this.maxLength,
    this.textStyle,
    this.maxLines,
    this.onChanged,
    this.suffix,
    this.prefix,
    this.focusNode,
    this.isReadOnly,
    this.validateSuccess,
    this.isFocused,
    this.onTap,
    this.autoFocus,
  }) : super(key: key);

  final String? hintText;
  final String? labelText;
  final String? errorText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  final int? maxLength;
  final int? maxLines;
  final TextStyle? textStyle;
  final ValueChanged<String>? onChanged;
  final Widget? prefix;
  final Widget? suffix;
  final FocusNode? focusNode;
  final bool? validateSuccess;
  final bool? isReadOnly;
  final bool? isFocused;
  final bool? autoFocus;
  final VoidCallback? onTap;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool? obscureText;
  final double kIconPadding = 15;
  bool isChanged = false;

  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
  }

  Widget? buildSuffixIcon() {
    if (widget.obscureText) {
      return GestureDetector(
        dragStartBehavior: DragStartBehavior.down,
        onTap: () {
          setState(() {
            obscureText = !obscureText!;
          });
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kIconPadding),
          child: SizedBox(
            height: kIconPadding,
            width: kIconPadding,
            child: obscureText!
                ? Image.asset(
              AppIcon.visibilityOff,
              color: widget.validateSuccess == true ? AppColor.primaryColor : null,
            )
                : Image.asset(
              AppIcon.visibility,
              color: widget.validateSuccess == true ? AppColor.primaryColor : null,
            ),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
          color: isChanged == true && widget.errorText != null
              ? AppColor.redError
              : widget.isFocused == true
              ? AppColor.primaryColor
              : AppColor.greyBoder),
      borderRadius: BorderRadius.circular(10.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: widget.onTap,
      onChanged: (value) {
        widget.onChanged?.call(value);
        setState(() {
          isChanged = true;
        });
      },
      autofocus: widget.autoFocus ?? false,
      controller: widget.controller,
      obscureText: obscureText!,
      maxLength: widget.maxLength,
      style: widget.textStyle,
      maxLines: widget.maxLines ?? 1,
      minLines: 1,
      readOnly: widget.isReadOnly ?? false,
      focusNode: widget.focusNode,
      textInputAction: TextInputAction.done,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        filled: true,
        errorMaxLines: 3,
        fillColor: isChanged == true && widget.errorText != null
            ? AppColor.greyBg
            : widget.isFocused == true
            ? AppColor.greenValidateSuccessBg
            : AppColor.greyBg,
        border: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(),
        enabledBorder: _buildOutlineInputBorder(),
        errorBorder: _buildOutlineInputBorder(),
        hintText: widget.hintText,
        labelText: widget.labelText,
        errorText: widget.errorText,
        hintStyle: AppTextStyle.smallBlack.copyWith(color: AppColor.greyText),
        labelStyle: AppTextStyle.smallBlack.copyWith(color: AppColor.greyText),
        errorStyle: AppTextStyle.smallBlack.copyWith(color: Colors.red),
        prefixIcon: widget.prefix != null ? Padding(padding: EdgeInsets.symmetric(horizontal: kIconPadding), child: widget.prefix) : null,
        suffixIcon: widget.suffix != null ? Padding(padding: EdgeInsets.symmetric(horizontal: kIconPadding), child: widget.suffix) : buildSuffixIcon(),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
      ),
    );
  }
}