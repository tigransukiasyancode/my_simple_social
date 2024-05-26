import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_simple_social/models/Post.dart';
import 'package:my_simple_social/widgets/post_widget.dart';

import '../utils/test_utils.dart';

void main() {
  testWidgets('Test PostWidget', (WidgetTester tester) async {
    Post post = Post(content: "test", id: "1");
    await pumpWidget(tester, PostWidget(post: post));
    expect(find.text('test'), findsOneWidget);
    final iconFinder = find.byIcon(Icons.comment_outlined);
    expect(iconFinder, findsOneWidget);
    await tester.tap(iconFinder);
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.comment_rounded), findsOneWidget);
  });
}