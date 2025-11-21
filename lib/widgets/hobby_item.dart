import 'package:flutter/material.dart';

class HobbyItem extends StatelessWidget {
  final String hobi;

  const HobbyItem({super.key, required this.hobi});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.star, color: Colors.red),
        title: Text(hobi),
      ),
    );
  }
}