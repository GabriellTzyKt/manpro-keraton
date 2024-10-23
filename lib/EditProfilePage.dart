import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilePage extends StatefulWidget {
  final String fullName;
  final String birthPlace;
  final String birthDate;
  final String address;
  final String phone;
  final String email;
  final String wongso;
  final String gender;

  EditProfilePage({
    required this.fullName,
    required this.birthPlace,
    required this.birthDate,
    required this.address,
    required this.phone,
    required this.email,
    required this.wongso,
    required this.gender,
  });

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController fullNameController;
  late TextEditingController birthPlaceController;
  late TextEditingController birthDateController;
  late TextEditingController addressController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController wongsoController;
  late TextEditingController genderController;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController(text: widget.fullName);
    birthPlaceController = TextEditingController(text: widget.birthPlace);
    birthDateController = TextEditingController(text: widget.birthDate);
    addressController = TextEditingController(text: widget.address);
    phoneController = TextEditingController(text: widget.phone);
    emailController = TextEditingController(text: widget.email);
    wongsoController = TextEditingController(text: widget.wongso);
    genderController = TextEditingController(text: widget.gender);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubah Profil'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: fullNameController,
                decoration: InputDecoration(labelText: 'Nama Lengkap'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: birthPlaceController,
                decoration: InputDecoration(labelText: 'Tempat Lahir'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: birthDateController,
                decoration: InputDecoration(labelText: 'Tanggal Lahir'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Alamat'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'No. Telp'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: wongsoController,
                decoration: InputDecoration(labelText: 'Wongso'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: genderController,
                decoration: InputDecoration(labelText: 'Jenis Kelamin'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Simpan data yang telah diubah ke SharedPreferences
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString('fullName', fullNameController.text);
                  prefs.setString('phone', phoneController.text);
                  prefs.setString('birthPlace', birthPlaceController.text);
                  prefs.setString('birthDate', birthDateController.text);
                  prefs.setString('email', emailController.text);
                  prefs.setString('address', addressController.text);
                  prefs.setString('wongso', wongsoController.text);
                  prefs.setString('gender', genderController.text);

                  // Setelah data disimpan, kembalikan status 'true' menandakan data diubah
                  Navigator.pop(context, true);
                },
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
