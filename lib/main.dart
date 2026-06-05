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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
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
      appBar: AppBar(
        title: const Text('🔥 创新实验 - 智能学习助手'),
        backgroundColor: Colors.redAccent,
        elevation: 8,
        shadowColor: Colors.red[900],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFEBEE),
              Color(0xFFFFCDD2),
              Color(0xFFFFEBEE),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red[300]!,
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(32),
                  child: const Icon(
                    Icons.local_fire_department,
                    size: 80,
                    color: Colors.redAccent,
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  '🔥 欢迎来到我的创新实验空间！',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                    shadows: [
                      Shadow(
                        color: Colors.red,
                        blurRadius: 2,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.redAccent, width: 2),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white.withOpacity(0.8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  child: const Text(
                    '🎓 姓名：孙晨恩 0133｜小组：08',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFC62828),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.redAccent, Colors.red],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red[400]!,
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        size: 36,
                        color: Colors.yellow,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '收集的星星：$completedTasks 颗',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.favorite, color: Colors.red, size: 20),
                    SizedBox(width: 8),
                    Text(
                      '坚持就是胜利！加油！💪',
                      style: TextStyle(color: Color(0xFFD32F2F)),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.favorite, color: Colors.red, size: 20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: finishOneTask,
        icon: const Icon(Icons.add_circle),
        label: const Text('点亮星星'),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        splashColor: Colors.white,
      ),
    );
  }
}