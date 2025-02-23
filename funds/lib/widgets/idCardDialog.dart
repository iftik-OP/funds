import 'package:flutter/material.dart';

class IDCardDialog extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String section;
  final String? photoUrl;

  const IDCardDialog({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.section,
    this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Account',
                  style: TextStyle(
                    fontFamily: 'Infra',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Hero(
              tag: 'Avatar',
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  image: photoUrl != null
                      ? DecorationImage(
                          image: NetworkImage(photoUrl!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: photoUrl == null
                    ? const Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.black,
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 24),
            _buildInfoRow(Icons.person, name),
            const SizedBox(height: 16),
            _buildInfoRow(Icons.phone, phoneNumber),
            const SizedBox(height: 16),
            _buildInfoRow(Icons.business, section),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Valid until: ${DateTime.now().year + 1}',
                style: const TextStyle(
                  fontFamily: 'Infra',
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.black, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'Infra',
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
