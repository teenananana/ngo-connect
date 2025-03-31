import 'package:flutter/material.dart';

class TrackHoursPage extends StatefulWidget {
  const TrackHoursPage({super.key});

  @override
  TrackHoursPageState createState() => TrackHoursPageState();
}

class TrackHoursPageState extends State<TrackHoursPage> {
  final _formKey = GlobalKey<FormState>();
  String? _organization;
  // ignore: unused_field
  String _activity = '';
  DateTime? _date;
  // ignore: unused_field
  double _hours = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Hours'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Organization Dropdown
              DropdownButtonFormField<String>(
                value: _organization,
                decoration: const InputDecoration(labelText: 'Organization'),
                items: const [
                  DropdownMenuItem(
                    value: 'Environmental Champions',
                    child: Text('Environmental Champions'),
                  ),
                  DropdownMenuItem(
                    value: 'Community Helpers',
                    child: Text('Community Helpers'),
                  ),
                  DropdownMenuItem(
                    value: 'Animal Rescue Volunteers',
                    child: Text('Animal Rescue Volunteers'),
                  ),
                ],
                onChanged: (value) => setState(() => _organization = value),
                validator: (value) =>
                    value == null ? 'Please select an organization' : null,
              ),
              const SizedBox(height: 16),

              // Activity Input
              TextFormField(
                decoration: const InputDecoration(labelText: 'Activity'),
                onChanged: (value) => setState(() => _activity = value),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please enter an activity' : null,
              ),
              const SizedBox(height: 16),

              // Date Picker
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _date == null
                          ? 'No date selected'
                          : 'Selected Date: ${_date!.toLocal()}'.split(' ')[0],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2030),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _date = pickedDate;
                        });
                      }
                    },
                    child: const Text('Pick Date'),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Hours Input
              TextFormField(
                decoration: const InputDecoration(labelText: 'Hours'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _hours = double.tryParse(value) ?? 0;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter hours';
                  }
                  final parsedValue = double.tryParse(value);
                  if (parsedValue == null || parsedValue <= 0) {
                    return 'Enter a valid number of hours';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process the form data
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Hours tracked successfully!')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
