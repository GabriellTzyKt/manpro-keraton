import 'package:coba/NotificationPage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'bottomNav.dart';
import 'EventPage.dart';
import 'ProfilePage.dart';
import 'JavaneseCalendar.dart';
import 'QrScannerPage.dart';

class HomePage extends StatefulWidget {
  final String username;

  HomePage({required this.username});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Menyimpan index halaman yang aktif

  // Variabel untuk menyimpan data profil
  String fullName = '';
  String phone = '';
  String birthPlace = '';
  String birthDate = '';
  String email = '';
  String address = '';
  String wongso = '';
  String gender = '';

  // Controller untuk menyimpan input dari form
  final TextEditingController tujuanController = TextEditingController();
  final TextEditingController keteranganController = TextEditingController();

  // Fungsi untuk mengambil data dari SharedPreferences (jika menggunakan SharedPreferences)
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
  void initState() {
    super.initState();
    // Load data dari SharedPreferences ketika halaman pertama kali dimuat
    _loadUserData();
  }

  // Controller untuk Laporan
  final TextEditingController keteranganLaporanController = TextEditingController();
  File? _image;

  // Status apakah laporan sudah dibuat
  bool isReported = false;

  // Fungsi untuk memilih gambar dari galeri atau kamera
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  // Fungsi untuk menentukan tampilan berdasarkan index
  Widget _getPageContent() {
    if (_selectedIndex == 0) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header dengan logo dan nama pengguna
            Container(
              color: Colors.blue[900],
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/logo.png', // Gambar logo
                        height: 70,
                        width: 70,
                      ),
                      Text(
                        'Sugeng Rawuh',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                      ),
                      SizedBox(width: 10), // Spacer
                      Text(
                        widget.username, // Nama pengguna
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Bagian Kalender
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: JavaneseCalendar(),
            ),
            SizedBox(height: 20),
            // Section Check-in
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Check in',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Image.asset(
                            'assets/check_in.jpg', // Kosongkan dulu
                            height: 80.0,
                            width: 80.0,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            'Situs paling dekat dengan anda',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          subtitle: Text(
                            'Keraton Surakarta Hadiningrat',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Menampilkan pop-up untuk check-in
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder: (context) => Padding(
                                padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).viewInsets.bottom,
                                  left: 16.0,
                                  right: 16.0,
                                  top: 16.0,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Check-in',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue[900],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextField(
                                      controller: tujuanController,
                                      decoration: InputDecoration(
                                        labelText: 'Tujuan Kedatangan',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    TextField(
                                      controller: keteranganController,
                                      decoration: InputDecoration(
                                        labelText: 'Keterangan Kedatangan',
                                        border: OutlineInputBorder(),
                                      ),
                                      maxLines: 3,
                                    ),
                                    SizedBox(height: 20),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue[900],
                                          padding: EdgeInsets.symmetric(vertical: 16),
                                        ),
                                        onPressed: () {
                                          String tujuan = tujuanController.text;
                                          String keterangan = keteranganController.text;

                                          // Simpan data check-in
                                          Navigator.pop(context); // Tutup pop-up
                                        },
                                        child: Text(
                                          'Check-in',
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Check-in',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[900],
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Section Tugas Pribadi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tugas Pribadi',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  // Tugas 1
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Bertapa di Umbul Tirto Mulyo',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('29 Sep 24/25 Wage'),
                              // Ganti status tugas berdasarkan 'isReported'
                              Text(
                                isReported ? 'Selesai' : 'Ditugaskan',
                                style: TextStyle(
                                  color: isReported ? Colors.green : Colors.orange,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (!isReported) {
                              // Menampilkan modal bottom sheet buat laporan jika belum dilaporkan
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                builder: (context) => Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).viewInsets.bottom,
                                    left: 16.0,
                                    right: 16.0,
                                    top: 16.0,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Laporan',
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[900],
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      TextField(
                                        controller: keteranganLaporanController,
                                        decoration: InputDecoration(
                                          labelText: 'Keterangan',
                                          hintText: 'Keterangan Laporan Tugas',
                                          border: OutlineInputBorder(),
                                        ),
                                        maxLines: 3,
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        'Bukti Foto',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[900],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      ElevatedButton(
                                        onPressed: () {
                                          _pickImage(); // Fungsi untuk memilih gambar
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.yellow[700],
                                          minimumSize: Size(double.infinity, 50),
                                        ),
                                        child: Text(
                                          'Upload File',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      if (_image != null)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                                          child: Image.file(
                                            _image!,
                                            height: 150,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      SizedBox(height: 20),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue[900],
                                            padding: EdgeInsets.symmetric(vertical: 16),
                                          ),
                                          onPressed: () {
                                            // Aksi laporkan
                                            setState(() {
                                              isReported = true; // Tandai bahwa laporan telah dibuat
                                            });

                                            Navigator.pop(context); // Tutup pop-up setelah laporkan
                                          },
                                          child: Text(
                                            'Laporkan',
                                            style: TextStyle(fontSize: 18.0),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                          // Ganti tombol berdasarkan status laporan
                          child: Text(
                            isReported ? 'Lihat Laporan' : 'Buat Laporan',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[900],
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  // Tugas 2
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Bersihkan Gedung Djoeang',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('29 Sep 24/25 Wage'),
                              Text(
                                'Selesai',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Lihat Laporan
                          },
                          child: Text(
                            'Lihat Laporan',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[900],
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Section Tugas Acara (Kosongkan jika belum ada)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tugas Acara',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  // Tugas Acara (Kosongkan)
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      title: Text(
                        'Tidak ada tugas acara saat ini',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      );
    } else if (_selectedIndex == 1) {
      return EventPage();
    } else if (_selectedIndex == 3) {
      return Notificationpage();
    } else if (_selectedIndex == 4) {
      return ProfilePage();
    }
    else {
      return Center(child: Text("Unknown Page")); // Placeholder jika ada error
    }
  }

  // Fungsi untuk mengatur perubahan tab
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _getPageContent(), // Menampilkan halaman sesuai pilihan
      bottomNavigationBar: BottomNav(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Pastikan fungsi ini sesuai dengan parameter
      ),
    );
  }
}
