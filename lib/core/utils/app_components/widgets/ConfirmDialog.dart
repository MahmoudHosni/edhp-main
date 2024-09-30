

import 'package:flutter/material.dart';

Future<bool> confirm(
    BuildContext context, {
      Widget? title,
      Widget? content,
      Widget? textOK,
      Widget? textCancel,
      bool canPop = false,
      void Function(bool)? onPopInvoked,
    }) async {
  final bool? isConfirm = await showDialog<bool>(
    context: context,
    builder: (BuildContext context) => PopScope(
      child: AlertDialog(backgroundColor: Colors.white,
        title: title,
        content: SingleChildScrollView(
          child: content ?? const Text('Are you sure continue?'),
        ),
        actions: <Widget>[
          TextButton(
            child: textCancel ??
                Text(MaterialLocalizations.of(context).cancelButtonLabel),
            onPressed: () => Navigator.pop(context, false),
          ),
          TextButton(
            child:
            textOK ?? Text(MaterialLocalizations.of(context).okButtonLabel),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
      canPop: canPop,
      onPopInvoked: onPopInvoked,
    ),
  );
  return isConfirm ?? false;
}