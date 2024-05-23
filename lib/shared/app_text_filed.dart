import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_firebase/core/utils/palette.dart';

class AppTextField extends StatefulWidget {
  const AppTextField(
      {Key? key,
      this.labelExtender,
      this.height,
      this.labelStyle,
      this.isPassword = false,
      this.prefixText,
      this.label,
      this.controller,
      this.inputType = TextInputType.text,
      this.isInputLabel = false,
      this.color = Colors.black,
      this.hintText,
      this.textColor = const Color(0xFFB8B8B8),
      this.maxLine,
      this.minLine,
      this.isReadOnly = false,
      this.onChanged,
      this.validator,
      this.inputFormatters,
      this.fillColor = false,
      this.obscure = false,
      this.textFieldColor,
      this.width,
      this.icon,
      this.onFieldSubmitted,
      this.autoFocus = false})
      : super(key: key);
  final String? label;
  final double? width;
  final double? height;
  final bool fillColor;
  final TextStyle? labelStyle;
  final bool autoFocus;
  final String? hintText;
  final bool isInputLabel;
  final TextEditingController? controller;
  final TextInputType inputType;
  final Color color;
  final Color textColor;
  final int? maxLine;
  final int? minLine;
  final bool isReadOnly;
  final bool obscure;
  final bool isPassword;
  final String? icon;
  final Color? textFieldColor;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? prefixText;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? labelExtender;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool isObscure;
  @override
  void initState() {
    isObscure = widget.obscure;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.label!,
                    style: widget.labelStyle == null
                        ? TextStyle(
                            color: Colors.black,
                            fontFamily: "Inter",
                            fontSize: 16,
                            fontWeight: FontWeight.w800)
                        : widget.labelStyle,
                  ),
                  widget.labelExtender != null
                      ? widget.labelExtender!
                      : Container()
                ],
              ),
            if (widget.label != null) const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: widget.textFieldColor,
              ),
              child: TextFormField(
                
                onFieldSubmitted: widget.onFieldSubmitted,
                autofocus: widget.autoFocus,
                validator: widget.validator,
                inputFormatters: widget.inputFormatters,
                onChanged: widget.onChanged,
                readOnly: widget.isReadOnly,
                obscureText: isObscure,
                minLines: widget.obscure ? null : widget.minLine,
                maxLines: widget.obscure ? 1 : widget.maxLine,
                cursorColor: widget.color,
                controller: widget.controller,
                keyboardType: widget.inputType,
                style: TextStyle(
                  color: Palette.black,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                    prefixIcon: widget.icon != null
                        ? Padding(
                            padding: const EdgeInsets.only(right: 12, left: 22),
                            child: SvgPicture.asset(
                              widget.icon!,
                              width: 30,
                              height: 30,
                            ),
                          )
                        : null,
                    errorStyle: TextStyle(
                        fontSize: 8,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w400),
                    suffixIcon: widget.isPassword
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                            icon: Icon(
                              isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black,
                            ))
                        : null,
                    prefixText: widget.prefixText,
                    filled: widget.fillColor,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: (widget.maxLine ?? 1) > 1 ? 10 : 0),
                    fillColor:
                        widget.fillColor ? Palette.white : Colors.transparent,
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                        color: Color(0xFF71747D),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400),
                    errorMaxLines: 2,
                    enabledBorder: OutlineInputBorder(
                        borderSide: widget.fillColor
                            ? BorderSide.none
                            : BorderSide(color: widget.color),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: widget.fillColor
                            ? BorderSide.none
                            : BorderSide(color: widget.color),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        )),
                    border: OutlineInputBorder(
                        borderSide: widget.fillColor
                            ? BorderSide.none
                            : BorderSide(color: widget.color),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
