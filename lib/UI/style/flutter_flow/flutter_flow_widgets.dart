import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
// import 'package:auto_size_text/auto_size_text.dart';

class FFButtonOptions {
  FFButtonOptions({
    required this.textStyle,
    this.elevation,
    required this.height,
    required this.width,
    this.padding,
    this.color = Colors.white,
    this.disabledColor,
    this.disabledTextColor,
    this.splashColor,
    this.iconSize,
    this.iconColor,
    this.iconPadding,
    this.borderRadius = 28,
    this.borderSide = BorderSide.none,
  });

  TextStyle textStyle;
  double? elevation;
  double height;
  double width;
  EdgeInsetsGeometry? padding;
  Color color;
  Color? disabledColor;
  Color? disabledTextColor;
  Color? splashColor;
  double? iconSize;
  Color? iconColor;
  EdgeInsetsGeometry? iconPadding;
  double borderRadius;
  BorderSide borderSide;
}

class FFButtonWidget extends StatelessWidget {
  FFButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.iconData,
    required this.options,
  }) : super(key: key);

  final String text;
  Widget? icon;
  IconData? iconData;
  final VoidCallback onPressed;
  final FFButtonOptions options;

  @override
  Widget build(BuildContext context) {
    Widget textWidget = Text(
      text,
      style: options.textStyle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
    if (icon != null || iconData != null) {
      textWidget = Flexible(child: textWidget);
      return Container(
        height: options.height,
        width: options.width,
        child: RaisedButton.icon(
          icon: Padding(
            padding: options.iconPadding ?? EdgeInsets.zero,
            child: icon ??
                FaIcon(
                  iconData,
                  size: options.iconSize,
                  color: options.iconColor ?? options.textStyle.color,
                ),
          ),
          label: textWidget,
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(options.borderRadius),
            side: options.borderSide,
          ),
          color: options.color,
          colorBrightness: ThemeData.estimateBrightnessForColor(options.color),
          textColor: options.textStyle.color,
          disabledColor: options.disabledColor,
          disabledTextColor: options.disabledTextColor,
          elevation: options.elevation,
          splashColor: options.splashColor,
        ),
      );
    }

    return Container(
      height: options.height,
      width: options.width,
      child: RaisedButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(options.borderRadius),
          side: options.borderSide,
        ),
        textColor: options.textStyle.color,
        color: options.color,
        colorBrightness: ThemeData.estimateBrightnessForColor(options.color),
        disabledColor: options.disabledColor,
        disabledTextColor: options.disabledTextColor,
        padding: options.padding,
        elevation: options.elevation,
        child: textWidget,
      ),
    );
  }
}
