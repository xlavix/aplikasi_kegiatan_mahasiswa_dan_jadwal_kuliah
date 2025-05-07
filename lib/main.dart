import 'package:flutter/material.dart';
import 'Pages/halaman_utama.dart';
import 'Pages/halaman_jadwal_kuliah.dart';
import 'Pages/halaman_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState(); // Ubah _MyAppState menjadi MyAppState
}

class MyAppState extends State<MyApp> { // Ubah _MyAppState menjadi MyAppState
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get currentThemeMode => _themeMode;

  void setThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Kegiatan Mahasiswa dan Jadwal Kuliah',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  Widget _currentBody = const HomeScreen();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          _currentBody = const HomeScreen();
          break;
        case 1:
          _currentBody = const TampilanJadwal();
          break;
        case 2:
          _currentBody = const ProfileScreen();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Kegiatan dan Jadwal Kuliah'),
      ),
      body: _currentBody,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Jadwal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}