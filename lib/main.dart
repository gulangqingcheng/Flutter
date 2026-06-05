import 'package:flutter/material.dart';

void main() {
  runApp(const InnovationHelloApp());
}

class InnovationHelloApp extends StatelessWidget {
  const InnovationHelloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '刘欣雨 - 创新实验 Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HelloHomePage(),
    );
  }
}

// ══════════════════════════════════════════
// 多语言文案表
// ══════════════════════════════════════════
class Lang {
  final String label;
  final String appBar;
  final String greeting;
  final String name;
  final String id;
  final String course;
  final String counter;   // {count}
  final String button;

  const Lang({
    required this.label,
    required this.appBar,
    required this.greeting,
    required this.name,
    required this.id,
    required this.course,
    required this.counter,
    required this.button,
  });

  String count(int n) => counter.replaceAll('{count}', '$n');
}

const Map<String, Lang> languages = {
  'en': Lang(
    label: 'English',
    appBar: 'Xinyu Liu - Flutter Innovation',
    greeting: 'Hello Flutter!\nWeek 14 complete!',
    name: 'Name: Xinyu Liu',
    id: 'ID: 0042',
    course: 'Course: Innovation Lab  Week 14',
    counter: 'Check-ins: {count}',
    button: 'Check in',
  ),
  'zh': Lang(
    label: '中文',
    appBar: '刘欣雨 - 创新实验 Flutter',
    greeting: '你好 Flutter！\n第14周打卡完成！',
    name: '姓名：刘欣雨',
    id: '学号：0042',
    course: '课程：创新实验  第14周',
    counter: '已打卡：{count} 次',
    button: '打卡',
  ),
  'es': Lang(
    label: 'Español',
    appBar: 'Xinyu Liu - Lab Innovación',
    greeting: '¡Hola Flutter!\n¡Semana 14 completada!',
    name: 'Nombre: Xinyu Liu',
    id: 'ID: 0042',
    course: 'Curso: Lab Innovación  Semana 14',
    counter: 'Registros: {count}',
    button: 'Registrar',
  ),
};

// ══════════════════════════════════════════
// 首页
// ══════════════════════════════════════════
class HelloHomePage extends StatefulWidget {
  const HelloHomePage({super.key});

  @override
  State<HelloHomePage> createState() => _HelloHomePageState();
}

class _HelloHomePageState extends State<HelloHomePage> {
  int completedTasks = 0;
  String _lang = 'en';

  Lang get l => languages[_lang]!;

  void finishOneTask() {
    setState(() => completedTasks++);
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(l.appBar),
        backgroundColor: cs.inversePrimary,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE8EAF6), Color(0xFFF3E5F5), Color(0xFFFCE4EC)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              // ── 图标 ──
              const Icon(Icons.school, size: 88, color: Colors.deepPurple),
              const SizedBox(height: 20),

              // ── 问候语 ──
              Text(
                l.greeting,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 24),

              // ── 个人信息卡片 ──
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.deepPurple.shade200),
                ),
                child: Column(
                  children: [
                    Text(l.name, style: const TextStyle(fontSize: 17)),
                    const SizedBox(height: 6),
                    Text(l.id, style: const TextStyle(fontSize: 17)),
                    const SizedBox(height: 6),
                    Text(l.course, style: const TextStyle(fontSize: 17)),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // ── 计数 ──
              Text(
                l.count(completedTasks),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.deepPurple,
                      fontSize: 22,
                    ),
              ),

              const SizedBox(height: 20),

              // ═══════════════════════════════
              // 语言切换（缩小版）           ═══
              // ═══════════════════════════════
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.language, size: 14, color: Colors.grey),
                  const SizedBox(width: 4),
                  ...languages.entries.map((e) {
                    final selected = _lang == e.key;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(6),
                        onTap: () => setState(() => _lang = e.key),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: selected ? cs.primary.withValues(alpha: 0.12) : Colors.transparent,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: selected ? cs.primary.withValues(alpha: 0.4) : Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            e.value.label,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                              color: selected ? cs.primary : Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
              ],
            ),
          ),
        ), // Center
      ), // Container

      // ── 打卡按钮 ──
      floatingActionButton: FloatingActionButton.extended(
        onPressed: finishOneTask,
        icon: const Icon(Icons.done_all),
        label: Text(l.button),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
    );
  }
}
