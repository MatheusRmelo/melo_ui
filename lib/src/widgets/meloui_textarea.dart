import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MeloUITextArea extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController? controller;
  final Function(String? value)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final bool obscureText;
  final bool hasError;
  final double fontSize;

  const MeloUITextArea(
      {super.key,
      required this.label,
      this.controller,
      this.onChanged,
      this.prefixIcon,
      this.suffixIcon,
      this.keyboardType,
      this.placeholder = "",
      this.obscureText = false,
      this.inputFormatters = const [],
      this.hasError = false,
      this.fontSize = 16});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              color: Theme.of(context).hintColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: TextFormField(
            onChanged: onChanged,
            controller: controller,
            maxLines: null,
            obscureText: obscureText,
            minLines: 4,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType ?? TextInputType.multiline,
            style: TextStyle(
              color: Colors.black,
              fontSize: fontSize,
            ),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(style: BorderStyle.none, width: 0),
                    borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.all(16),
                hintText: placeholder),
          ),
        ),
      ],
    );
  }
}
