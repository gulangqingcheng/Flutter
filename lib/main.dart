import 'package:flutter/material.dart';

void main() {
  runApp(const InnovationHelloApp());
}

class InnovationHelloApp extends StatelessWidget {
  const InnovationHelloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '创新实验 Flutter 入门',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScaffold(),
    );
  }
}

// ======== 底部导航栏框架 ========
class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;
  int _completedTasks = 0;

  void _finishOneTask() {
    setState(() {
      _completedTasks += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(completedTasks: _completedTasks, onFinish: _finishOneTask),
      const AboutPage(),
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFE8E0F0), Color(0xFFD4C5F9), Color(0xFFE0D4F7)],
          ),
        ),
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            selectedIcon: Icon(Icons.home),
            label: '首页',
          ),
          NavigationDestination(
            icon: Icon(Icons.people),
            selectedIcon: Icon(Icons.people),
            label: '关于我',
          ),
        ],
      ),
    );
  }
}

// ======== 首页（打卡页面）========
class HomePage extends StatelessWidget {
  final int completedTasks;
  final VoidCallback onFinish;

  const HomePage({
    super.key,
    required this.completedTasks,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    final progress = (completedTasks / 5).clamp(0.0, 1.0);

    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              // 头像区域
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.flutter_dash,
                  size: 80,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 24),

              // 欢迎文字
              const Text(
                'Hello Flutter',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '第14周创新实验入门任务',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),

              const SizedBox(height: 28),

              // 个人信息卡片
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.white.withOpacity(0.85),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                  child: Column(
                    children: [
                      InfoRow(icon: Icons.person, label: '姓名', value: '石文芝'),
                      SizedBox(height: 12),
                      InfoRow(icon: Icons.badge, label: '学号', value: '0327'),
                      SizedBox(height: 12),
                      InfoRow(icon: Icons.group, label: '小组', value: '第 08 组'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // 打卡进度卡片
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.white.withOpacity(0.85),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        '今日打卡次数：$completedTasks',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // 进度条
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 12,
                          backgroundColor: Colors.grey[200],
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.deepPurple,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        completedTasks >= 5
                            ? '目标达成！太厉害了！'
                            : completedTasks >= 3
                                ? '快完成了，加油！'
                                : '目标：打卡 5 次',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // 打卡按钮
              ElevatedButton.icon(
                onPressed: onFinish,
                icon: const Icon(Icons.check_circle, size: 28),
                label: const Text(
                  '完成一次打卡',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 信息行组件
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.deepPurple, size: 22),
        const SizedBox(width: 12),
        Text(
          '$label：$value',
          style: const TextStyle(fontSize: 17),
        ),
      ],
    );
  }
}

// ======== 关于我页面 ========
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            children: [
              const Icon(Icons.code, size: 64, color: Colors.deepPurple),
              const SizedBox(height: 20),
              const Text(
                '关于这个项目',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                color: Colors.white.withOpacity(0.85),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    '这是创新实验第14周的 Flutter 入门作业。\n\n'
                    '使用 Flutter 框架搭建了一个简单的 Hello World 应用，\n'
                    '包含首页打卡功能和关于我页面。\n\n'
                    '学到了 Flutter 的基本组件使用方法：\n'
                    '  - StatelessWidget 与 StatefulWidget\n'
                    '  - setState 状态管理\n'
                    '  - Card、LinearProgressIndicator 等组件\n'
                    '  - 底部导航栏（NavigationBar）\n'
                    '  - 渐变背景与卡片布局',
                    style: TextStyle(fontSize: 15, height: 1.6),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Made with Flutter',
                style: TextStyle(fontSize: 13, color: Colors.black38),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
