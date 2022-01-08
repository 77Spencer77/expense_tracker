import 'package:flutter/material.dart';
import './new_transaction.dart';
import './user_input.dart';
import './transaction.dart';
import './chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense Tracker",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: "Quicksand",
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: "OpensSans",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  // This widget is the root of your application.
  const Dashboard({Key? key}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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

  List<Transaction> get lastWeekTransaction {
    return transaction.where((index) {
      return index.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void showtextfield(BuildContext cxt) {
    showModalBottomSheet(
        context: cxt,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: User_input(_function),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense App"),
        actions: [
          IconButton(
              onPressed: () => {showtextfield(context)}, icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chart(lastWeekTransaction),
            NewTransaction(transaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {showtextfield(context)},
      ),
    );
  }
}
