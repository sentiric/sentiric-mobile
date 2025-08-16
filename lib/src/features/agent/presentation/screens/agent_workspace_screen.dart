import 'package:flutter/material.dart';
import 'package:sentiric_mobile/src/features/agent/presentation/widgets/active_call_panel.dart';
import 'package:sentiric_mobile/src/features/agent/presentation/widgets/call_queue.dart';
import 'package:sentiric_mobile/src/features/agent/presentation/widgets/customer_info_panel.dart';
import 'package:sentiric_mobile/src/features/shared/widgets/app_layout.dart';

class AgentWorkspaceScreen extends StatelessWidget {
  const AgentWorkspaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: 'Ajan Çalışma Alanı',
      mobileBody: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const TabBar(
              isScrollable: false,
              tabs: [
                Tab(icon: Icon(Icons.queue_music_rounded), text: 'Kuyruk'),
                Tab(icon: Icon(Icons.phone_in_talk_rounded), text: 'Aktif'),
                Tab(icon: Icon(Icons.person_search_rounded), text: 'Müşteri'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  const CallQueue(),
                  const ActiveCallPanel(),
                  const CustomerInfoPanel(),
                ],
              ),
            ),
          ],
        ),
      ),
      desktopBody: const Row(
        children: [
          SizedBox(width: 300, child: CallQueue()),
          VerticalDivider(width: 1, thickness: 1),
          Expanded(child: ActiveCallPanel()),
          VerticalDivider(width: 1, thickness: 1),
          SizedBox(width: 320, child: CustomerInfoPanel()),
        ],
      ),
    );
  }
}
