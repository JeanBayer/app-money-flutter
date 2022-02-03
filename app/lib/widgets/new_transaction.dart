import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function newtx;
  NewTransaction(this.newtx, {Key? key}) : super(key: key);

  void submittedFunction() {
    final amountText = amountController.text.isNotEmpty
        ? double.parse(amountController.text)
        : -1.0;
    final titleText = titleController.text;

    if (titleText.isEmpty || amountText <= 0) {
      return;
    }

    newtx(
      titleController.text,
      double.parse(amountController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
