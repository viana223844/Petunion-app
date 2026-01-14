import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(const PetunionApp());

class PetunionApp extends StatelessWidget {
  const PetunionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const PetunionHome(),
    );
  }
}

class PetunionHome extends StatefulWidget {
  const PetunionHome({super.key});

  @override
  State<PetunionHome> createState() => _PetunionHomeState();
}

class _PetunionHomeState extends State<PetunionHome> {
  int _viewIndex = 1; // Foco no Match

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      body: Stack(
        alignment: Alignment.center,
        children: [
          // 1. OUTDOOR (HEADER CURVO)
          Positioned(
            top: 0, left: 0, right: 0,
            height: size.height * 0.45,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF914D), Color(0xFFE67E22)],
                  begin: Alignment.topLeft, end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: const SafeArea(
                child: Center(
                  child: Text("PETUNION", 
                    style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: 3)),
                ),
              ),
            ),
          ),

          // 2. CARD DE CONTEÚDO (CONSTRUIDO PARA O MATCH)
          Positioned(
            top: size.height * 0.28,
            left: 20, right: 20,
            height: size.height * 0.35,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)],
              ),
              child: _buildMatchContent(),
            ),
          ),

          // 3. MENU ORBITAL FLUTUANTE (DESIGN DO TEMPLATE)
          Positioned(
            bottom: size.height * 0.05,
            child: Container(
              width: size.width,
              height: 280,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // OS 6 BOTÕES SATÉLITES (DISTRIBUÍDOS ORBITALMENTE)
                  _buildOrbitalBtn(angle: 180, icon: Icons.store, label: "Market"),
                  _buildOrbitalBtn(angle: 220, icon: Icons.favorite, label: "Match"),
                  _buildOrbitalBtn(angle: 260, icon: Icons.chat_bubble, label: "Chat"),
                  _buildOrbitalBtn(angle: 300, icon: Icons.assignment, label: "Anúncios"),
                  _buildOrbitalBtn(angle: 340, icon: Icons.settings, label: "Ajustes"),
                  _buildOrbitalBtn(angle: 20, icon: Icons.person, label: "Perfil"),

                  // A AMI CENTRAL (MAIOR E EM DESTAQUE)
                  GestureDetector(
                    onTap: () => print("AMI: Como posso ajudar?"),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF914D),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFF914D).withOpacity(0.4),
                            blurRadius: 25,
                            spreadRadius: 5,
                            offset: const Offset(0, 10),
                          )
                        ],
                      ),
                      child: const Center(
                        child: Text("AMI", 
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 24)),
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

  Widget _buildOrbitalBtn({required double angle, required IconData icon, required String label}) {
    // Raio da órbita para os botões flutuantes
    double radius = 115.0; 
    double x = radius * math.cos(angle * math.pi / 180);
    double y = radius * math.sin(angle * math.pi / 180);

    return Transform.translate(
      offset: Offset(x, y),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 12, offset: const Offset(0, 4))
              ],
            ),
            child: Icon(icon, color: const Color(0xFFFF914D), size: 26),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black87)),
        ],
      ),
    );
  }

  Widget _buildMatchContent() {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: const Icon(Icons.pets, size: 80, color: Color(0xFFFF914D)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Text("Thor - Bulldog Francês", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text("Genética de Elite • Vacinas em dia", style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }
}
