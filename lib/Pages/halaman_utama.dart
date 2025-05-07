import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Kegiatan {
  String nama;
  DateTime tanggal;
  bool selesai;

  Kegiatan({required this.nama, required this.tanggal, this.selesai = false});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Kegiatan> _kegiatan = [
    Kegiatan(nama: 'Kegiatan 1', tanggal: DateTime(2025, 5, 8)),
    Kegiatan(nama: 'Kegiatan 2', tanggal: DateTime(2025, 5, 10)),
    Kegiatan(nama: 'Kegiatan 3', tanggal: DateTime(2025, 5, 12)),
    Kegiatan(nama: 'Kegiatan 5', tanggal: DateTime(2025, 5, 15)),
  ];

  void _toggleSelesai(int index) {
    setState(() {
      _kegiatan[index].selesai = !_kegiatan[index].selesai;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _kegiatan.length,
      itemBuilder: (context, index) {
        final kegiatan = _kegiatan[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        kegiatan.nama,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        DateFormat('dd MMMM yyyy').format(kegiatan.tanggal),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Checkbox(
                  value: kegiatan.selesai,
                  onChanged: (bool? value) {
                    _toggleSelesai(index);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}