import 'package:flutter/material.dart';
import './new_transaction.dart';
import './user_input.dart';
import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> transaction = [
    Transaction(
        id: "dsf", amount: 67.9, date: DateTime.now(), title: "newshoes")
  ];
  void _function(String title1, double amount1) {
    var newTx = Transaction(
        amount: amount1,
        title: title1,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      transaction.add(newTx);
    });
  }

  void showtextfield(BuildContext cxt) {
    showModalBottomSheet(
        context: cxt,
        builder: (_) {
          return User_input(_function);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Expense App"),
          actions: [
            IconButton(
                onPressed: () => {showtextfield(context)},
                icon: Icon(Icons.add))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Card(
                  child: Text("CARD TEXT"),
                  elevation: 8,
                ),
              ),
              NewTransaction(transaction),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => {showtextfield(context)},
        ),
      ),
    );
  }
}
