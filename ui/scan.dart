import 'dart:typed_data';
import 'dart:convert'; // Import JSON encoding
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ScanPage extends StatelessWidget {
  final ImagePicker _imagePicker = ImagePicker();

  Future<Map<String, dynamic>> _detectPlant(Uint8List imageBytes) async {
    final response = await http.post(
      Uri.parse('http://localhost/scan.php'), // Ganti dengan URL API PHP
      headers: {
        'Content-Type': 'application/json',
      },
      body: imageBytes, // Kirim gambar sebagai body raw
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['plant']; // Ambil hasil dari response
    } else {
      throw Exception('Gagal mendeteksi tanaman');
    }
  }

  Future<void> _scanPlant(BuildContext context) async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();

      try {
        // Proses deteksi tanaman
        Map<String, dynamic> scanResult = await _detectPlant(imageBytes);

        // Navigasi ke halaman hasil
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScanResultPage(
              scanResult: scanResult,
              imageBytes: imageBytes,
            ),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal mendeteksi tanaman')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Tidak ada gambar yang dipilih')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Tanaman'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => _scanPlant(context),
          icon: Icon(Icons.camera_alt),
          label: Text('Mulai Scan'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
        ),
      ),
    );
  }
}

class ScanResultPage extends StatelessWidget {
  final Map<String, dynamic> scanResult;
  final Uint8List imageBytes;

  ScanResultPage({required this.scanResult, required this.imageBytes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Scan Tanaman'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imageBytes != null)
            Image.memory(
              imageBytes,
              height: 150,
              fit: BoxFit.cover,
            ),
          SizedBox(height: 10),
          Text(
            'Hasil Scan:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 10),
          Text('Jenis Tanaman: ${scanResult["jenis"]}'),
          Text('Nama Latin: ${scanResult["namaLatin"]}'),
          Text('Manfaat: ${scanResult["manfaat"]}'),
          Text('Efek Samping: ${scanResult["efekSamping"]}'),
          Text('Kelebihan: ${scanResult["kelebihan"]}'),
          Text('Kekurangan: ${scanResult["kekurangan"]}'),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.refresh),
              label: Text('Scan Lagi'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}





