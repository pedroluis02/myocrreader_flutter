import 'package:flutter/material.dart';

class StatusResultWidget extends StatelessWidget {
  const StatusResultWidget({
    super.key,
    required String? lastErrorMessage,
  }) : _lastErrorMessage = lastErrorMessage;

  final String? _lastErrorMessage;

  @override
  Widget build(BuildContext context) {
    final defTextStyle = Theme.of(context).textTheme.headlineSmall;
    Color textStyleColor;
    String message;
    if (_lastErrorMessage == null) {
      textStyleColor = Colors.black;
      message = '';
    } else if (_lastErrorMessage?.isEmpty == true) {
      textStyleColor = Colors.green;
      message = 'OK';
    } else {
      textStyleColor = Colors.red;
      message = 'Error: $_lastErrorMessage';
    }

    return Text(
      message,
      style: defTextStyle?.copyWith(color: textStyleColor, fontWeight: FontWeight.bold),
    );
  }
}
