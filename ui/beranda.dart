// import 'package:flutter/material.dart';
// class HomePage1 extends StatelessWidget {
//   // Fungsi untuk menampilkan dialog dengan gambar dan teks
//   void _showFeatureDialog(BuildContext context, String title, String content, String imageUrl) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(title),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // Menampilkan gambar dari URL
//               Image.network(imageUrl, height: 200, width: 150, fit: BoxFit.contain),
//               SizedBox(height: 10),
//               Text(content, textAlign: TextAlign.justify),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text("Close"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Plant Care App"),
//         backgroundColor: Colors.greenAccent,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // Header Section
//               Container(
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.green[100],
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Row(
//                   children: [
//                     Icon(Icons.local_florist, size: 60, color: Colors.green),
//                     SizedBox(width: 16),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Welcome to Plant Care!",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.green[800],
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Text(
//                             "Explore medicinal plants, learn health tips, and scan plants easily.",
//                             style: TextStyle(fontSize: 14, color: Colors.green[700]),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Additional Features Section
//               Text(
//                 "Additional Features",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[800]),
//               ),
//               SizedBox(height: 10),
//               // Feature 1: Health Tips
//               ListTile(
//                 leading: Icon(Icons.health_and_safety, color: Colors.green, size: 30),
//                 title: Text("Tips Kesehatan", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                 subtitle: Text("Temukan tips untuk gaya hidup sehat menggunakan tanaman obat."),
//                 onTap: () {
//                   _showFeatureDialog(
//                     context,
//                     "Tips Kesehatan",
//                     "Minumlah teh herbal seperti chamomile atau teh hijau untuk meningkatkan sistem imun. "
//                     "Gunakan kunyit untuk manfaat antiinflamasi.",
//                     'assets/A.png', // URL gambar
//                   );
//                 },
//               ),
//               Divider(),
//               // Feature 2: Herbal Remedies Guide
//               ListTile(
//                 leading: Icon(Icons.book, color: Colors.green, size: 30),
//                 title: Text("Panduan Ramuan Herbal", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                 subtitle: Text("Pelajari tentang ramuan herbal dan manfaat kesehatannya."),
//                 onTap: () {
//                   _showFeatureDialog(
//                     context,
//                     "Panduan Ramuan Herbal",
//                     "Pelajari pengobatan alami untuk berbagai masalah kesehatan. "
//                     "Misalnya, teh jahe untuk mengatasi mual atau lidah buaya untuk perawatan kulit.",
//                     'assets/B.jpeg', // URL gambar
//                   );
//                 },
//               ),
//               Divider(),
//               // Feature 3: Plant Care Tips
//               ListTile(
//                 leading: Icon(Icons.info, color: Colors.green, size: 30),
//                 title: Text("Tips Perawatan Tanaman", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                 subtitle: Text("Dapatkan panduan cara merawat tanaman obat Anda."),
//                 onTap: () {
//                   _showFeatureDialog(
//                     context,
//                     "Tips Perawatan Tanaman",
//                     "Sirami tanaman secara teratur, tetapi jangan berlebihan. "
//                     "Pastikan mereka mendapatkan cukup sinar matahari dan gunakan pupuk organik untuk pertumbuhan yang optimal.",
//                     'assets/C.png', // URL gambar
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               // Button for scanning plants
//               ElevatedButton.icon(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/ScanPage');
//                 },
//                 icon: Icon(Icons.qr_code_scanner, size: 24),
//                 label: Text("Scan Plant", style: TextStyle(fontSize: 14)),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.greenAccent,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//                 ),
//               ),
//               // Button for viewing plant list
//               ElevatedButton.icon(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/PlantListPage');
//                 },
//                 icon: Icon(Icons.local_florist, size: 24),
//                 label: Text("View List", style: TextStyle(fontSize: 14)),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.greenAccent,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//                 ),
//               ),
//               // Button for viewing profile
//               ElevatedButton.icon(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/profile');
//                 },
//                 icon: Icon(Icons.person, size: 24),
//                 label: Text("Profile", style: TextStyle(fontSize: 14)),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.greenAccent,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://yourdomain.com/api'; // Replace with your API URL

  // Fetch all plants
  Future<List<dynamic>> fetchPlants() async {
    final response = await http.get(Uri.parse('$baseUrl/plants'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['result'];
    } else {
      throw Exception('Failed to load plants');
    }
  }

  // Add a new plant
  Future<Map<String, dynamic>> addPlant(String name, String category, String description, String benefit) async {
    final response = await http.post(
      Uri.parse('$baseUrl/plants'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'name': name,
        'category': category,
        'description': description,
        'benefit': benefit,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to add plant');
    }
  }

  // Update an existing plant
  Future<Map<String, dynamic>> updatePlant(int id, String name, String category, String description, String benefit) async {
    final response = await http.put(
      Uri.parse('$baseUrl/plants/$id'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'name': name,
        'category': category,
        'description': description,
        'benefit': benefit,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update plant');
    }
  }

  // Delete a plant
  Future<Map<String, dynamic>> deletePlant(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/plants/$id'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to delete plant');
    }
  }
}

class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  ApiService apiService = ApiService();
  List<dynamic> plants = [];

  @override
  void initState() {
    super.initState();
    fetchPlants();
  }

  // Fetch plants from the API
  void fetchPlants() async {
    try {
      final fetchedPlants = await apiService.fetchPlants();
      setState(() {
        plants = fetchedPlants;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  // Function to show the feature dialog with image and description
  void _showFeatureDialog(BuildContext context, String title, String content, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(imageUrl, height: 200, width: 150, fit: BoxFit.contain),
              SizedBox(height: 10),
              Text(content, textAlign: TextAlign.justify),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  // Handle tapping on a plant to view more details
  void onPlantTap(int plantId) {
    // Open a dialog or navigate to another page to view/update the plant
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plant Care App"),
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Section
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Icon(Icons.local_florist, size: 60, color: Colors.green),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome to Plant Care!",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800],
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Explore medicinal plants, learn health tips, and scan plants easily.",
                            style: TextStyle(fontSize: 14, color: Colors.green[700]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Additional Features Section
              Text(
                "Additional Features",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[800]),
              ),
              SizedBox(height: 10),
              // Feature 1: Health Tips
              ListTile(
                leading: Icon(Icons.health_and_safety, color: Colors.green, size: 30),
                title: Text("Tips Kesehatan", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                subtitle: Text("Temukan tips untuk gaya hidup sehat menggunakan tanaman obat."),
                onTap: () {
                  _showFeatureDialog(
                    context,
                    "Tips Kesehatan",
                    "Minumlah teh herbal seperti chamomile atau teh hijau untuk meningkatkan sistem imun. "
                    "Gunakan kunyit untuk manfaat antiinflamasi.",
                    'assets/A.png', // Image URL
                  );
                },
              ),
              Divider(),
              // Feature 2: Herbal Remedies Guide
              ListTile(
                leading: Icon(Icons.book, color: Colors.green, size: 30),
                title: Text("Panduan Ramuan Herbal", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                subtitle: Text("Pelajari tentang ramuan herbal dan manfaat kesehatannya."),
                onTap: () {
                  _showFeatureDialog(
                    context,
                    "Panduan Ramuan Herbal",
                    "Pelajari pengobatan alami untuk berbagai masalah kesehatan. "
                    "Misalnya, teh jahe untuk mengatasi mual atau lidah buaya untuk perawatan kulit.",
                    'assets/B.jpeg', // Image URL
                  );
                },
              ),
              Divider(),
              // Feature 3: Plant Care Tips
              ListTile(
                leading: Icon(Icons.info, color: Colors.green, size: 30),
                title: Text("Tips Perawatan Tanaman", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                subtitle: Text("Dapatkan panduan cara merawat tanaman obat Anda."),
                onTap: () {
                  _showFeatureDialog(
                    context,
                    "Tips Perawatan Tanaman",
                    "Sirami tanaman secara teratur, tetapi jangan berlebihan. "
                    "Pastikan mereka mendapatkan cukup sinar matahari dan gunakan pupuk organik untuk pertumbuhan yang optimal.",
                    'assets/C.png', // Image URL
                  );
                },
              ),
              SizedBox(height: 20),
              // List of Plants
              Text(
                "List of Plants",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[800]),
              ),
              SizedBox(height: 10),
              // Displaying plants from the API
              ListView.builder(
                shrinkWrap: true,
                itemCount: plants.length,
                itemBuilder: (context, index) {
                  var plant = plants[index];
                  return ListTile(
                    title: Text(plant['name']),
                    subtitle: Text(plant['category']),
                    onTap: () => onPlantTap(plant['id']),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Button for scanning plants
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/ScanPage');
                },
                icon: Icon(Icons.qr_code_scanner, size: 24),
                label: Text("Scan Plant", style: TextStyle(fontSize: 14)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                ),
              ),
              // Button for viewing plant list
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/PlantListPage');
                },
                icon: Icon(Icons.local_florist, size: 24),
                label: Text("View List", style: TextStyle(fontSize: 14)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                ),
              ),
              // Button for viewing user profile
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                icon: Icon(Icons.person, size: 24),
                label: Text("Profile", style: TextStyle(fontSize: 14)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
