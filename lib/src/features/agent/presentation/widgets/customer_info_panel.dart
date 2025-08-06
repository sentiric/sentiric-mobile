import 'package:flutter/material.dart';

class CustomerInfoPanel extends StatelessWidget {
  const CustomerInfoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text('Müşteri Bilgisi', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        Card(
          child: ListTile(
            title: const Text('Azmi Şahin'),
            subtitle: const Text('VIP Müşteri\nSon Etkileşim: 2 gün önce'),
            isThreeLine: true,
          ),
        ),
        const SizedBox(height: 24),
        Text('AI Önerileri', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        Card(
          child: ListTile(
            leading: const Icon(Icons.lightbulb_outline_rounded,
                color: Colors.amber),
            title: const Text('Öneri: İade Politikası'),
            subtitle: const Text('Müşteri "iade" kelimesini kullandı.'),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
