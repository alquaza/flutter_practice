import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(context) {
    // don't want to use Column() because the list could be infinitely long
    // the ListView() widget is at least scrollable, but still not ideal because it still preloads everything (even things that would not be displayed on screen at the time)
    // instead, use ListView.builder, which only builds things that are visible
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => ExpenseItem(expense: expenses[index]),
    );
  }
}
