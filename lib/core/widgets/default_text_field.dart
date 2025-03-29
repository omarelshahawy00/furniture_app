import 'package:ecommerce_app/core/theme/colors_manager.dart';
import 'package:ecommerce_app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextField extends StatefulWidget {
  const DefaultTextField({
    this.isPassword,
    this.shadow,
    required this.hintText,
    this.controller,
    this.prefixIcon,
    this.keyboardType,
    this.validator,
    this.maxLines,
    this.inputFormatters,
    this.onChanged,
    this.hintStyle,
    super.key,
    this.suffixIcon,
    this.suffix,
    this.suffixText,
    this.enabled,
    this.contentPadding,
    this.fillColor,
    this.width,
    this.boarderSideColor,
  });

  final String hintText;
  final bool? enabled;
  final double? contentPadding;
  final String? suffixText;
  final TextEditingController? controller;
  final Widget? prefixIcon, suffixIcon, suffix;
  final bool? isPassword;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxLines;
  final TextStyle? hintStyle;
  final List<BoxShadow>? shadow;
  final double? width;
  final Color? boarderSideColor;
  final Color? fillColor;

  @override
  _DefaultTextFieldState createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  final FocusNode _focusNode = FocusNode();
  late Color _fillColor;
  bool showPass = true;

  @override
  void initState() {
    super.initState();
    _fillColor = widget.fillColor ?? ColorsManager.borderFilledColor;

    _focusNode.addListener(() {
      setState(() {
        _fillColor = _focusNode.hasFocus
            ? ColorsManager.borderFoucusColor
            : (widget.fillColor ?? ColorsManager.borderFilledColor);
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      child: TextFormField(
        focusNode: _focusNode,
        enabled: widget.enabled,
        obscureText: showPass && widget.isPassword == true,
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: widget.maxLines ?? 1,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          focusColor: ColorsManager.borderFoucusColor,
          errorMaxLines: 2,
          errorStyle: const TextStyle(height: 0.0),
          disabledBorder: customOutlinedBorder(
              color: widget.boarderSideColor ?? Colors.white),
          prefixIconConstraints:
              const BoxConstraints(maxHeight: 150, maxWidth: 150),
          hintText: widget.hintText,
          prefixIconColor: Colors.grey,
          hintStyle: widget.hintStyle ??
              Styles.regular14.copyWith(color: ColorsManager.hintTextColor),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8),
            child: widget.prefixIcon,
          ),
          suffixIcon: widget.isPassword == true && widget.suffixIcon == null
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPass = !showPass;
                    });
                  },
                  icon: showPass == false
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                )
              : widget.suffixIcon,
          suffixText: widget.suffixText,
          suffix: widget.suffix,
          fillColor: _fillColor,
          filled: true,
          enabledBorder: customOutlinedBorder(color: Colors.transparent),
          focusedBorder: customOutlinedBorder(color: Colors.transparent),
          errorBorder: customOutlinedBorder(color: Colors.red),
          focusedErrorBorder: customOutlinedBorder(color: Colors.red),
          contentPadding:
              EdgeInsets.symmetric(vertical: widget.contentPadding ?? 20),
        ),
      ),
    );
  }
}

OutlineInputBorder customOutlinedBorder({Color? color, double? borderRadius}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color ?? Colors.red),
    borderRadius: const BorderRadius.all(Radius.circular(16)),
  );
}
