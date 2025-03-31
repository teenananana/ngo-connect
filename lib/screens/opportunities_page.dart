import 'package:flutter/material.dart';

class OpportunityCard extends StatelessWidget {
  final Map<String, dynamic> opportunity;
  final VoidCallback onSignUp;

  const OpportunityCard({
    super.key,
    required this.opportunity,
    required this.onSignUp,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              opportunity['title'],
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              opportunity['organization'],
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey[700],
                  ),
            ),
            const SizedBox(height: 8),
            Text(opportunity['description']),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.green[700]),
                const SizedBox(width: 8),
                Text(opportunity['date']),
                const SizedBox(width: 16),
                Icon(Icons.access_time, color: Colors.green[700]),
                const SizedBox(width: 8),
                Text(opportunity['time']),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onSignUp,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

class OpportunitiesPage extends StatelessWidget {

  final List<Map<String, dynamic>> _opportunities = [
    {
      'title': 'Park Cleanup Drive',
      'organization': 'Environmental Champions',
      'description': 'Help clean and maintain our local park.',
      'date': '2025-03-15',
      'time': '9:00 AM - 12:00 PM',
    },
  ];

    OpportunitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Opportunities'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _opportunities.length,
          itemBuilder: (context, index) {
            return OpportunityCard(
              opportunity: _opportunities[index],
              onSignUp: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Successfully signed up!'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
