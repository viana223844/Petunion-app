import 'package:flutter/material.dart';

void main() {
  runApp(const PetunionApp());
}

class PetunionApp extends StatelessWidget {
  const PetunionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Petunion Brasília',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, String>> _pets = [
    {'name': 'Rex', 'breed': 'Golden Retriever', 'location': 'Asa Sul, DF', 'image': 'https://images.unsplash.com/photo-1552053831-71594a27632d?w=500'},
    {'name': 'Luna', 'breed': 'Persian Cat', 'location': 'Sudoeste, DF', 'image': 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=500'},
    {'name': 'Thor', 'breed': 'Beagle', 'location': 'Águas Claras, DF', 'image': 'https://images.unsplash.com/photo-1537151608828-ea2b11777ee8?w=500'},
    {'name': 'Mel', 'breed': 'Poodle', 'location': 'Lago Norte, DF', 'image': 'https://images.unsplash.com/photo-1516734212186-a967f81ad0d7?w=500'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120.0,
            floating: true,
            pinned: true,
            backgroundColor: const Color(0xFFFF914D),
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Petunion Brasília', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                hintText: 'Search pets near you...',
                leading: const Icon(Icons.search, color: Colors.grey),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final pet = _pets[index];
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                              image: DecorationImage(image: NetworkImage(pet['image']!), fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(pet['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text(pet['breed']!, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: _pets.length,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFFF914D),
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Pets'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

