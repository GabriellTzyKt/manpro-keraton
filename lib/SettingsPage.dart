import 'package:coba/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'EditProfilePage.dart';
import 'HomePage.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Variabel untuk menyimpan data profil
  String fullName = '';
  String phone = '';
  String birthPlace = '';
  String birthDate = '';
  String email = '';
  String address = '';
  String wongso = '';
  String gender = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Fungsi untuk mengambil data dari SharedPreferences
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

  // Fungsi untuk memperbarui data profil setelah perubahan dari EditProfilePage
  Future<void> _updateProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('fullName') ?? fullName;
      phone = prefs.getString('phone') ?? phone;
      birthPlace = prefs.getString('birthPlace') ?? birthPlace;
      birthDate = prefs.getString('birthDate') ?? birthDate;
      email = prefs.getString('email') ?? email;
      address = prefs.getString('address') ?? address;
      wongso = prefs.getString('wongso') ?? wongso;
      gender = prefs.getString('gender') ?? gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pengaturan',
          style: TextStyle(
            color: Colors.blue[900],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue[900]),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Akun',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.blue[900]),
              title: Text('Ubah Profil'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[900]),
              onTap: () async {
                // Navigasi ke halaman EditProfile dan update data setelah kembali
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(
                      fullName: fullName,
                      phone: phone,
                      birthPlace: birthPlace,
                      birthDate: birthDate,
                      email: email,
                      address: address,
                      wongso: wongso,
                      gender: gender,
                    ),
                  ),
                );
                // Panggil fungsi untuk memperbarui profil setelah kembali dari halaman edit
                _updateProfileData();
              },
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Logout logika (disesuaikan dengan kebutuhan)
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Log out',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
