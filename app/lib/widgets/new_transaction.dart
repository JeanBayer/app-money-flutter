import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? dateTime;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  void datePickerFunction() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((dateTimeSelected) {
      if (dateTimeSelected == null) {
        return;
      }
      setState(() {
        dateTime = dateTimeSelected;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            Container(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                      child: Text(dateTime == null
                          ? "No has elegido una fecha"
                          : DateFormat.yMEd().format(dateTime!))),
                  TextButton(
                    child: Text("Elige una"),
                    onPressed: datePickerFunction,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              child: Text('Add Transaction'),
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
