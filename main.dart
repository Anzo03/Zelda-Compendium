import 'dart:convert' as convert;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Zelda Compendium',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const MyHomePage(title: 'Zelda Compendium')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl:
                    "https://freepngimg.com/save/webp/115434-triforce-of-the-legend-zelda",
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              'Chargement du copendium...',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Home Screen with navigation buttons
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic> dataMap = {};
  bool recupDataBool = false;
  bool isLoading = false;
  String currentCategory = 'monsters'; // Default category is 'monsters'

  // Fetch data by category
  Future<void> fetchData(String category) async {
    setState(() {
      isLoading = true;
    });

    String url =
        "https://botw-compendium.herokuapp.com/api/v3/compendium/category/$category";

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = convert.jsonDecode(response.body);
        if (data['data'] == null || data['data'].isEmpty) {
          setState(() {
            recupDataBool = false;
            isLoading = false;
          });
        } else {
          setState(() {
            dataMap = data;
            recupDataBool = true;
            isLoading = false;
          });
        }
      } else {
        setState(() {
          recupDataBool = false;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        recupDataBool = false;
        isLoading = false;
      });
    }
  }

  // Switch categories
  void switchCategory(String category) {
    setState(() {
      currentCategory = category;
      recupDataBool = false;
    });
    fetchData(category);
  }

  // Display data based on category
  Widget displayData() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!recupDataBool) {
      return const Center(child: Text('Aucune donnée disponible.'));
    }

    return ListView.builder(
      itemCount: dataMap['data'].length,
      itemBuilder: (context, index) {
        var item = dataMap['data'][index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: item['image'].toString(),
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name'].toString(),
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          item['description'].toString(),
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black54,
                          ),
                          maxLines: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData(currentCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: displayData(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentCategory == 'monsters'
            ? 0
            : currentCategory == 'creatures'
                ? 1
                : currentCategory == 'equipment'
                    ? 2
                    : currentCategory == 'materials'
                        ? 3
                        : 0,
        onTap: (index) {
          switch (index) {
            case 0:
              switchCategory('monsters');
              break;
            case 1:
              switchCategory('creatures');
              break;
            case 2:
              switchCategory('equipment');
              break;
            case 3:
              switchCategory('materials');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Monstres',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Animaux',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Equipment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.square),
            label: 'Materiaux',
          ),
        ],
        selectedItemColor: Colors.blue, // Couleur des éléments sélectionnés
        unselectedItemColor:
            Colors.grey, // Couleur des éléments non sélectionnés
        backgroundColor: Colors.white,
      ),
    );
  }
}
