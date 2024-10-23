import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'EditProfilePage.dart';
import 'SettingsPage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  String fullName = '';
  String phone = '';
  String birthPlace = '';
  String birthDate = '';
  String email = '';
  String address = '';
  String wongso = '';
  String gender = '';

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _tabController = TabController(length: 3, vsync: this);
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('fullName') ?? '';
      phone = prefs.getString('phone') ?? '';
      birthPlace = prefs.getString('birthPlace') ?? '';
      birthDate = prefs.getString('birthDate') ?? '';
      email = prefs.getString('email') ?? '';
      address = prefs.getString('address') ?? '';
      wongso = prefs.getString('wongso') ?? '';
      gender = prefs.getString('gender') ?? '';
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Fungsi untuk menampilkan QR Code dalam overlay
  void _showQrCodeOverlay(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "QR Code",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                QrImageView(
                  data: fullName,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                SizedBox(height: 16),
                TextButton(
                  child: Text("Tutup"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Fungsi untuk menampilkan Barcode dalam overlay
  void _showBarcodeOverlay(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Barcode",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                BarcodeWidget(
                  barcode: Barcode.code128(),
                  data: fullName,
                  width: 200,
                  height: 100,
                ),
                SizedBox(height: 16),
                TextButton(
                  child: Text("Tutup"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png', // Logo placeholder
              height: 40,
            ),
            SizedBox(width: 10),
            Text(
              'Profil',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue[900],
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
            },
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.yellow,
          unselectedLabelColor: Colors.white,
          indicatorColor: Colors.yellow,
          tabs: [
            Tab(text: 'Biodata'),
            Tab(text: 'Kelompok'),
            Tab(text: 'Riwayat Acara'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildBiodataTab(),
          _buildKelompokTab(),
          _buildRiwayatAcaraTab(),
        ],
      ),
    );
  }

  // Widget untuk Tab Biodata
  Widget _buildBiodataTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  SizedBox(height: 8),
                  Text(
                    fullName,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.qr_code),
                  label: Text('QR Code'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.yellow[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    _showQrCodeOverlay(context);
                  },
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.barcode_reader),
                  label: Text('Barcode'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.yellow[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    _showBarcodeOverlay(context);
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildProfileField("Nama Lengkap", fullName),
            _buildProfileField("Tempat Lahir", birthPlace),
            _buildProfileField("Tanggal Lahir", birthDate),
            _buildProfileField("Alamat", address),
            _buildProfileField("Jenis Kelamin", gender),
            _buildProfileField("Wongso", wongso),
            _buildProfileField("Email", email),
            _buildProfileField("No. Telp", phone),
          ],
        ),
      ),
    );
  }

  // Widget untuk Tab Kelompok dengan dua section: Organisasi dan Komunitas
  Widget _buildKelompokTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(
          "Organisasi",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        _buildKelompokItem('Bregada - Prajurit Keraton Surakarta Hadiningrat', 'Anggota', '50 orang'),
        SizedBox(height: 16),
        Text(
          "Komunitas",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        _buildKelompokItem('Sinau Batik', 'Anggota', '50 orang'),
      ],
    );
  }

  Widget _buildKelompokItem(String title, String role, String jumlahAnggota) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Sebagai: $role\nJumlah Anggota: $jumlahAnggota'),
      ),
    );
  }

  // Widget untuk Tab Riwayat Acara, dipisahkan berdasarkan tahun
  Widget _buildRiwayatAcaraTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(
          "2023",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        _buildRiwayatAcaraItem('Grebeg Maulud', 'Keraton Surakarta Hadiningrat', '19 Juli 2023 (1 Suro 2023)'),
        SizedBox(height: 16),
        Text(
          "2022",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        _buildRiwayatAcaraItem('Grebeg Maulud', 'Keraton Surakarta Hadiningrat', '19 Juli 2022 (1 Suro 2022)'),
      ],
    );
  }

  Widget _buildRiwayatAcaraItem(String acara, String lokasi, String tanggal) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        title: Text(acara, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Diadakan di: $lokasi'),
            Text('Tanggal: $tanggal', style: TextStyle(color: Colors.blue)),
            Text('Oleh: Keraton Kasunanan Surakarta Hadiningrat'),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        enabled: false,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        controller: TextEditingController(text: value),
      ),
    );
  }
}
