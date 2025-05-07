import 'package:flutter/material.dart';
import '../main.dart'; // Import file main.dart

// Contoh data pengguna
class UserData {
  final String nama;
  final String nim;
  final String email;

  UserData({required this.nama, required this.nim, required this.email});
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Contoh instance UserData
  final UserData _user = UserData(
    nama: 'Muhamad Farhan',
    nim: '4522210057',
    email: '4522210057@univ.pancasila.ac.id',
  );

  // State untuk mengelola visibilitas email
  bool _isEmailVisible = true;
  // State untuk mengelola status tema lokal widget ini
  bool _isDarkModeLocal = false;

  @override
  Widget build(BuildContext context) {
    // Dapatkan instance dari _MyAppState untuk mengubah tema
    final _appState = context.findAncestorStateOfType<MyAppState>();
    final theme = Theme.of(context);
    final cardBackgroundColor = theme.cardColor;

    // Sinkronkan status lokal dengan tema aplikasi saat ini
    if (_appState != null) {
      _isDarkModeLocal = _appState.currentThemeMode == ThemeMode.dark;
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card( // Bungkus seluruh Column dengan Card
        color: cardBackgroundColor,
        elevation: 4.0, // Tambahkan sedikit bayangan
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Berikan padding di dalam Card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center( // Pusatkan avatar
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/images/farhan.jpeg'), // Ganti dengan URL gambar Anda
                  // child: Icon(Icons.person, size: 50.0),
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: Text(
                  'Profil Pengguna',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.headlineSmall?.color,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ListTile(
                leading: const Icon(Icons.person),
                title: Text('Nama: ${_user.nama}', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
              ),
              ListTile(
                leading: const Icon(Icons.badge),
                title: Text('NIM: ${_user.nim}', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isEmailVisible = !_isEmailVisible;
                  });
                },
                child: ListTile(
                  leading: const Icon(Icons.email),
                  title: Text(
                    _isEmailVisible ? 'Email: ${_user.email}' : 'Email: ●●●●●●●●●●●●',
                    style: TextStyle(
                      fontStyle: _isEmailVisible ? FontStyle.normal : FontStyle.italic,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                  subtitle: _isEmailVisible ? const Text('Ketuk untuk menyembunyikan') : const Text('Ketuk untuk menampilkan'),
                ),
              ),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Mode Gelap', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
                  Switch(
                    value: _isDarkModeLocal,
                    onChanged: (bool value) {
                      setState(() {
                        _isDarkModeLocal = value;
                        // Perbarui tema aplikasi melalui _MyAppState
                        _appState?.setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}