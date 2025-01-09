import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/app_colors.dart';

/// Popup widget that you can use by default to show some information
class CustomSnackBar extends StatefulWidget {
  CustomSnackBar.success({
    super.key,
    required this.message,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 8),
    SvgPicture? icon,
    this.textStyle = kDefaultTextStyle, // Use the constant here
    this.maxLines = 4,
    this.backgroundColor = AppColors.lightGreenBackground,
    this.borderRadius = kDefaultBorderRadius,
    this.textButton,
  }) : icon = icon ?? Icon(Icons.check);

  CustomSnackBar.info({
    super.key,
    required this.message,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 8),
    SvgPicture? icon,
    this.textStyle = kDefaultTextStyle, // Use the constant here
    this.maxLines = 4,
    this.backgroundColor = AppColors.lightOrangeBackground,
    this.borderRadius = kDefaultBorderRadius,
    this.textButton,
  }) : icon = icon ?? Icon(Icons.info);

  CustomSnackBar.error({
    super.key,
    required this.message,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 8),
    SvgPicture? icon,
    this.textStyle = kDefaultTextStyle, // Use the constant here
    this.maxLines = 4,
    this.backgroundColor = AppColors.lightRedText,
    this.borderRadius = kDefaultBorderRadius,
    this.textButton,
  }) : icon = icon ?? Icon(Icons.error);

  final String message;
  final Widget icon;
  final Color backgroundColor;
  final TextStyle textStyle;
  final int maxLines;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry messagePadding;
  final Widget? textButton;

  @override
  CustomSnackBarState createState() => CustomSnackBarState();
}

class CustomSnackBarState extends State<CustomSnackBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: widget.borderRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    SizedBox(height: 24, child: widget.icon),
                    Expanded(
                      child: Padding(
                        padding: widget.messagePadding,
                        child: Text(
                          widget.message,
                          style: theme.textTheme.bodyMedium?.merge(widget.textStyle),
                          overflow: TextOverflow.ellipsis,
                          maxLines: widget.maxLines,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.textButton != null) widget.textButton!,
            ],
          ),
        ));
  }
}

const kDefaultBorderRadius = BorderRadius.all(Radius.circular(8));

const kDefaultTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 14,
  color: AppColors.gray900,
);