import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(PetunionApp());
}

class PetunionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: PetunionHome(),
    );
  }
}

class PetunionHome extends StatefulWidget {
  @override
  _PetunionHomeState createState() => _PetunionHomeState();
}

class _PetunionHomeState extends State<PetunionHome> {
  
  // FUNÇÃO ORBITAL CORRIGIDA E DENTRO DO ESCOPO
  Widget _orbitalBtn(double angle, IconData icon, String label) {
    double radius = 125.0; // Raio ajustado para não encostar no card
    double x = radius * math.cos(angle * math.pi / 180);
    double y = radius * math.sin(angle * math.pi / 180);

    return Transform.translate(
      offset: Offset(x, y),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))],
            ),
            child: Icon(icon, color: Color(0xFFFF914D), size: 24),
          ),
          SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Colors.black87)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFF2F5F9),
      body: Stack(
        alignment: Alignment.center,
        children: [
          // 1. OUTDOOR CURVO (ESTILO TEMPLATE)
          Positioned(
            top: 0, left: 0, right: 0,
            height: size.height * 0.42,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF914D), Color(0xFFE67E22)],
                  begin: Alignment.topCenter, end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70),
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text("PETUNION", 
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900, letterSpacing: 5)),
                ),
              ),
            ),
          ),

          // 2. CARD CENTRAL (CONTEÚDO)
          Positioned(
            top: size.height * 0.24,
            left: 30, right: 30,
            height: size.height * 0.36,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 25, offset: Offset(0, 10))],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFF9FAFB),
                        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                      ),
                      child: Icon(Icons.pets, size: 70, color: Color(0xFFFF914D).withOpacity(0.6)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text("Thor - Bulldog Francês", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text("GENÉTICA DE ELITE • BRASÍLIA", style: TextStyle(color: Colors.orange, fontSize: 11, fontWeight: FontWeight.w900)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 3. MENU ORBITAL FLUTUANTE (AMI NO CENTRO)
          Positioned(
            bottom: size.height * 0.06,
            child: Container(
              width: size.width,
              height: 280,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  _orbitalBtn(-160, Icons.store, "Market"),
                  _orbitalBtn(-120, Icons.favorite, "Match"),
                  _orbitalBtn(-80, Icons.chat, "Chat"),
                  _orbitalBtn(-40, Icons.assignment, "Ads"),
                  _orbitalBtn(0, Icons.settings, "Ajustes"),
                  _orbitalBtn(40, Icons.person, "Perfil"),

                  // AMI CENTRAL
                  GestureDetector(
                    onTap: () => print("AMI Ativada"),
                    child: Container(
                      width: 95, height: 95,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF914D),
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: Color(0xFFFF914D).withOpacity(0.4), blurRadius: 20, offset: Offset(0, 8))],
                      ),
                      child: Center(
                        child: Text("AMI", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 24)),
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
}
