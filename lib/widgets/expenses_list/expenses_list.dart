import 'package:flutter/material.dart';
import 'package:study_flutter_expenses_app/models/expense.dart';
import 'package:study_flutter_expenses_app/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;

  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        final expense = expenses[index];
        return Dismissible(
          key: ValueKey(expense),
          onDismissed: (direction) => onRemoveExpense(expense),
          child: ExpenseItem(expense: expense),
        );
      },
    );
  }
}
