// profile_page.dart
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.green,
                  child: const Text(
                    'T',
                    style: TextStyle(fontSize: 36, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Teena', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('750 Points • 3 Hours • 1 Team'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text('My Teams'),
              subtitle: const Text('Animal Guardians - Protecting animals'),
              tileColor: Colors.grey[100],
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.emoji_events),
              title: const Text('Rewards'),
              subtitle: const Text('750 Points - Keep volunteering!'),
              tileColor: Colors.yellow[100],
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.timer),
              title: const Text('Hours Tracked'),
              subtitle: const Text('3 Hours - Total volunteer time'),
              tileColor: Colors.blue[50],
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('My Opportunities'),
              subtitle: const Text('Park Clean-up Drive • May 3rd, 9:00AM'),
              tileColor: Colors.green[50],
              trailing: Chip(label: Text('Signed Up')),
            ),
          ],
        ),
      ),
    );
  }
}
