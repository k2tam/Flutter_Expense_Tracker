import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.traffic: Icons.card_travel,
  Category.leisure: Icons.movie,
  Category.bills: Icons.receipt,
};

enum Category {
  food,
  traffic,
  leisure,
  bills,
}

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  String get getFormattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;

  ExpenseBucket.forCategory(
    List<Expense> allExpenses,
    this.category,
  ) : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  double get totalExpenses {
    double sum = 0;

    for (final Expense expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
