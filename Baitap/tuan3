import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI Components',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Chỉ chiếm không gian cần thiết
                  children: [
                    Image.asset('assets/logo.png', height: 100),
                    const SizedBox(height: 20),
                    const Text(
                      'Flutter UI Toolkit', // Sửa lại cho đúng ngữ cảnh
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Flutter is a modern UI toolkit for building beautiful, natively compiled applications.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                ),
                child: const Text("I'm ready", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('UI Components List')),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          sectionHeader('Display'),
          uiComponentCard('Text', 'Displays text', () => Navigator.push(context, MaterialPageRoute(builder: (context) => TextScreen()))),
          uiComponentCard('Image', 'Displays an image', () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ImageScreen()))),
          sectionHeader('Input'),
          uiComponentCard('TextField', 'Input field for text', () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TextFieldScreen()))),
          uiComponentCard('PasswordField', 'Input field for passwords', () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PasswordFieldScreen()))),
          sectionHeader('Layout'),
          uiComponentCard('Column', 'Arranges elements vertically', () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ColumnScreen()))),
          uiComponentCard('Row', 'Arranges elements horizontally', () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RowScreen()))),
        ],
      ),
    );
  }
} 

Widget uiComponentCard(String title, String subtitle, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Card(
      color: Colors.lightBlue[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        onTap: onTap,
      ),
    ),
  );
}

Widget sectionHeader(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
      textAlign: TextAlign.left,
    ),
  );
}

class TextScreen extends StatelessWidget {
  const TextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Text Detail')),
      body: Center(
        child: Text(
          'The quick Brown fox jumps over the lazy dog.',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Display')),
      body: Center(
        child: Image.asset('assets/dog.png',
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, size: 50),
        ),
      ),
    );
  }
}

class TextFieldScreen extends StatelessWidget {
  const TextFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextField Input')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          decoration: InputDecoration(labelText: 'Enter text'),
        ),
      ),
    );
  }
}

class PasswordFieldScreen extends StatelessWidget {
  const PasswordFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Password Input')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(labelText: 'Enter password'),
        ),
      ),
    );
  }
}

class ColumnScreen extends StatelessWidget {
  const ColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Column Layout')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Item 1'),
          Text('Item 2'),
          Text('Item 3'),
        ],
      ),
    );
  }
}

class RowScreen extends StatelessWidget {
  const RowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Row Layout')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Item A'),
          SizedBox(width: 10),
          Text('Item B'),
          SizedBox(width: 10),
          Text('Item C'),
        ],
      ),
    );
  }
}
