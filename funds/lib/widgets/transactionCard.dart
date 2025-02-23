import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  int amount;
  String mode;
  DateTime date;
  TransactionCard({
    required this.amount,
    required this.mode,
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                amount < 0 ? 'Withdrawn' : 'Deposited',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: amount < 0
                        ? Colors.red.shade700
                        : Colors.green.shade700),
              ),
              Text(
                'Rs. ${amount.abs()}',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: amount < 0
                        ? Colors.red.shade700
                        : Colors.green.shade700),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                mode,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.5)),
              ),
              Text(
                '${date.day} ${date.month} ${date.year}',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.5)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
