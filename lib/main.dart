import 'package:flutter/material.dart';

// ENGINEER PROMPT: Ultra-Stable High-Fidelity Build
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PetunionSafeHome(),
  ));
}

class PetunionSafeHome extends StatelessWidget {
  const PetunionSafeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Stack(
        children: [
          // HEADER FIXO PARA EVITAR ERROS DE GETTER 'SIZE'
          Container(
            height: 380,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF914D), Color(0xFFFF6B00)],
              ),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
            ),
          ),
          
          SafeArea(
            child: Column(
              children: [
                // TOP BAR (LOGO PETUNION)
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      CircleAvatar(backgroundColor: Colors.white, radius: 15, child: Icon(Icons.pets, size: 15, color: Color(0xFFFF6B00))),
                      SizedBox(width: 10),
                      Text("PETUNION", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900, letterSpacing: 2)),
                    ],
                  ),
                ),

                // CARD PRINCIPAL (FIDELIDADE 1002880357)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      const Text("Sociais & Accounts", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange)),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Text("Selecione seus contatos para compartilhar.", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ),
                      
                      // CURVA CONVEXA ESTÁTICA
                      ClipPath(
                        clipper: SimpleScoop(),
                        child: Container(height: 100, color: Colors.orange.withOpacity(0.8)),
                      ),
                      
                      const Text("6 / 8", style: TextStyle(fontSize: 50, fontWeight: FontWeight.w100, color: Color(0xFFE0E0E0))),
                    ],
                  ),
                ),
                
                const Spacer(),
                
                // AMI IA BUTTON
                _amiButton(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _amiButton() => Column(
    children: [
      Container(
        width: 100, height: 100,
        decoration: const BoxDecoration(shape: BoxShape.circle, gradient: RadialGradient(colors: [Color(0xFFFF914D), Color(0xFFFF6B00)])),
        child: const Center(child: Text("AMI", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24))),
      ),
      const Text("IA ASSISTANT", style: TextStyle(color: Colors.orange, fontSize: 10, fontWeight: FontWeight.bold)),
    ],
  );
}

class SimpleScoop extends CustomClipper<Path> {
  @override
  Path getPath(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, 0);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
