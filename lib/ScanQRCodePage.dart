// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// class ScanQRCodePage extends StatefulWidget {
//   @override
//   _ScanQRCodePageState createState() => _ScanQRCodePageState();
// }

// class _ScanQRCodePageState extends State<ScanQRCodePage> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//   String? qrText = '';

//   // Untuk mereset QR ketika terjadi perubahan
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (controller != null) {
//       controller!.pauseCamera();
//       controller!.resumeCamera();
//     }
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         qrText = scanData.code;
//       });
//       // Setelah QR terdeteksi, lakukan sesuatu seperti menutup scanner dan menampilkan hasil
//       controller.pauseCamera(); // Menjeda kamera setelah QR di-scan
//       Navigator.pop(context, qrText); // Mengembalikan hasil scan ke page sebelumnya
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scan QR Code'),
//         backgroundColor: Colors.blue[900],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 4,
//             child: QRView(
//               key: qrKey,
//               onQRViewCreated: _onQRViewCreated,
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Silahkan scan QR Code/Barcode di kotak atas ini',
//                   style: TextStyle(
//                     color: Colors.yellow,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   qrText ?? 'Belum ada hasil scan',
//                   style: TextStyle(fontSize: 18, color: Colors.black),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (controller != null) {
//                       controller!.resumeCamera();
//                     }
//                   },
//                   child: Text('Mulai Ulang Scan'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue[900],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
