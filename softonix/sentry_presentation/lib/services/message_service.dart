import 'package:flutter/material.dart';

import 'package:bot_toast/bot_toast.dart';

class MessageService {
  MessageService._();

  static void error(String message) {
    BotToast.showCustomNotification(
      onlyOne: true,
      duration: const Duration(
        seconds: 3,
      ),
      animationDuration: const Duration(
        milliseconds: 300,
      ),
      toastBuilder: (_) {
        return _notificationBody(
          message: message,
          leadingIcon: Icons.error_outline,
          color: Colors.white,
          bgColor: Colors.redAccent,
        );
      },
    );
  }

  static void success(String message) {
    BotToast.showCustomNotification(
      onlyOne: true,
      duration: const Duration(
        seconds: 3,
      ),
      animationDuration: const Duration(
        milliseconds: 300,
      ),
      toastBuilder: (_) {
        return _notificationBody(
          message: message,
          leadingIcon: Icons.check_circle,
          color: Colors.greenAccent.shade400,
          bgColor: Colors.greenAccent,
        );
      },
    );
  }

  static Widget _notificationBody({
    required String message,
    required IconData leadingIcon,
    required Color color,
    required Color bgColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 20.0,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            spreadRadius: 1.0,
            offset: Offset(0.0, 3.0),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(leadingIcon, size: 16, color: color),
          const SizedBox(width: 12.0),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                height: 1.1,
                color: color,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
