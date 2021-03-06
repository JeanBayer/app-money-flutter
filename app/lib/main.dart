import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
          ),
        ),
      ),
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [
    // Transaction(
    //   id: "t1",
    //   title: "food",
    //   amount: 13.25,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t2",
    //   title: "shoes",
    //   amount: 3.25,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _groupedTransantionValue {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _newUserTransaction(String title, double amount, DateTime dateTime) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: dateTime,
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _addNewTx(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_newUserTransaction);
        });
  }

  void _deleteItem(String id) {
    setState(() {  
    _userTransaction.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE1EA),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: () => _addNewTx(context),
          ),
        ],
        title: Text("prueba"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chart(_groupedTransantionValue),
            TransactionList(_userTransaction, _deleteItem),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: () => _addNewTx(context),
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
