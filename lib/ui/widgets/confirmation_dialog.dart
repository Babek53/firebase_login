import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:myapp/ui/widgets/custom_button.dart';
import 'package:myapp/ui/widgets/dialog_card.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DialogCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                onPressed: () => Get.back(result: false),
                isOutlined: true,
                child: Text(
                  'No',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              CustomButton(
                child: Text(
                  'Yes',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                onPressed: () => Get.back(result: true),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
