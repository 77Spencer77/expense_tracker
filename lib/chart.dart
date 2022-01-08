import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

class Chart extends StatelessWidget {
  List<Transaction> lastWeekTransaction;

  Chart(this.lastWeekTransaction);
  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      var weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var i = 0; i < lastWeekTransaction.length; i++) {
        if (lastWeekTransaction[i].date.day == weekDay.day &&
            lastWeekTransaction[i].date.month == weekDay.month &&
            lastWeekTransaction[i].date.year == weekDay.year) {
          totalSum += lastWeekTransaction[i].amount;
        }
      }
      return {"day": DateFormat.E().format(weekDay), "amount": totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: groupedTransaction.map((e) {
          return Text('${e['day']}:${e['amount']}');
        }).toList(),
      ),
    );
  }
}
