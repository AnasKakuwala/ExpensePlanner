import '../models/transaction.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import './transaction_items.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: ((ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No Transaction is added yet!!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover)),
              ],
            );
          }))
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItems(
                  transaction: transactions[index], deleteTx: deleteTx);

              // return Card(
              //     child: Row(
              //   children: <Widget>[
              //     Container(
              //       margin: EdgeInsets.symmetric(
              //         vertical: 10,
              //         horizontal: 15,
              //       ),
              //       decoration: BoxDecoration(
              //           border: Border.all(
              //               color: Theme.of(context).primaryColor, width: 2)),
              //       padding: EdgeInsets.all(10),
              //       child: Text(
              //         'Rs.' +
              //             transactions[index].amount.toStringAsFixed(
              //                 2), //in dollar '\$${tx.amount}' string interpolation
              //         style: TextStyle(
              //             fontSize: 20,
              //             fontWeight: FontWeight.bold,
              //             color: Theme.of(context).primaryColor),
              //       ),
              //     ),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: <Widget>[
              //         Text(
              //           transactions[index].title,
              //           // style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //           style: Theme.of(context).textTheme.headline6,
              //         ),
              //         Text(
              //           DateFormat.yMMMd(/*yyyy/MM/dd*/)
              //               .format(transactions[index].date),
              //           style: TextStyle(color: Colors.grey, fontSize: 14),
              //         ),
              //       ],
              //     ),
              //   ],
              // ));
            },
            itemCount: transactions.length,
          );
  }
}
