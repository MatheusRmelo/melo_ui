import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MeloUIHourField extends StatelessWidget {
  MeloUIHourField(
      {super.key,
      required this.label,
      this.height = 48,
      this.placeholder,
      this.helperText,
      this.observationText,
      this.margin,
      TimeOfDay? initialTime,
      this.readOnly = false,
      this.capitalization = TextCapitalization.sentences,
      this.keyboardType = TextInputType.text,
      this.prefixIcon,
      this.suffixIcon,
      this.formatters,
      this.onChanged,
      this.onPressed,
      this.error,
      this.isDense,
      this.contentPadding,
      required this.controller})
      : initialTime = initialTime ?? TimeOfDay.now();
  final double height;
  final String label;
  final String? placeholder;
  final String? helperText;
  final String? observationText;
  final EdgeInsets? margin;
  final TextEditingController controller;
  final bool readOnly;
  final TextCapitalization capitalization;
  final String? error;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? formatters;
  final TextInputType keyboardType;
  final Function(String? value)? onChanged;
  final Function()? onPressed;
  final bool? isDense;
  final EdgeInsets? contentPadding;
  final TimeOfDay initialTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            inputFormatters: formatters,
            onChanged: onChanged,
            readOnly: readOnly,
            textCapitalization: capitalization,
            onTap: () {
              showTimePicker(
                context: context,
                initialTime: initialTime,
              ).then((value) {
                if (value != null) {
                  controller.text =
                      "${value.hour < 10 ? '0${value.hour}' : value.hour}:${value.minute < 10 ? '0${value.minute}' : value.minute}";
                }
              });
            },
            decoration: InputDecoration(
              isDense: isDense,
              contentPadding: contentPadding,
              helperText: helperText,
              errorText: error,
              hintText: placeholder ?? "__:__",
              prefixIcon: prefixIcon,
              suffixIcon: const Icon(Icons.schedule),
            ),
          ),
        ],
      ),
    );
  }
}
