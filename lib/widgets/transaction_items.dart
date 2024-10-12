import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '../models/transaction.dart';
import './transaction_list.dart';

class TransactionItems extends StatelessWidget {
  const TransactionItems({
    Key? key,
    required this.transaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 35,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: FittedBox(
                child: Text(
              'Rs.${transaction.amount}',
            )),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
        trailing: MediaQuery.of(context).size.width > 450
            ? TextButton.icon(
                onPressed: () => deleteTx(transaction.id),
                icon: const Icon(Icons.delete),
                label: const Text(
                  'Delete',
                  // style: TextStyle(color: Theme.of(context).errorColor),
                ),
                // textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                onPressed: () => deleteTx(transaction.id),
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
