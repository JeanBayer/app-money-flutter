import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function newtx;
  NewTransaction(this.newtx, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submittedFunction() {
    final amountText = amountController.text.isNotEmpty
        ? double.parse(amountController.text)
        : -1.0;
    final titleText = titleController.text;

    if (titleText.isEmpty || amountText <= 0) {
      return;
    }

    widget.newtx(
      titleController.text,
      double.parse(amountController.text),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFFE1EA),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Title",
              ),
              controller: titleController,
              onSubmitted: (_) => submittedFunction(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submittedFunction(),
            ),
            TextButton(
              onPressed: () {
                submittedFunction();
              },
              child: Text(
                "Add Transaction",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
