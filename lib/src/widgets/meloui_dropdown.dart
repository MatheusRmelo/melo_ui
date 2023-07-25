import 'package:flutter/material.dart';

class MeloUIDropdown extends StatelessWidget {
  final String label;
  final String value;
  final List<String> list;
  final bool hasError;
  final Color? labelColor;
  final Function(String? value) onChanged;

  const MeloUIDropdown(
      {super.key,
      required this.label,
      required this.list,
      required this.onChanged,
      required this.value,
      this.labelColor,
      this.hasError = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 16,
              color: labelColor ??
                  (Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white),
              fontWeight: FontWeight.bold),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
            border: hasError
                ? Border.all(color: Theme.of(context).colorScheme.error)
                : null,
          ),
          height: 48,
          child: DropdownButton<String>(
            isExpanded: true,
            isDense: true,
            value: value,
            dropdownColor: Colors.white,
            style: const TextStyle(color: Colors.black),
            underline: Container(),
            itemHeight: 48,
            onChanged: onChanged,
            items: list
                .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
