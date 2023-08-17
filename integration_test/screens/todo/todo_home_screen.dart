import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:line_icons/line_icons.dart';
import 'package:todo_app/components/todo_tile.dart';

class TodoHomeScreen {
  late WidgetTester tester;

  TodoHomeScreen(this.tester);

  final _addTodoIconLocator = find.byType(FloatingActionButton);
  final _todoTitleTextField = find.byKey(const ValueKey('todoTitleTextField'));
  final _todoDescriptionTextField = find.byKey(const ValueKey('todoDescriptionTextField'));
  // final _createTodoIcon = find.byIcon(LineIcons.paperPlane);
  final _createTodoIcon = find.byKey(const ValueKey('setToDo'));

  Future<void> addTodo(String title, String description) async {
    await tester.tap(_addTodoIconLocator, warnIfMissed: true);
    await tester.pumpAndSettle();
    await tester.enterText(_todoTitleTextField, title);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.enterText(_todoDescriptionTextField, title);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.tap(_createTodoIcon, warnIfMissed: true);
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
  }

  Future<bool> isTodoPresent(String title) async {
    final todoLocator = find.descendant(of: find.byType(TodoTile), matching: find.text(title));
    return tester.any(todoLocator);
  }
}