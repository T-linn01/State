import 'package:flutter/material.dart';

void main() => runApp(ColorChangerApp());

class ColorChangerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ColorChangerPage());
  }
}

class ColorChangerPage extends StatefulWidget {
  @override
  _ColorChangerPageState createState() => _ColorChangerPageState();
}

class _ColorChangerPageState extends State<ColorChangerPage> {
  Color _backgroundColor = Colors.white;

  final List<Map<String, dynamic>> _colors = [
    {'name': 'Đỏ', 'color': Colors.red},
    {'name': 'Xanh lá', 'color': Colors.green},
    {'name': 'Xanh dương', 'color': Colors.blue},
  ];

  void _changeColor(Color newColor) {
    setState(() {
      _backgroundColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(title: Text('Chọn màu nền')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _colors.map((colorInfo) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () => _changeColor(colorInfo['color']),
                child: Text(colorInfo['name']),
                style: ElevatedButton.styleFrom(backgroundColor: colorInfo['color']),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
