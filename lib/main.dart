import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const InnovationHelloApp());
}

class InnovationHelloApp extends StatelessWidget {
  const InnovationHelloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '蔡欣宜的创新实验 Flutter 首页',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00A6C8)),
        fontFamily: 'Microsoft YaHei UI',
        fontFamilyFallback: const ['Microsoft YaHei', 'KaiTi', 'SimSun'],
        useMaterial3: true,
      ),
      home: const HelloHomePage(),
    );
  }
}

class HelloHomePage extends StatefulWidget {
  const HelloHomePage({super.key});

  @override
  State<HelloHomePage> createState() => _HelloHomePageState();
}

class _HelloHomePageState extends State<HelloHomePage> {
  int completedTasks = 0;

  void finishOneTask() {
    setState(() {
      completedTasks += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 86,
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF006D8F), Color(0xFF704CFF), Color(0xFF00A6C8)],
          ).createShader(bounds),
          child: const Text(
            '蔡欣宜的创新实验 Flutter 首页',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontFamily: 'KaiTi',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white.withValues(alpha: 0.10),
        foregroundColor: const Color(0xFF12324A),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFE9FBFF), Color(0xFFF9FDFF), Color(0xFFF2F0FF)],
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(child: CustomPaint(painter: _TechLinePainter())),
            const Positioned(
              top: 118,
              left: 128,
              child: _GlowOrb(size: 170, color: Color(0xFF6CE6FF)),
            ),
            const Positioned(
              right: 150,
              bottom: 118,
              child: _GlowOrb(size: 210, color: Color(0xFF9B8CFF)),
            ),
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 30),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 590),
                    child: _GlassPanel(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const _RocketBadge(),
                          const SizedBox(height: 24),
                          ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [
                                Color(0xFF082F49),
                                Color(0xFF006D8F),
                                Color(0xFF6258FF),
                              ],
                            ).createShader(bounds),
                            child: const Text(
                              'Hello Flutter，\n我正在完成第 14 周入门任务！',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                height: 1.22,
                              ),
                            ),
                          ),
                          const SizedBox(height: 18),
                          const Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              _InfoChip(icon: Icons.person, label: '姓名：蔡欣宜'),
                              _InfoChip(icon: Icons.badge, label: '学号后四位：0054'),
                            ],
                          ),
                          const SizedBox(height: 28),
                          _ProgressCard(completedTasks: completedTasks),
                          const SizedBox(height: 24),
                          _CenterActionButton(onPressed: finishOneTask),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RocketBadge extends StatelessWidget {
  const _RocketBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF00B7D7), Color(0xFF276EF1), Color(0xFF7A5CFF)],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00A6C8).withValues(alpha: 0.30),
            blurRadius: 26,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: const Icon(Icons.rocket_launch, size: 48, color: Colors.white),
    );
  }
}

class _GlassPanel extends StatelessWidget {
  const _GlassPanel({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
        child: Container(
          padding: const EdgeInsets.fromLTRB(34, 32, 34, 30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withValues(alpha: 0.78),
                Colors.white.withValues(alpha: 0.48),
              ],
            ),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white.withValues(alpha: 0.92)),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF226B80).withValues(alpha: 0.16),
                blurRadius: 38,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F9FD).withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFACE8F3)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00A6C8).withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: const Color(0xFF007B96)),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF12324A),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  const _ProgressCard({required this.completedTasks});

  final int completedTasks;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.80),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: 0.96)),
      ),
      child: Column(
        children: [
          const Text(
            '创新实验进度',
            style: TextStyle(
              color: Color(0xFF486581),
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 9),
          Text(
            '今日已完成任务：$completedTasks 次',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF073B5A),
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class _CenterActionButton extends StatelessWidget {
  const _CenterActionButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00A6C8).withValues(alpha: 0.24),
            blurRadius: 22,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.check_circle),
        label: const Text('完成一次打卡'),
        style: FilledButton.styleFrom(
          backgroundColor: const Color(0xFF00A6C8),
          foregroundColor: Colors.white,
          fixedSize: const Size(210, 52),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}

class _GlowOrb extends StatelessWidget {
  const _GlowOrb({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withValues(alpha: 0.12),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.20),
              blurRadius: 72,
              spreadRadius: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class _TechLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = const Color(0xFF68D8EF).withValues(alpha: 0.16)
      ..strokeWidth = 1;
    final accentPaint = Paint()
      ..color = const Color(0xFF7A5CFF).withValues(alpha: 0.18);

    for (double x = -40; x < size.width; x += 72) {
      canvas.drawLine(Offset(x, 0), Offset(x + 128, size.height), linePaint);
    }

    for (double y = 72; y < size.height; y += 120) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y + 36), linePaint);
    }

    final nodes = [
      Offset(size.width * 0.18, size.height * 0.22),
      Offset(size.width * 0.78, size.height * 0.18),
      Offset(size.width * 0.16, size.height * 0.78),
      Offset(size.width * 0.82, size.height * 0.72),
    ];

    for (final node in nodes) {
      canvas.drawCircle(node, 4, accentPaint);
      canvas.drawCircle(node, 13, linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
