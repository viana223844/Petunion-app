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
      home: PetunionHome(),
    );
  }
}

class PetunionHome extends StatefulWidget {
  @override
  _PetunionHomeState createState() => _PetunionHomeState();
}

class _PetunionHomeState extends State<PetunionHome> {
  // MÉTODO DOS BOTÕES ORBITAIS DEFINIDO CORRETAMENTE DENTRO DO STATE
  Widget _orbitalBtn(double angle, IconData icon, String label) {
    double radius = 110.0;
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
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
            ),
            child: Icon(icon, color: Color(0xFFFF914D), size: 24),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      body: Stack(
        alignment: Alignment.center,
        children: [
          // 1. OUTDOOR CURVO (HEADER) -
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: size.height * 0.45,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF914D), Color(0xFFF37021)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: SafeArea(
                child: Center(
                  child: Text(
                    "PETUNION",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 4,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // 2. CARD CENTRAL (CONTEÚDO) -
          Positioned(
            top: size.height * 0.25,
            left: 25,
            right: 25,
            height: size.height * 0.35,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFF8F9FB),
                        borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
                      ),
                      child: Icon(Icons.pets, size: 80, color: Color(0xFFFF914D)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          "Thor - Bulldog Francês",
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Genética de Elite • Brasília/DF",
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 3. MENU ORBITAL FLUTUANTE (AMI NO CENTRO)
          Positioned(
            bottom: size.height * 0.05,
            child: Container(
              width: size.width,
              height: 250,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // 6 BOTÕES SATÉLITES REPOSICIONADOS
                  _orbitalBtn(180, Icons.store, "Market"),
                  _orbitalBtn(220, Icons.favorite, "Match"),
                  _orbitalBtn(260, Icons.chat, "Chat"),
                  _orbitalBtn(300, Icons.assignment, "Ads"),
                  _orbitalBtn(340, Icons.settings, "Ajustes"),
                  _orbitalBtn(20, Icons.person, "Perfil"),

                  // AMI CENTRALIZADA (CÍRCULO MAIOR)
                  GestureDetector(
                    onTap: () => print("AMI Ativada"),
                    child: Container(
                      width: 95,
                      height: 95,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF914D),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFF914D).withOpacity(0.4),
                            blurRadius: 20,
                            offset: Offset(0, 8),
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "AMI",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 24),
                        ),
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
