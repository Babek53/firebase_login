import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.child,
    super.key,
    this.onPressed,
    this.isOutlined = false,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final primaryColor = colorScheme.primary;
    final onPrimaryColor = colorScheme.onPrimary;
    final backgroundColor = isOutlined ? colorScheme.surface : primaryColor;
    final borderColor = isOutlined ? primaryColor : colorScheme.onSurface;

    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            color: isOutlined ? primaryColor : Colors.black.withOpacity(0.3),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: isOutlined ? primaryColor : onPrimaryColor,
          disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.2),
          disabledForegroundColor: colorScheme.onSurface.withOpacity(0.5),
          side: BorderSide(color: borderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: DefaultTextStyle(
          style: theme.textTheme.labelLarge ?? const TextStyle(),
          child: child,
        ),
      ),
    );
  }
}
