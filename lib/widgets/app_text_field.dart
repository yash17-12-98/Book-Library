import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final String? title;
  final String? hintText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? focus;
  final bool autofocus;
  final bool isReadOnly;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final bool isSecure;
  final bool viewBorder;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final Function(String)? onFieldSubmitted;

  const AppTextField(
      {super.key,
      this.validator,
      this.title,
      this.controller,
      this.hintText,
      this.onChanged,
      this.inputFormatters,
      this.prefixIcon,
      this.keyboardType,
      this.suffixIcon,
      this.isSecure = false,
      this.focus,
      this.isReadOnly = false,
      this.onTap,
      this.onFieldSubmitted,
      this.textInputAction,
      this.autofocus = false,
      this.errorText,
      this.viewBorder = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toString(), style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: 5),
        TextFormField(
          autofocus: autofocus,
          readOnly: isReadOnly,
          validator: validator,
          onTap: onTap,
          inputFormatters: inputFormatters,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          obscureText: isSecure,
          keyboardType: keyboardType,
          onChanged: onChanged,
          textInputAction: textInputAction ?? TextInputAction.done,
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.start,
          autocorrect: false,
          style:
              Theme.of(context).textTheme.displayLarge?.copyWith(height: 1.0),
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(left: 10, top: 5.0, bottom: 5.0),
              hintText: hintText,
              errorText: errorText,
              errorMaxLines: 2,
              enabledBorder: OutlineInputBorder(
                borderSide:
                    viewBorder ? const BorderSide(width: 2.0) : BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    viewBorder ? const BorderSide(width: 2.0) : BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide:
                    viewBorder ? const BorderSide(width: 2.0) : BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    viewBorder ? const BorderSide(width: 2.0) : BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon),
        ),
      ],
    );
  }
}
