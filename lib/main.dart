import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDebugMode = true;  // Toggle between debug and release mode

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JIT Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        isDebugMode: isDebugMode,
        onToggle: () {
          setState(() {
            isDebugMode = !isDebugMode;
          });
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final bool isDebugMode;
  final VoidCallback onToggle;

  MyHomePage({required this.isDebugMode, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("JIT Test")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display JIT status
              Text(
                isDebugMode ? "JIT is enabled!" : "JIT is not available",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // More explanation about JIT
              Text(
                "JIT (Just-In-Time) is a compilation technique used to optimize performance at runtime. "
                "When JIT is enabled, your app code is compiled during execution, making it faster.\n\n"
                "In production (release mode), JIT is disabled for performance and security reasons. "
                "In debug mode, JIT is enabled by default.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              // Toggle button to switch between debug/release mode
              ElevatedButton(
                onPressed: onToggle,
                child: Text(isDebugMode ? "Switch to Release Mode" : "Switch to Debug Mode"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
