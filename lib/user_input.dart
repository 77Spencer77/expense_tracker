import 'package:flutter/material.dart';
import './new_transaction.dart';

class User_input extends StatelessWidget {
  var function;
  User_input(this.function);
  var title1 = TextEditingController();
  var amount1 = TextEditingController();
  void sent() {
    final title = title1.text.toString();
    final amount = double.parse(amount1.text);
    if (title.isEmpty || amount <= 0) {
      return;
    }
    function(title, amount);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 8,
          child: Container(
            padding: EdgeInsets.all(10),
            // margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "enter title"),
                  controller: title1,
                  onSubmitted: (value) => sent(),
                  // onChanged: (value) => title = value,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "enter price"),
                  controller: amount1,
                  keyboardType: TextInputType.number,
                  onSubmitted: (value) => sent(),
                  // onChanged: (value) => amount = value,
                ),
                ElevatedButton(
                  child: Text(
                    "Add Transaction",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.amber),
                  onPressed: sent,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
