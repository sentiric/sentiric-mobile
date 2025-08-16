import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:sentiric_mobile/src/core/theme/theme_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yönetici Paneli'),
        actions: [
          IconButton(
            icon: Icon(ref.watch(themeProvider) == ThemeMode.dark
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined),
            onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
            tooltip: 'Temayı Değiştir',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Platformun Genel Durumu',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            // Metrik Kartlarını bir Grid içinde göster
            const _MetricCardsGrid(),
            const SizedBox(height: 24),
            Text(
              'Haftalık Çağrı Hacmi',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            // Bar Grafiği
            const _WeeklyCallsChart(),
          ],
        ),
      ),
    );
  }
}

// Metrik kartlarını içeren Grid widget'ı
class _MetricCardsGrid extends StatelessWidget {
  const _MetricCardsGrid();

  @override
  Widget build(BuildContext context) {
    // Mobil için tek sütun, daha geniş ekranlar için iki sütunlu yapı
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 600 ? 2 : 1;
        return GridView.count(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 2.5,
          children: const [
            _MetricCard(
                title: 'Aktif Çağrılar',
                value: '12',
                icon: Icons.phone_in_talk_outlined,
                color: Colors.blue),
            _MetricCard(
                title: 'Bugünkü Toplam Çağrı',
                value: '1,482',
                icon: Icons.summarize_outlined,
                color: Colors.green),
            _MetricCard(
                title: 'Kaçan Çağrılar',
                value: '73',
                icon: Icons.phone_missed_outlined,
                color: Colors.red),
            _MetricCard(
                title: 'Ort. Çözüm Süresi (sn)',
                value: '87',
                icon: Icons.timer_outlined,
                color: Colors.orange),
          ],
        );
      },
    );
  }
}

// Tek bir metrik kartı widget'ı
class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _MetricCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 0,
      color: isDarkMode ? Colors.grey.shade800.withOpacity(0.5) : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: textTheme.titleMedium
                        ?.copyWith(color: Colors.grey.shade500)),
                Icon(icon, color: color),
              ],
            ),
            Text(value, style: textTheme.headlineMedium),
          ],
        ),
      ),
    );
  }
}

// Haftalık çağrıları gösteren Bar Chart widget'ı
class _WeeklyCallsChart extends StatelessWidget {
  const _WeeklyCallsChart();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final gridColor = isDarkMode ? Colors.grey.shade800 : Colors.grey.shade300;

    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        elevation: 0,
        color:
            isDarkMode ? Colors.grey.shade800.withOpacity(0.5) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.withOpacity(0.2)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 3000,
              barGroups: [
                _makeBarGroup(0, 2488, Colors.blue),
                _makeBarGroup(1, 1445, Colors.blue),
                _makeBarGroup(2, 1900, Colors.blue),
                _makeBarGroup(3, 2200, Colors.blue),
                _makeBarGroup(4, 2800, Colors.blue),
              ],
              titlesData: FlTitlesData(
                leftTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      const style =
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14);
                      Widget text;
                      switch (value.toInt()) {
                        case 0:
                          text = const Text('Pzt', style: style);
                          break;
                        case 1:
                          text = const Text('Sal', style: style);
                          break;
                        case 2:
                          text = const Text('Çar', style: style);
                          break;
                        case 3:
                          text = const Text('Per', style: style);
                          break;
                        case 4:
                          text = const Text('Cum', style: style);
                          break;
                        default:
                          text = const Text('', style: style);
                          break;
                      }
                      return SideTitleWidget(
                          axisSide: meta.axisSide, child: text);
                    },
                    reservedSize: 38,
                  ),
                ),
              ),
              gridData: FlGridData(
                show: true,
                checkToShowHorizontalLine: (value) => value % 500 == 0,
                getDrawingHorizontalLine: (value) =>
                    FlLine(color: gridColor, strokeWidth: 1),
              ),
              borderData: FlBorderData(show: false),
            ),
          ),
        ),
      ),
    );
  }

  BarChartGroupData _makeBarGroup(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
            toY: y,
            color: color,
            width: 22,
            borderRadius: BorderRadius.circular(4))
      ],
    );
  }
}
