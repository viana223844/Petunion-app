import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: PetunionFinal(),
));

class PetunionFinal extends StatelessWidget {
  const PetunionFinal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: Stack(
        children: [
          // FUNDO GRADIENTE SUPERIOR (REF: 1002880357)
          Container(
            height: 380,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF914D), Color(0xFFFF6B00)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                _buildTopBar(),
                // CARD BRANCO CENTRALIZADO
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(45),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      const Text("Sociais & Accounts", 
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Color(0xFFE65100))),
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text("Selecione seus contatos para compartilhar.", 
                          textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 13)),
                      ),
                      // ÁREA DO AVATAR COM A CURVA CONVEXA (RESOLVENDO ERRO DO CLIPPER)
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipPath(
                            clipper: ScoopClipper(),
                            child: Container(height: 110, color: const Color(0xFFFF8C00)),
                          ),
                          _buildAvatar(),
                        ],
                      ),
                      const Text("6 / 8", style: TextStyle(fontSize: 55, fontWeight: FontWeight.w100, color: Color(0xFFDCDCDC))),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
                const Spacer(),
                _buildAmiIA(),
                _buildBottomNav(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // WIDGETS AUXILIARES COM SINTAXE LIMPA
  Widget _buildTopBar() => const Padding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Row(
      children: [
        CircleAvatar(backgroundColor: Colors.white, radius: 15, child: Icon(Icons.pets, size: 18, color: Colors.orange)),
        SizedBox(width: 10),
        Text("PETUNION", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900, letterSpacing: 2)),
        Spacer(),
        Icon(Icons.add, color: Colors.white),
      ],
    ),
  );

  Widget _buildAvatar() => Container(
    width: 90, height: 90,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: Colors.white, width: 4),
      image: const DecorationImage(image: NetworkImage('https://i.pravatar.cc/150?u=a'), fit: BoxFit.cover),
    ),
  );

  Widget _buildAmiIA() => Column(
    children: [
      Container(
        width: 100, height: 100,
        decoration: const BoxDecoration(shape: BoxShape.circle, gradient: RadialGradient(colors: [Color(0xFFFFB347), Color(0xFFFF8C00)])),
        child: const Center(child: Text("AMI", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold))),
      ),
      const Text("IA ASSISTANT", style: TextStyle(color: Colors.orange, fontSize: 10, fontWeight: FontWeight.bold)),
      const SizedBox(height: 10),
    ],
  );

  Widget _buildBottomNav() => Container(
    margin: const EdgeInsets.fromLTRB(15, 0, 15, 20),
    padding: const EdgeInsets.symmetric(vertical: 15),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(40)),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.storefront, color: Colors.black12),
        Icon(Icons.favorite_border, color: Colors.black12),
        SizedBox(width: 40),
        Icon(Icons.assignment, color: Colors.black12),
        Icon(Icons.person_outline, color: Colors.black12),
      ],
    ),
  );
}

// IMPLEMENTAÇÃO CORRETA E COMPLETA DO CLIPPER (RESOLVE O ERRO DO VÍDEO)
class ScoopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.5);
    path.quadraticBezierTo(size.width / 2, size.height * 1.2, size.width, size.height * 0.5);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
