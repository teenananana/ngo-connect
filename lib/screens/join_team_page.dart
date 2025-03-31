import 'package:flutter/material.dart';
import '../widgets/team_card.dart';

class JoinTeamPage extends StatefulWidget {
  const JoinTeamPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _JoinTeamPageState createState() => _JoinTeamPageState();
}

class _JoinTeamPageState extends State<JoinTeamPage> {
  final List<Map<String, dynamic>> _teams = [
    {
      'name': 'Environmental Champions',
      'description': 'Working on conservation projects',
      'members': 15,
      'image': 'https://images.unsplash.com/photo-1492496913980-501348b61469'
    },
    {
      'name': 'Education Mentors',
      'description': 'Teaching underprivileged children',
      'members': 12,
      'image': 'https://images.unsplash.com/photo-1577896851231-70ef18881754'
    },
    {
      'name': 'Healthcare Heroes',
      'description': 'Supporting local health initiatives and medical camps',
      'members': 20,
      'image': 'https://images.unsplash.com/photo-1516549655169-df83a0774514'
    },
    {
      'name': 'Animal Guardians',
      'description': 'Protecting and caring for abandoned pets and wildlife',
      'members': 18,
      'image': 'https://images.unsplash.com/photo-1450778869180-41d0601e046e'
    },
    {
      'name': 'Community Builders',
      'description': 'Organizing neighborhood improvement projects',
      'members': 25,
      'image': 'https://images.unsplash.com/photo-1559027615-cd4628902d4a'
    },
    {
      'name': 'Food Bank Volunteers',
      'description': 'Distributing food to families in need',
      'members': 30,
      'image': 'https://images.unsplash.com/photo-1488521787991-ed7bbaae773c'
    },
  ];

  String? _selectedTeam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join a Team'),
        backgroundColor: Colors.green
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: _teams.map((team) {
            return TeamCard(
              team: team,
              isSelected: _selectedTeam == team['name'],
              onTap: () {
                setState(() {
                  _selectedTeam = team['name'];
                  team['members'] = (team['members'] as int) + 1;
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}