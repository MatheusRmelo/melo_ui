import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MeloUIDateField extends StatelessWidget {
  MeloUIDateField(
      {super.key,
      required this.label,
      this.height = 48,
      this.placeholder,
      this.helperText,
      this.observationText,
      this.margin,
      DateTime? initialDate,
      DateTime? firstDate,
      DateTime? lastDate,
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
      this.locale,
      required this.controller})
      : initialDate = initialDate ?? DateTime.now(),
        firstDate = firstDate ?? DateTime(2000),
        lastDate = lastDate ?? DateTime(2090);
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
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Locale? locale;

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
              showDatePicker(
                context: context,
                initialDate: initialDate,
                firstDate: firstDate,
                lastDate: lastDate,
                locale: locale,
              ).then((value) {
                if (value != null) {
                  controller.text = DateFormat('dd/MM/yyyy').format(value);
                }
              });
            },
            decoration: InputDecoration(
              isDense: isDense,
              contentPadding: contentPadding,
              helperText: helperText,
              errorText: error,
              hintText: placeholder ?? "dd/mm/aaaa",
              prefixIcon: prefixIcon,
              suffixIcon: const Icon(Icons.date_range),
            ),
          ),
        ],
      ),
    );
  }
}
