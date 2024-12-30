import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant List',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: PlantListPage(),
    );
  }
}

class PlantListPage extends StatefulWidget {
  @override
  _PlantListPageState createState() => _PlantListPageState();
}

class _PlantListPageState extends State<PlantListPage> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";
  List<Plant> _plants = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPlants();
  }

  // Fetch plants data from API or use static data if empty
  Future<void> _fetchPlants() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse('http://127.0.0.1/tanaman_obat/getplants.php'));

      print("Raw Response: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == 200) {
          setState(() {
            _plants = (data['result'] as List)
                .map((plantData) => Plant.fromJson(plantData))
                .toList();
          });
        } else {
          _showErrorDialog("Error: ${data['result']}");
        }
      } else {
        _showErrorDialog("Failed to connect to the server. Status code: ${response.statusCode}");
      }
    } catch (e) {
      _showErrorDialog("An error occurred: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Return static plants data if list is empty
  List<Plant> _getPlants() {
    if (_plants.isEmpty) {
      return [
        Plant(
          name: 'Daun Sirih',
          latinName: 'Piper betle',
          description: 'Menyembuhkan sariawan, mengatasi bau badan.',
          usage: 'Diminum sebagai ramuan herbal atau digunakan sebagai obat luar.',
          imageUrl: 'assets/daun sirih.jpeg',
          benefits: 'Membantu kesehatan mulut, menyegarkan tubuh.',
          category: 'Herbal',
        ),
        Plant(
          name: 'Kunyit',
          latinName: 'Curcuma longa',
          description: 'Meningkatkan daya tahan tubuh, mengatasi peradangan.',
          usage: 'Dijadikan ramuan untuk diminum atau digunakan dalam masakan.',
          imageUrl: 'assets/kunyit.jpeg',
          benefits: 'Mengurangi inflamasi, meningkatkan imun.',
          category: 'Rempah',
        ),
          Plant(
          name: 'Jahe',
          latinName: 'Zingiber officinale',
          description: 'Mengatasi mual, meredakan flu dan batuk.',
          usage: 'Dijadikan ramuan teh atau digunakan dalam masakan.',
          imageUrl: 'assets/jahe.jpeg',
          benefits: 'Meningkatkan sirkulasi darah, meredakan mual.',
          category: 'Rempah',
        ),
        Plant(
          name: 'Aloe Vera',
          latinName: 'Aloe barbadensis miller',
          description: 'Menenangkan kulit terbakar, melembabkan kulit.',
          usage: 'Digunakan sebagai gel untuk kulit atau diminum sebagai suplemen.',
          imageUrl: 'assets/aloe vera.jpeg',
          benefits: 'Meremajakan kulit, menyembuhkan luka ringan.',
          category: 'Sukulen',
        ),
        Plant(
          name: 'Peppermint',
          latinName: 'Mentha piperita',
          description: 'Menenangkan perut, meredakan mual.',
          usage: 'Diminum sebagai teh atau digunakan sebagai minyak esensial.',
          imageUrl: 'assets/pappermint.jpeg',
          benefits: 'Meredakan gangguan pencernaan, menyegarkan napas.',
          category: 'Herbal',
        ),
        Plant(
          name: 'Lavender',
          latinName: 'Lavandula angustifolia',
          description: 'Mengurangi stres, membantu tidur.',
          usage: 'Digunakan sebagai minyak esensial atau teh.',
          imageUrl: 'assets/lavender.jpeg',
          benefits: 'Menenangkan pikiran, memperbaiki kualitas tidur.',
          category: 'Aromaterapi',
        ),
        Plant(
          name: 'Chamomile',
          latinName: 'Matricaria chamomilla',
          description: 'Menenangkan, membantu tidur.',
          usage: 'Diminum sebagai teh atau digunakan dalam aromaterapi.',
          imageUrl: 'assets/chamomile.jpeg',
          benefits: 'Mengurangi kecemasan, memperbaiki pencernaan.',
          category: 'Aromaterapi',
        ),
        Plant(
          name: 'Ginseng',
          latinName: 'Panax ginseng',
          description: 'Meningkatkan stamina, mengurangi stres.',
          usage: 'Diminum sebagai teh atau digunakan dalam suplemen.',
          imageUrl: 'assets/ginseng.jpeg',
          benefits: 'Meningkatkan energi, mendukung fungsi otak.',
          category: 'Herbal',
        ),
        Plant(
          name: 'Moringa',
          latinName: 'Moringa oleifera',
          description: 'Menurunkan kolesterol, meningkatkan energi.',
          usage: 'Diminum sebagai teh atau digunakan dalam masakan.',
          imageUrl: 'assets/moringa.jpeg',
          benefits: 'Menurunkan tekanan darah, meningkatkan imun.',
          category: 'Superfood',
        ),
        Plant(
          name: 'Turmeric',
          latinName: 'Curcuma longa',
          description: 'Anti-inflamasi, meningkatkan kekebalan tubuh.',
          usage: 'Digunakan dalam masakan atau sebagai suplemen.',
          imageUrl: 'assets/turmeric.jpeg',
          benefits: 'Mengurangi inflamasi, meningkatkan kesehatan kulit.',
          category: 'Rempah',
        ),
        Plant(
          name: 'Lemon Balm',
          latinName: 'Melissa officinalis',
          description: 'Menenangkan pikiran, membantu tidur.',
          usage: 'Diminum sebagai teh atau digunakan sebagai minyak esensial.',
          imageUrl: 'assets/lemon balm.jpeg',
          benefits: 'Mengurangi kecemasan, menenangkan otot.',
          category: 'Aromaterapi',
        ),
        Plant(
          name: 'Basil',
          latinName: 'Ocimum basilicum',
          description: 'Meningkatkan sistem imun, meredakan stres.',
          usage: 'Diminum sebagai teh atau digunakan sebagai bumbu masakan.',
          imageUrl: 'assets/basil.jpeg',
          benefits: 'Meningkatkan daya tahan tubuh, kaya antioksidan.',
          category: 'Herbal',
        ),
      ];
    } else {
      return _plants;
    }
  }

  // Add a new plant
 Future<void> _addPlant(Plant newPlant) async {
  try {
    final response = await http.post(
      Uri.parse('http://127.0.0.1/tanaman_obat/addplant.php'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(newPlant.toJson()),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 200) {
        setState(() {
          _plants.add(newPlant);
        });
      } else {
        _showErrorDialog(data['message']);
      }
    } else {
      _showErrorDialog("Failed to connect. Status code: ${response.statusCode}");
    }
  } catch (e) {
    _showErrorDialog("Error occurred: $e");
  }
}


  //Delete a plant
 
 Future<void> _delPlants(String plantName) async {
  try {
    String jsonData = json.encode({
      'name': plantName,
    });
    print("Request JSON: $jsonData"); // Log JSON yang dikirimkan

    final response = await http.post(
      Uri.parse('http://127.0.0.1/tanaman_obat/delplants.php'),
      headers: {"Content-Type": "application/json"},
      body: jsonData,
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 200) {
        setState(() {
          _plants.removeWhere((plant) => plant.name == plantName);
        });
      } else {
        _showErrorDialog("Error: ${data['message']}");
      }
    } else {
      _showErrorDialog("Failed to connect to the server. Status code: ${response.statusCode}");
    }
  } catch (e) {
    _showErrorDialog("An error occurred: $e");
  }
}


  Future<void> _updatePlants(Plant updatedPlant) async {
  try {
    final response = await http.post(
      Uri.parse('http://127.0.0.1/tanaman_obat/updateplants.php'),
      headers: {
        "Content-Type": "application/json", // Tambahkan header yang sesuai
      },
      body: json.encode({
        'name': updatedPlant.name, // Nama juga dikirim
        'latin_name': updatedPlant.latinName,
        'description': updatedPlant.description,
        'usage': updatedPlant.usage,
        'image_url': updatedPlant.imageUrl,
        'benefits': updatedPlant.benefits,
        'category': updatedPlant.category,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 200) {
        setState(() {
          int index = _plants.indexWhere((plant) => plant.name== updatedPlant.name);
          if (index != -1) {
            _plants[index] = updatedPlant;
          }
        });
      } else {
        _showErrorDialog("Error: ${data['message']}");
      }
    } else {
      _showErrorDialog("Failed to connect to the server. Status code: ${response.statusCode}");
    }
  } catch (e) {
    _showErrorDialog("An error occurred: $e");
  }
}


  // Show error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  // Filter plants based on search query
  List<Plant> _filteredPlants() {
    return _getPlants().where((plant) {
      return plant.name.toLowerCase().contains(_searchQuery) ||
          plant.latinName.toLowerCase().contains(_searchQuery);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plant List"),
        backgroundColor: Colors.greenAccent,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator()) // Loading indicator
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value.toLowerCase();
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Search plants...",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(16.0),
                    children: _filteredPlants().map((plant) {
                      return Column(
                        children: [
                          PlantListTile(
                            plant: plant,
                            onDelete: () => _delPlants(plant.name),
                            onUpdate: () => _updatePlants(plant),
                          ),
                          Divider(),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
    );
  }
}

class Plant {
  final String name;
  final String latinName;
  final String description;
  final String usage;
  final String imageUrl;
  final String benefits;
  final String category;

  Plant({
    required this.name,
    required this.latinName,
    required this.description,
    required this.usage,
    required this.imageUrl,
    required this.benefits,
    required this.category,
  });

  // Metode untuk membuat objek Plant dari JSON
  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      name: json['name'] as String,
      latinName: json['latin_name'] as String,
      description: json['description'] as String,
      usage: json['usage'] as String,
      imageUrl: json['image_url'] as String,
      benefits: json['benefits'] as String,
      category: json['category'] as String,
    );
  }

  // Metode untuk mengubah objek Plant menjadi JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'latin_name': latinName,
      'description': description,
      'usage': usage,
      'image_url': imageUrl,
      'benefits': benefits,
      'category': category,
    };
  }
}


class PlantListTile extends StatelessWidget {
  final Plant plant;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;

  PlantListTile({required this.plant, required this.onDelete, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(plant.imageUrl),
      title: Text(plant.name),
      subtitle: Text(plant.latinName),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: onUpdate,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}





