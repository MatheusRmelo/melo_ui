import 'package:flutter/material.dart';

class MeloUIButton extends StatelessWidget {
  const MeloUIButton(
      {super.key,
      this.isLoading = false,
      this.isDisabled = false,
      this.width,
      this.height = 40,
      this.margin,
      this.icon,
      this.textColor = Colors.white,
      required this.title,
      required this.onPressed});
  final bool isLoading;
  final bool isDisabled;
  final String title;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final IconData? icon;
  final Color textColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      margin: margin ?? const EdgeInsets.symmetric(vertical: 24),
      child: ElevatedButton(
          onPressed: isLoading || isDisabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
              disabledMouseCursor: SystemMouseCursors.forbidden,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          child: isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 24,
                        height: 24,
                        margin: const EdgeInsets.only(right: 8),
                        child: CircularProgressIndicator(
                          color: Theme.of(context)
                              .primaryColorLight
                              .withOpacity(0.6),
                        )),
                    Text("Carregando...",
                        style: TextStyle(
                            color: Theme.of(context)
                                .primaryColorLight
                                .withOpacity(0.6)))
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null)
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: Icon(
                          icon,
                          size: 24,
                          color: textColor,
                        ),
                      ),
                    Text(
                      title,
                      style: TextStyle(color: textColor),
                    )
                  ],
                )),
    );
  }
}
