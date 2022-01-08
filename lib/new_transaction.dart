import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './user_input.dart';
import './transaction.dart';
import 'package:intl/intl.dart';
import './main.dart';

class NewTransaction extends StatelessWidget {
  List<Transaction> transaction;
  NewTransaction(this.transaction);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? Column(
            children: [
              Container(
                child: Image.asset("waiting.png"),
              )
            ],
          )
        : Column(
            children: [
              Column(
                  children: transaction.map((e) {
                return (Card(
                    child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColorDark,
                              width: 2)),
                      child: Text(
                        // "\$"+e.amount.toString(),
                        "\$${e.amount.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorDark),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat().add_yMMMd().add_jms().format(e.date),
                          style: TextStyle(
                              color: Theme.of(context).primaryColorLight),
                        ),
                      ],
                    ),
                  ],
                )));
              }).toList()),
            ],
          );
  }
}
