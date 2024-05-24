import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> pumpWidget(WidgetTester tester, Widget widget) async {
  await tester.pumpWidget(
    Directionality(textDirection: TextDirection.ltr, child: widget),
  );
}
