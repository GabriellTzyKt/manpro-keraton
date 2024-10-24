import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  int _selectedIndex = 0;
  String searchQuery = '';

  // Daftar acara yang akan ditampilkan
  final List<Map<String, String>> events = [
    {
      "title": "Kirab 1 Suro Keraton Surakarta",
      "location": "Keraton Surakarta",
      "time": "23.59 - Selesai",
      "date": "07 Juli 2024 / Minggu Kliwon, 29 Besar 1957",
      "responsible": "xxx",
      "description":
          "Kirab Pusaka Malam 1 Suro di Keraton Surakarta adalah perayaan tahunan yang menandai tahun baru Jawa dengan pengusungan pusaka keraton. Acara dimulai dengan doa bersama di keraton, diikuti oleh prosesi mengarak pusaka seperti keris dan barang bersejarah.",
      "image": "assets/kirab1.jpg"
    },
    {
      "title": "Wilujeng Ruwahan",
      "location": "Keraton Surakarta",
      "time": "10.00 - Selesai",
      "date": "15 Juli 2024 / Senin Pahing, 10 Besar 1957",
      "responsible": "yyy",
      "description":
          "Wilujeng Ruwahan adalah tradisi tahunan di mana masyarakat mengadakan doa bersama untuk para leluhur sebagai bentuk penghormatan.",
      "image": "assets/wilujeng.png"
    },
    {
      'title': 'Garebeg Pasa',
      'location': 'Keraton Surakarta',
      "time": "15.00 - Selesai",
      "date": "15 Juli 2024 / Senin Pahing, 10 Besar 1957",
      "responsible": "xxx",
      "description":
          "Garebeg Pasa adalah tradisi di bulan suci.",
      'image': 'assets/garebeg.png'
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menghilangkan tombol back
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png', // Add your logo here
              height: 40, // Adjust the size as needed
            ),
            SizedBox(width: 10), // Space between logo and title
            Text(
              'Acara',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search bar di bagian atas
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Telusuri...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();
                  });
                },
              ),
            ),
            // Menampilkan daftar acara yang difilter berdasarkan pencarian
            Column(
              children: events
                  .where((event) => event['title']!
                      .toLowerCase()
                      .contains(searchQuery)) // Filter berdasarkan pencarian
                  .map((event) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Tambahkan padding di sini
                  child: Card(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0), // Membuat gambar rounded
                          child: Image.asset( // Menggunakan gambar lokal dari folder assets
                            event['image']!,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ListTile(
                          title: Text(event['title']!),
                          subtitle: Text(event['location']!),
                          leading: Icon(Icons.location_on_sharp),
                          trailing: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EventDetailPage(event: event), // Ambil 1 event berdasarkan index
                                ),
                              );
                            },
                            child: Text('Detail'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}


class EventDetailPage extends StatelessWidget {
  final Map<String, String> event;

  EventDetailPage({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Acara'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0), // Membuat gambar rounded
                child: Image.asset( // Menggunakan gambar lokal dari folder assets
                  event['image']!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(
                event['title']!,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.blue),
                  SizedBox(width: 8),
                  Text(event['location']!, style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.person, color: Colors.blue),
                  SizedBox(width: 8),
                  Text("Penanggung Jawab: " + event['responsible']!, style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.access_time, color: Colors.blue),
                  SizedBox(width: 8),
                  Text("Jam Acara: " + event['time']!, style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.blue),
                  SizedBox(width: 8),
                  Text(event['date']!, style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.public, color: Colors.blue),
                  SizedBox(width: 8),
                  Text("Umum", style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.blue),
                  SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      "Jl. Kamandungan, Baluwarti, Kec. Ps. Kliwon, Kota Surakarta, Jawa Tengah 57144\n-7.577540524712154, 110.82866091423664",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                "Keterangan Acara",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                event['description']!,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              // Tombol RSVP dengan ukuran yang lebih besar dan warna biru
              SizedBox(
                width: double.infinity, // Tombol penuh selebar layar
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900], // Warna biru sesuai gambar
                    padding: EdgeInsets.symmetric(vertical: 16), // Ukuran tombol lebih besar
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RSVPPage()), // Navigasi ke halaman RSVP
                    );
                  },
                  child: Text(
                    'RSVP',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RSVPPage extends StatefulWidget {
  @override
  _RSVPPageState createState() => _RSVPPageState();
}

class _RSVPPageState extends State<RSVPPage> {
  // Text Editing Controllers for main participant
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String gender = 'Laki-laki';

  // List to hold multiple additional participant inputs
  List<Map<String, dynamic>> additionalParticipants = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RSVP'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'No. Telp',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: gender,
                decoration: InputDecoration(
                  labelText: 'Jenis Kelamin',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
                items: ['Laki-laki', 'Perempuan']
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
              ),
              SizedBox(height: 16),
              Text('Peserta Tambahan (Opsional)', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // Add new participant form fields
                  setState(() {
                    additionalParticipants.add({
                      'name': TextEditingController(),
                      'gender': 'Laki-laki',
                      'phone': TextEditingController(),
                    });
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
                child: Text('+ Tambah Data', style: TextStyle(color: Colors.black)),
              ),
              // Render additional participant fields
              ...additionalParticipants.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, dynamic> participant = entry.value;
                
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  color: Colors.blue[50],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Peserta ${index + 1}', style: TextStyle(fontWeight: FontWeight.bold)),
                            IconButton(
                              icon: Icon(Icons.close, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  additionalParticipants.removeAt(index); // Remove participant
                                });
                              },
                            )
                          ],
                        ),
                        TextField(
                          controller: participant['name'],
                          decoration: InputDecoration(
                            labelText: 'Nama Lengkap',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          value: participant['gender'],
                          decoration: InputDecoration(
                            labelText: 'Jenis Kelamin',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            setState(() {
                              participant['gender'] = value!;
                            });
                          },
                          items: ['Laki-laki', 'Perempuan']
                              .map((label) => DropdownMenuItem(
                                    child: Text(label),
                                    value: label,
                                  ))
                              .toList(),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          controller: participant['phone'],
                          decoration: InputDecoration(
                            labelText: 'No. Telp',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Logika RSVP bisa ditambahkan di sini
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text('Daftar', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
