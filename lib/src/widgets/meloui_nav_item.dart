import 'package:flutter/material.dart';

class MeloUINavItem extends StatefulWidget {
  const MeloUINavItem(
      {super.key,
      required this.icon,
      required this.name,
      required this.onPressed,
      this.isActived = false});
  final IconData icon;
  final String name;
  final bool isActived;
  final Function onPressed;

  @override
  State<MeloUINavItem> createState() => _MeloUINavItemState();
}

class _MeloUINavItemState extends State<MeloUINavItem> {
  bool _isMouseOver = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isMouseOver = true),
      onExit: (_) => setState(() => _isMouseOver = false),
      child: GestureDetector(
        onTap: () {
          widget.onPressed();
        },
        child: Container(
          width: double.infinity,
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: widget.isActived || _isMouseOver
                  ? Theme.of(context).highlightColor
                  : null),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: Icon(
                    widget.icon,
                    color: widget.isActived || _isMouseOver
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).hintColor,
                  ),
                ),
                Expanded(
                    child: Text(widget.name,
                        style: TextStyle(
                            color: widget.isActived || _isMouseOver
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).hintColor,
                            fontSize: 16)))
              ]),
        ),
      ),
    );
  }
}
