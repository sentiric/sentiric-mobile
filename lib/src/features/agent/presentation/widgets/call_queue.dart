import 'package:flutter/material.dart';

class CallQueue extends StatelessWidget {
  const CallQueue({super.key});

  @override
  Widget build(BuildContext context) {
    final calls = [
      {'from': '+90 555 123 4567', 'status': 'ringing'},
      {'from': '+90 555 987 6543', 'status': 'ringing'},
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Çağrı Kuyruğu (${calls.length})',
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        ...calls.map((call) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: const Icon(Icons.phone_callback_rounded),
                title: Text(call['from']!),
                subtitle: Text(call['status']!),
                onTap: () {},
              ),
            )),
      ],
    );
  }
}
