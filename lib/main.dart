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
  int _viewIndex = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: Stack(
        alignment: Alignment.center,
        children: [
          // 1. OUTDOOR CURVO (Header do Template)
          Positioned(
            top: 0, left: 0, right: 0,
            height: size.height * 0.42,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF914D), Color(0xFFF37021)],
                  begin: Alignment.topLeft, end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: const SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text("PETUNION", 
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: 4)
                  ),
                ),
              ),
            ),
          ),

          // 2. CARD CENTRAL (Conteúdo Flutuante)
          Positioned(
            top: size.height * 0.22,
            left: 25, right: 25,
            height: size.height * 0.38,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 25, offset: const Offset(0, 10))],
              ),
              child: _buildContent(),
            ),
          ),

          // 3. MENU ORBITAL FLUTUANTE (AMI + 6 BOTÕES)
          Positioned(
            bottom: size.height * 0.02,
            child: SizedBox(
              width: size.width,
              height: 280,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  _orbitalBtn(angle: 180, icon: Icons.store, label: "Market"),
                  _orbitalBtn(angle: 220, icon: Icons.favorite, label: "Match"),
                  _orbitalBtn(angle: 260, icon: Icons.chat_bubble, label: "Chat"),
                  _orbitalBtn(angle: 300, icon: Icons.assignment, label: "Anúncios"),
                  _orbitalBtn(angle: 340, icon: Icons.settings, label: "Ajustes"),
                  _orbitalBtn(angle: 20, icon: Icons.person, label: "Perfil"),

                  // AMI CENTRAL (Círculo Maior e Flutuante)
                  GestureDetector(
                    onTap: () => print("AMI Ativada"),
                    child: Container(
                      width: 100, height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF914D),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFF914D).withOpacity(0.4),
                            blurRadius: 25, spreadRadius: 2, offset: const Offset(0, 8)
                          )
                        ],
                      ),
                      child: const Center(
                        child: Text("AMI", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 26))
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

  Widget _buildContent() {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[100], 
              borderRadius: const BorderRadius.vertical(top: Radius.circular(35))
            ),
            child: const Icon(Icons.pets, size: 80, color: Color(0xFFFF914D)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text("Thor - Bulldog Francês", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text("Genética de Elite • Vacinas OK", style: TextStyle(color: Colors.grey, fontSize: 13)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _orbitalBtn({required double angle, required IconData icon, required String label}) {
    double radius = 115.0; 
    double x = radius * math.cos(angle * math.pi / 180);
    double y = radius * math.sin(angle * math.pi / 180);

    return Transform.translate(
      offset: Offset(x, y),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10, offset: const Offset(0, 4))],
            ),
            child: Icon(icon, color: const Color(0xFFFF914D), size: 24),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.black87)),
        ],
      ),
    );
  }
}
