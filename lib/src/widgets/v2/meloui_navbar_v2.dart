import 'package:flutter/material.dart';
import 'package:melo_ui/melo_ui.dart';

class MeloUINavItemV2 extends StatefulWidget {
  const MeloUINavItemV2(
      {super.key,
      required this.icon,
      required this.name,
      required this.onPressed,
      this.isActived = false,
      this.iconColor,
      this.textColor});
  final IconData icon;
  final String name;
  final bool isActived;
  final Color? iconColor;
  final Color? textColor;
  final Function onPressed;

  @override
  State<MeloUINavItemV2> createState() => _MeloUINavItemV2State();
}

class _MeloUINavItemV2State extends State<MeloUINavItemV2> {
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
        child: Stack(children: [
          if (widget.isActived) ...{
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 8,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16))),
              ),
            )
          },
          Container(
            width: double.infinity,
            height: context.height * 0.1,
            // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            // margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: _isMouseOver ? Theme.of(context).highlightColor : null),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    color: widget.isActived || _isMouseOver
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).hintColor,
                    size: context.height * 0.04,
                  ),
                  SizedBox(height: context.height * 0.01),
                  Text(widget.name,
                      style: TextStyle(
                          color: widget.isActived || _isMouseOver
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).hintColor,
                          fontSize: 16))
                ]),
          ),
        ]),
      ),
    );
  }
}
