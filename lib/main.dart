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
          // 1. OUTDOOR (HEADER CURVO DO TEMPLATE)
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
                  padding: EdgeInsets.top(30),
                  child: Text("PETUNION", 
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: 4)
                  ),
                ),
              ),
            ),
          ),

          // 2. CARD CENTRAL (CONTEÚDO DO MATCH)
          Positioned(
            top: size.height * 0.22,
            left: 25, right: 25,
            height: size.height * 0.40,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 25, offset: const Offset(0, 10))],
              ),
              child: _buildContent(),
            ),
          ),

          // 3. MENU ORBITAL FLUTUANTE (BOTÕES REDONDOS AO REDOR DA AMI)
          Positioned(
            bottom: size.height * 0.04,
            child: SizedBox(
              width: size.width,
              height: 280,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // 6 BOTÕES SATÉLITES
                  _orbitalBtn(angle: 180, icon: Icons.store, label: "Market"),
                  _orbitalBtn(angle: 220, icon: Icons.favorite, label: "Match"),
                  _orbitalBtn(angle: 260, icon: Icons.chat_bubble, label: "Chat"),
                  _orbitalBtn(angle: 300, icon: Icons.assignment, label: "Anúncios"),
                  _orbitalBtn(angle: 340, icon: Icons.settings, label: "Ajustes"),
                  _orbitalBtn(angle: 20, icon: Icons.person, label: "Perfil"),

                  // AMI CENTRAL (CÍRCULO MAIOR)
                  GestureDetector(
                    onTap: () => print("AMI Ativada"),
                    child: Container(
                      width: 105, height: 105,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF914D),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const
                            
