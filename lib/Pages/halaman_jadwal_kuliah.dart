import 'package:flutter/material.dart';

class JadwalKuliah {
  final String hari;
  final String mataKuliah;
  final String waktu;

  JadwalKuliah({
    required this.hari,
    required this.mataKuliah,
    required this.waktu,
  });
}

class TampilanJadwal extends StatefulWidget {
  const TampilanJadwal({super.key});

  @override
  State<TampilanJadwal> createState() => _TampilanJadwalState();
}

class _TampilanJadwalState extends State<TampilanJadwal> {
  final List<String> _daftarHari = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat'];
  String _hariAktif = 'Senin';
  final List<JadwalKuliah> _jadwal = [
    JadwalKuliah(hari: 'Senin', mataKuliah: 'Pemrograman Berbasis Mobile', waktu: '08:00 - 10:30'),
    JadwalKuliah(hari: 'Senin', mataKuliah: 'Ethical Hacking', waktu: '10:30 - 13:00'),
    JadwalKuliah(hari: 'Selasa', mataKuliah: 'Metode Penelitian', waktu: '11:20 - 13:50'),
    JadwalKuliah(hari: 'Selasa', mataKuliah: 'Prak. Pemrograman Berbasis Mobilw', waktu: '13:50 - 16:20'),
    JadwalKuliah(hari: 'Rabu', mataKuliah: 'Manajemen Proyek', waktu: '09:40 - 12:10'),
    JadwalKuliah(hari: 'Kamis', mataKuliah: 'Computer Forensic', waktu: '10:30 - 13:00'),
    JadwalKuliah(hari: 'Kamis', mataKuliah: 'Prak. Jaringan Komputer', waktu: '15:30 - 18:00'),
    JadwalKuliah(hari: 'Jumat', mataKuliah: 'Geoinformatika', waktu: '08:00 - 09:40'),
  ];

  List<JadwalKuliah> get _jadwalHariIni {
    return _jadwal.where((jadwal) => jadwal.hari == _hariAktif).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardBackgroundColor = theme.cardColor;
    final textColor = theme.textTheme.bodyMedium?.color;
    final secondaryTextColor = theme.textTheme.bodySmall?.color;
    final indicatorColor = theme.primaryColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(),
        SingleChildScrollView( // Membuat hari bisa di-scroll jika terlalu banyak
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _daftarHari.map((hari) {
              final isAktif = _hariAktif == hari;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _hariAktif = hari;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        hari,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isAktif ? textColor : secondaryTextColor,
                        ),
                      ),
                      if (isAktif)
                        Container(
                          height: 2.0,
                          width: 24.0,
                          color: indicatorColor,
                          margin: const EdgeInsets.only(top: 4.0),
                        ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 16.0),
        Expanded(
          child: ListView.builder(
            itemCount: _jadwalHariIni.length,
            itemBuilder: (context, index) {
              final mataKuliah = _jadwalHariIni[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                color: cardBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mataKuliah.mataKuliah,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        mataKuliah.waktu,
                        style: TextStyle(color: secondaryTextColor),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}