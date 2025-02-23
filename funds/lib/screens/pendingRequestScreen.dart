import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Request {
  final String id;
  final double amount;
  final DateTime requestTime;
  final String status;
  final String? adminName;

  Request({
    required this.id,
    required this.amount,
    required this.requestTime,
    required this.status,
    this.adminName,
  });
}

class PendingRequestsPage extends StatelessWidget {
  PendingRequestsPage({super.key});

  // Sample data - Replace with your actual data source
  final List<Request> requests = [
    Request(
      id: '1',
      amount: 500.00,
      requestTime: DateTime.now().subtract(const Duration(hours: 2)),
      status: 'Pending',
      adminName: null,
    ),
    Request(
      id: '2',
      amount: 1200.50,
      requestTime: DateTime.now().subtract(const Duration(hours: 5)),
      status: 'Approved',
      adminName: 'John Smith',
    ),
    Request(
      id: '3',
      amount: 750.25,
      requestTime: DateTime.now().subtract(const Duration(days: 1)),
      status: 'Rejected',
      adminName: 'Sarah Johnson',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Request History',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Infra',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: requests.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: requests.length,
              itemBuilder: (context, index) =>
                  _RequestCard(request: requests[index]),
            ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.hourglass_empty,
            size: 64,
            color: Colors.white24,
          ),
          SizedBox(height: 16),
          Text(
            'No requests yet',
            style: TextStyle(
              fontFamily: 'Infra',
              fontSize: 18,
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _RequestCard extends StatelessWidget {
  final Request request;

  const _RequestCard({required this.request});

  Color _getStatusColor() {
    switch (request.status.toLowerCase()) {
      case 'approved':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rs. ${request.amount.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontFamily: 'Infra',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: _getStatusColor().withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        request.status,
                        style: TextStyle(
                          fontFamily: 'Infra',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: _getStatusColor(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildInfoRow(
                  Icons.access_time,
                  'Requested on ${DateFormat('MMM dd, yyyy').format(request.requestTime)} at ${DateFormat('hh:mm a').format(request.requestTime)}',
                ),
                if (request.adminName != null) ...[
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    Icons.admin_panel_settings,
                    'Processed by ${request.adminName}',
                  ),
                ],
              ],
            ),
          ),
          if (request.status == 'Pending' && false)
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.black12),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        // Handle reject
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Reject',
                        style: TextStyle(
                          fontFamily: 'Infra',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 48,
                    color: Colors.black12,
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        // Handle approve
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Approve',
                        style: TextStyle(
                          fontFamily: 'Infra',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.black54,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'Infra',
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
