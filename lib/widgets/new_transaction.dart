import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  // NewTransaction({Key key}) : super(key: key);
  final Function onPressAddExpense;
  NewTransaction({@required this.onPressAddExpense});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _submitted() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.tryParse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      AlertDialog(
        title: Text("Please enter values"),
      );
    } else {
      this.widget.onPressAddExpense(enteredTitle, enteredAmount);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => _submitted(),
              /* onChanged: (val) {
                        titleInput = val;
                      } */
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: amountController,
              onSubmitted: (_) => _submitted(),
              /* onChanged: (val) {
                        amountInput = val;
                      }, */
            ),
            FlatButton(
              child: Text('Add Transaction'),
              onPressed: () {
                this._submitted();
              },
              textColor: Colors.purple,
            )
          ],
        ),
        padding: EdgeInsets.all(5),
      ),
      elevation: 5,
    );
  }
}
