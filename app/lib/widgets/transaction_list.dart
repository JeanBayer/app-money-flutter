import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 560,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 8,
                  ),
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(
                              child: Text(
                                  '\$${transactions[index].amount.toStringAsFixed(2)}')),
                        ),
                      ),
                      title: Text(
                        '${transactions[index].title}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      subtitle: Text(
                          '${DateFormat.yMMMd().format(transactions[index].date)}'),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
