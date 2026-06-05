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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
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
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('蔡欣宜的创新实验 Flutter 首页'),
        backgroundColor: colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.rocket_launch, size: 76, color: colorScheme.primary),
              const SizedBox(height: 24),
              const Text(
                'Hello Flutter，我正在完成第 14 周入门任务！',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Column(
                    children: [
                      Text('姓名：蔡欣宜'),
                      SizedBox(height: 6),
                      Text('学号后四位：0081'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                '今日已完成任务：$completedTasks 次',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: finishOneTask,
        tooltip: '完成一次打卡',
        icon: const Icon(Icons.check),
        label: const Text('完成一次打卡'),
      ),
    );
  }
}
