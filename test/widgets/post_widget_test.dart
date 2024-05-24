import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_simple_social/widgets/post_widget.dart';

import '../utils/test_utils.dart';

void main() {
  testWidgets('Test PostWidget', (WidgetTester tester) async {
    await pumpWidget(tester, PostWidget(text: "test"));
    expect(find.text('test'), findsOneWidget);
    expect(find.byIcon(Icons.comment_rounded), findsOneWidget);
  });
}