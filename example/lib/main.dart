import 'package:flutter/material.dart';
import 'package:nyx_ui/nyx_ui.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text('Hover me!')
            .p(16)
            .bg(Colors.blue)
            .rounded(12)
            .hoverEffect(
              hoverBg: Colors.blueAccent,
              hoverScale: 1.05,
              hoverShadow: [
                BoxShadow(color: Colors.blue.withOpacity(0.3), blurRadius: 12, offset: Offset(0, 4)),
              ],
            )
            .onTap(() => print('Clicked!')),
        ),
      ),
    );
  }
}
