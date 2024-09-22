import 'package:flutter/material.dart';

extension SafeTextExtension on Text {
  Widget dynamicTextSize({
    required BuildContext context,
    required double maxWidth,
    double minFontSize = 8,
    double maxFontSize = 12,
    int maxLines = 1,
    TextAlign textAlign = TextAlign.justify,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double availableWidth =
            constraints.maxWidth > 0 ? constraints.maxWidth : maxWidth;

        return FittedBox(
          fit: BoxFit.scaleDown,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: availableWidth,
            ),
            child: Text(
              this.data!,
              style: this.style?.copyWith(
                        fontSize: maxFontSize,
                      ) ??
                  TextStyle(fontSize: maxFontSize),
              maxLines: maxLines,
              textAlign: textAlign,
              overflow: overflow,
            ),
          ),
        );
      },
    );
  }
}
