import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MeloUITextField extends StatefulWidget {
  const MeloUITextField(
      {super.key,
      required this.label,
      this.height = 48,
      this.placeholder,
      this.helperText,
      this.observationText,
      this.margin,
      this.isPassword = false,
      this.readOnly = false,
      this.isButton = false,
      this.capitalization = TextCapitalization.sentences,
      this.keyboardType = TextInputType.text,
      this.prefixIcon,
      this.suffixIcon,
      this.formatters,
      this.onChanged,
      this.onPressed,
      this.error,
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
  final bool isButton;
  final TextCapitalization capitalization;
  final String? error;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? formatters;
  final TextInputType keyboardType;
  final Function(String? value)? onChanged;
  final Function()? onPressed;
  @override
  State<MeloUITextField> createState() => _MeloUITextFieldState();
}

class _MeloUITextFieldState extends State<MeloUITextField> {
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    _showPassword = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          widget.isButton
              ? InkWell(
                  onTap: () {
                    if (widget.onPressed != null) {
                      widget.onPressed!();
                    }
                  },
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search_rounded,
                            size: 32,
                            color: Theme.of(context).colorScheme.primary),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text("Endereço e número",
                            style: TextStyle(fontSize: 16))
                      ],
                    ),
                  ),
                )
              : TextField(
                  controller: widget.controller,
                  obscureText: !widget.isPassword ? false : _showPassword,
                  keyboardType: widget.keyboardType,
                  inputFormatters: widget.formatters,
                  onChanged: widget.onChanged,
                  readOnly: widget.readOnly,
                  textCapitalization: widget.capitalization,
                  decoration: InputDecoration(
                      helperText: widget.helperText,
                      errorText: widget.error,
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
                                color: Theme.of(context).primaryColorLight,
                              ))),
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
