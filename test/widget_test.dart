import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:impex_zone/main.dart';

void main() {
  testWidgets('shows mobile navigation labels', (tester) async {
    await tester.pumpWidget(const ImpexZoneApp());

    expect(find.text('Home'), findsWidgets);
    expect(find.byType(NavigationBar), findsOneWidget);
  });
}
