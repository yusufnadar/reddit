import 'package:flutter/material.dart';

// context ile her sayfa içerisinde kolayca erişmemizi sağlayan kısımlar

extension NavigationExtension on BuildContext {
  NavigatorState get rootNavigator => Navigator.of(this, rootNavigator: false);
  NavigatorState get navigator => Navigator.of(this);
}

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;

  double get width => mediaQuery.size.width;

  double get lowValue => height * 0.01;

  double get normalValue => height * 0.02;

  double get mediumValue => height * 0.04;

  double get highValue => height * 0.1;
}
