import 'package:flutter/material.dart';

extension SafeNavigationExtension on BuildContext {
  void safeNavigateBack() {
    if (Navigator.of(this).canPop()) {
      Navigator.of(this).pop();
    } else {
      ScaffoldMessenger.of(this).showSnackBar(
        const SnackBar(content: Text('No se puede regresar más atrás')),
      );
    }
  }
}
