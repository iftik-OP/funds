import 'package:flutter/material.dart';
import 'package:funds/screens/depositScreen.dart';
import 'package:funds/screens/pendingRequestScreen.dart';
import 'package:funds/screens/requestScreen.dart';
import 'package:funds/widgets/idCardDialog.dart';
import 'package:funds/widgets/transactionCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Funds',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w800),
        ),
        elevation: 0,
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => IDCardDialog(
                        name: 'Iftikhar Ahmad',
                        phoneNumber: '8765468786',
                        section: 'M-5'),
                  );
                },
                child: Hero(
                  tag: 'Avatar',
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.withOpacity(0.5))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.account_balance_wallet_rounded,
                        color: Colors.black.withOpacity(0.7),
                        size: 18,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Your Balance',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Text(
                    'Rs. 18,000',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Current Loan: Rs. 0',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                    style: ButtonStyle(
                        side: WidgetStatePropertyAll(
                            BorderSide(color: Colors.black))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PendingRequestsPage()),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.pending_actions_rounded,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Pending Requests',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        )
                      ],
                    )),
                SizedBox(
                  width: 5,
                ),
                OutlinedButton(
                    style: ButtonStyle(
                        side: WidgetStatePropertyAll(
                            BorderSide(color: Colors.black))),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.history,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Loan History',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        )
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Recent Transactions',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.transform_rounded,
                        )
                      ],
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TransactionCard(
                  amount: -12000,
                  date: DateTime.now(),
                  mode: 'Online',
                ),
                TransactionCard(
                  amount: 12000,
                  date: DateTime.now(),
                  mode: 'Online',
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: w * 0.43,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DepositPage()),
                      );
                    },
                    child: Text(
                      'Deposit',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ))),
            SizedBox(
                width: w * 0.43,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RequestPage()),
                      );
                    },
                    child: Text(
                      'Request',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ))),
          ],
        ),
      ),
    );
  }
}
