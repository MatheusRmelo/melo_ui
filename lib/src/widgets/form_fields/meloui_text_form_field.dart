import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MelouiTextFormField extends StatefulWidget {
  const MelouiTextFormField(
      {super.key,
      required this.label,
      this.height = 48,
      this.placeholder,
      this.helperText,
      this.observationText,
      this.margin,
      this.isPassword = false,
      this.readOnly = false,
      this.capitalization = TextCapitalization.sentences,
      this.prefixIcon,
      this.suffixIcon,
      required this.validators,
      this.formatters,
      this.onChanged,
      this.onPressed,
      this.controller});
  final double height;
  final String label;
  final String? placeholder;
  final String? helperText;
  final String? observationText;
  final EdgeInsets? margin;
  final TextEditingController? controller;
  final bool isPassword;
  final bool readOnly;
  final TextCapitalization capitalization;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<String?> validators;
  final List<TextInputFormatter>? formatters;
  final Function(String? value)? onChanged;
  final Function()? onPressed;
  @override
  State<MelouiTextFormField> createState() => _MelouiTextFormFieldState();
}

class _MelouiTextFormFieldState extends State<MelouiTextFormField> {
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    _showPassword = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 64,
            child: TextFormField(
              controller: widget.controller,
              obscureText: !widget.isPassword ? false : _showPassword,
              inputFormatters: widget.formatters,
              onChanged: widget.onChanged,
              readOnly: widget.readOnly,
              validator: (value) {
                for (var e in widget.validators) {
                  if (e != null) return e;
                }
                return null;
              },
              textCapitalization: widget.capitalization,
              decoration: InputDecoration(
                  helperText: widget.helperText,
                  hintText: widget.placeholder,
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: !widget.isPassword
                      ? widget.suffixIcon
                      : IconButton(
                          onPressed: () {
                            setState(() => _showPassword = !_showPassword);
                          },
                          icon: Icon(
                            _showPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.red,
                          ))),
            ),
          ),
          if (widget.observationText != null)
            Container(
              padding: const EdgeInsets.all(8),
              child: Text(widget.observationText!,
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
            )
        ],
      ),
    );
  }
}
