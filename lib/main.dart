import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const PetunionApp());
}

class PetunionApp extends StatelessWidget {
  const PetunionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Petunion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFFFF914D),
        fontFamily: 'Roboto',
      ),
      home: const PetunionScaffold(),
    );
  }
}

class PetunionScaffold extends StatefulWidget {
  const PetunionScaffold({super.key});

  @override
  State<PetunionScaffold> createState() => _PetunionScaffoldState();
}

class _PetunionScaffoldState extends State<PetunionScaffold> {
  int _viewIndex = 0; // 0: Home/Outdoor, 1: Pet Match

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: Stack(
        children: [
          // 1. O OUTDOOR DINÂMICO (TOPO)
          _buildOutdoor(),

          // 2. ÁREA DE CONTEÚDO (MARKPLACE OU MATCH)
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: _viewIndex == 0 ? _buildMarketplacePlaceholder() : _buildPetMatchView(),
          ),

          // 3. MENU ORBITAL E AMI (BASE)
          _buildOrbitalNavigation(),
        ],
      ),
    );
  }

  Widget _buildOutdoor() {
    return Positioned(
      top: 0, left: 0, right: 0,
      height: MediaQuery.of(context).size.height * 0.45,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFF914D), Color(0xFFE67E22)],
            begin: Alignment.topCenter, end: Alignment.bottomCenter,
          ),
        ),
        child: PageView(
          children: const [
            Center(child: Text("PETUNION\nPROMOÇÕES NACIONAIS", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900))),
            Center(child: Text("MATCH GENÉTICO\nENCONTRE A ELITE", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900))),
          ],
        ),
      ),
    );
  }

  Widget _buildMarketplacePlaceholder() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.4,
      left: 0, right: 0, bottom: 0,
      child: Container(
        decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        child: const Center(child: Text("Diga 'AMI, buscar ração'...", style: TextStyle(color: Colors.grey, fontSize: 16))),
      ),
    );
  }

  // 🧬 SISTEMA PET MATCH (TINDER)
  Widget _buildPetMatchView() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.1,
      left: 0, right: 0, bottom: 0,
      child: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: Column(
          children: [
            Expanded(child: Container(color: Colors.grey[300], child: const Icon(Icons.pets, size: 100, color: Colors.white))),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Thor - Bulldog Francês", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Divider(),
                  Text("🧬 FICHA TÉCNICA GENÉTICA", style: TextStyle(color: Color(0xFFFF914D), fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("• Idade: 2 anos\n• Vacinas: Em dia\n• Pedigree: Sim\n• Local: Brasília e Entorno"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(icon: const Icon(Icons.close, color: Colors.red, size: 40), onPressed: () {}),
                IconButton(icon: const Icon(Icons.favorite, color: Colors.green, size: 40), onPressed: () {}),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildOrbitalNavigation() {
    return Positioned(
      bottom: 40, left: 0, right: 0,
      child: SizedBox(
        height: 220,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _orbitalBtn(angle: -150, icon: Icons.store, label: "Market", onTap: () => setState(() => _viewIndex = 0)),
            _orbitalBtn(angle: -110, icon: Icons.pets, label: "Match", onTap: () => setState(() => _viewIndex = 1)),
            _orbitalBtn(angle: -70, icon: Icons.message, label: "Chat", onTap: () {}),
            _orbitalBtn(angle: -30, icon: Icons.person, label: "Perfil", onTap: () {}),
            
            // AMI CENTRAL
            GestureDetector(
              onTap: () => print("AMI Ativada: Escutando pesquisa..."),
              child: Container(
                width: 90, height: 90,
                decoration: const BoxDecoration(color: Color(0xFFFF914D), shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 15)]),
                child: const Center(child: Text("AMI", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 20))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _orbitalBtn({required double angle, required IconData icon, required String label, required VoidCallback onTap}) {
    double radius = 95.0;
    double x = radius * math.cos(angle * math.pi / 180);
    double y = radius * math.sin(angle * math.pi / 180);
    return Transform.translate(
      offset: Offset(x, y),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(padding: const EdgeInsets.all(12), decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]), child: Icon(icon, color: const Color(0xFFFF914D), size: 24)),
            Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
