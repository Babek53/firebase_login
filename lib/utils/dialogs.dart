import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/ui/widgets/custom_button.dart';
import 'package:myapp/ui/widgets/dialog_card.dart';

Future<bool?> showMessageDialog({
  required String message,
}) {
  return Get.dialog<bool?>(
    MessageDialog(message: message),
  );
}

class MessageDialog extends StatelessWidget {
  const MessageDialog({required this.message, super.key});
  final String message;

  @override
  Widget build(BuildContext context) {
    return DialogCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                child: const Text('OK'),
                onPressed: Get.back,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
