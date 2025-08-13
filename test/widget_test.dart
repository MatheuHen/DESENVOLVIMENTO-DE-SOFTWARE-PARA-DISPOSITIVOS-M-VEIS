// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:listahorizontal/main.dart';

void main() {
  testWidgets('Lista horizontal test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our horizontal list is displayed.
    expect(find.text('Lista Horizontal'), findsOneWidget);
    expect(find.text('Formulário 1'), findsOneWidget);
    expect(find.text('Nome Completo'), findsWidgets);
    expect(find.text('Data de Nascimento'), findsWidgets);
    expect(find.text('Sexo'), findsWidgets);
  });
}
