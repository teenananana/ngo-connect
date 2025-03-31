import 'package:flutter/material.dart';

class TeamCard extends StatelessWidget {
  final Map<String, dynamic> team;
  final bool isSelected;
  final VoidCallback onTap;

  const TeamCard({required this.team, required this.isSelected, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: isSelected ? 4 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: isSelected ? Colors.green : Colors.transparent, width: 2),
      ),
      child: ListTile(
        onTap: onTap,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(team['image'], width: 60, height: 60, fit: BoxFit.cover),
        ),
        title: Text(team['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${team['description']}\n${team['members']} members'),
        trailing: isSelected ? const Icon(Icons.check_circle, color: Colors.green) : null,
      ),
    );
  }
}
