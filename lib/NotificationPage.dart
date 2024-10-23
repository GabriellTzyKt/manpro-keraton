import 'package:flutter/material.dart';

class Notificationpage extends StatefulWidget {
  @override
  _NotificationpageState createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // Untuk dua tab, Forum dan Pesan
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png', // Ganti dengan logo yang sesuai
              height: 40,
            ),
            SizedBox(width: 10),
            Text(
              'Notifikasi',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),
            ),
          ],
        ),
        backgroundColor: Colors.blue[900],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Forum',),
            Tab(text: 'Pesan'),
          ],
          labelColor: Colors.yellow, // Warna teks tab aktif
  unselectedLabelColor: Colors.white, // Warna teks tab tidak aktif
          indicatorColor: Colors.yellow,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab Forum
          _buildForumTab(),
          // Tab Pesan
          _buildPesanTab(),
        ],
      ),
    );
  }

  // Widget untuk Tab Forum
  Widget _buildForumTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildForumSection('Forum Utama', [
          'Tata krama di lingkungan kraton',
          'Situs kraton',
          'Acara Kraton',
        ]),
      ],
    );
  }

  // Widget untuk setiap bagian forum
  Widget _buildForumSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[900]),
        ),
        SizedBox(height: 10),
        ...items.map((item) => ListTile(
          title: Text(item),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Aksi saat item forum diklik
          },
        )),
      ],
    );
  }

  // Widget untuk setiap pesan dalam forum
  Widget _buildForumMessage(String sender, String message) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        leading: Icon(Icons.chat_bubble_outline),
        title: Text(
          sender,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(message),
        onTap: () {
          // Aksi saat pesan diklik
        },
      ),
    );
  }

  // Widget untuk Tab Pesan
  Widget _buildPesanTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildPesanItem('Permohonan Pembina', 'Komunitas Macan Ayu ingin menjadikan anda sebagai pembina.'),
        _buildPesanItem('Permohonan Pelindung', 'Komunitas Macan Ayu ingin menjadikan anda sebagai pelindung.'),
        _buildPesanItem('Tugas Pribadi Baru', 'Anda diberikan tugas untuk Bertapa di Umbul Tirto Mulyo.'),
        _buildForumMessage('Budi', 'Hari ini akan ada acara'),
      ],
    );
  }

  // Widget untuk setiap pesan dalam tab Pesan
  Widget _buildPesanItem(String title, String message) {
    // Memeriksa apakah notifikasi adalah jenis permohonan
    bool isPermohonan = title.toLowerCase().contains('permohonan');
    return Card(
      elevation: 2.0,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(message),
        trailing: isPermohonan ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                // Aksi tombol Tolak
              },
              child: Text('Tolak', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                // Aksi tombol Terima
              },
              child: Text('Terima', style: TextStyle(color: Colors.green)),
            ),
          ],
        ) : null,
      ),
    );
  }
}
