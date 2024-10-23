import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomePage.dart';
import 'ProfilePage.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Column(
        children: [
          SizedBox(height: 20),
          // Placeholder untuk logo atau coat of arms
          Container(
            height: 240.0,
            width: 240.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo.png'), // Ganti dengan logo sesuai kebutuhan
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text di dalam kontainer putih
                  Text(
                    'Maha Menteri\nKeraton Surakarta',
                    style: TextStyle(
                      fontFamily: 'JosefinSans',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 70),
                  // TextField Username
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  // TextField Password dengan toggle visibility
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.visibility),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 180.0),
                  // Tombol Login
                  ElevatedButton(
                    onPressed: () {
                      // Ambil input username
                      String username = _usernameController.text;

                      // Pindah ke halaman HomePage dengan username yang diinputkan
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(username: username), // Kirim username ke HomePage
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow, // Warna tombol
                      minimumSize: Size(double.infinity, 50), // Tombol full-width
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text(
                      'Masuk',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  // Link ke halaman Register
                  GestureDetector(
                    onTap: () {
                      // Pindah ke halaman registrasi
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Belum punya akun ? Daftar',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900], // Background biru
      body: Column(
        children: [
          SizedBox(height: 20),
          // Logo di bagian atas
          Container(
            height: 240.0,
            width: 240.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo.png'), // Path ke logo yang benar
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text inside the white container
                    Text(
                      'Maha Menteri\nKeraton Surakarta',
                      style: TextStyle(
                        fontFamily: 'JosefinSans',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    // Username TextField
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    // Password TextField
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Kata Sandi',
                        suffixIcon: Icon(Icons.visibility),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    // Confirm Password TextField
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Konfirmasi Kata Sandi',
                        suffixIcon: Icon(Icons.visibility),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    // Sign Up Button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BiodataPage(), // Reference to the sign-up page
                        ),
                      );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text(
                        'Daftar',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    // Login link
                    GestureDetector(
                      onTap: () {
                        // Navigate back to login page
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Sudah punya akun ? Masuk',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BiodataPage extends StatefulWidget {
  @override
  _BiodataPageState createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _birthPlaceController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _wongsoController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  Future<void> _saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fullName', _fullNameController.text);
    await prefs.setString('phone', _phoneController.text);
    await prefs.setString('birthPlace', _birthPlaceController.text);
    await prefs.setString('birthDate', _birthDateController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('address', _addressController.text);
    await prefs.setString('wongso', _wongsoController.text);
    await prefs.setString('gender', _genderController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 50,
                  width: 50,
                ),
                SizedBox(width: 10),
                Text(
                  'Biodata',
                  style: TextStyle(
                    fontFamily: 'JosefinSans',
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nama Lengkap
                    TextField(
                      controller: _fullNameController,
                      decoration: InputDecoration(
                        labelText: 'Nama Lengkap',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    // No. Hp
                    TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: 'No. Hp',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    // Tempat, Tanggal Lahir
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _birthPlaceController,
                            decoration: InputDecoration(
                              labelText: 'Tempat, Tanggal Lahir',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20.0),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: TextField(
                            controller: _birthDateController,
                            decoration: InputDecoration(
                              labelText: 'Tanggal Lahir',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20.0),
                            ),
                            readOnly: true, // Agar tidak bisa diketik manual
                            onTap: () async {
                              DateTime? selectedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              );

                              if (selectedDate != null) {
                                setState(() {
                                  _birthDateController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
                                });
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 10.0),
                        IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () async {
                            DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );

                            if (selectedDate != null) {
                              setState(() {
                                _birthDateController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
                              });
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    // Email
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    // Alamat
                    TextField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        labelText: 'Alamat',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    // Wongso
                    TextField(
                      controller: _wongsoController,
                      decoration: InputDecoration(
                        labelText: 'Wongso',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    // Jenis Kelamin
                    TextField(
                      controller: _genderController,
                      decoration: InputDecoration(
                        labelText: 'Jenis Kelamin',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    // Daftar Button
                    ElevatedButton(
                      onPressed: () async {
                        await _saveUserData();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(), // Kembali ke halaman login setelah menyimpan data
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text(
                        'Daftar',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}