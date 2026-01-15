import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PetunionFinalHome(),
  ));
}

class PetunionFinalHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: Stack(
        children: [
          // FUNDO LARANJA (FIDELIDADE 1002880357)
          Container(
            height: 380,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFF914D), Color(0xFFFF6B00)],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // TOP BAR (LOGO + NOTIFICAÇÃO)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                  child: Row(
                    children: [
                      _headerCircle(Icons.pets),
                      SizedBox(width: 12),
                      Text("PETUNION", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900, letterSpacing: 2)),
                      Spacer(),
                      Icon(Icons.add, color: Colors.white, size: 28),
                      SizedBox(width: 15),
                      _badge("4"),
                    ],
                  ),
                ),

                // CARD BRANCO (THE PIXEL PERFECT CARD)
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(45),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 25)],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Text("Sociais & Accounts", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Color(0xFFE65100))),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: Text("Selecione quais Sociais e Contatos serão compartilhados.", 
                          textAlign: TextAlign.center, style: TextStyle(color: Colors.black45, fontSize: 13)),
                      ),
                      
                      // SCOOP CLIPPER (CORREÇÃO DO ERRO DO VÍDEO 1002880707)
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipPath(
                            clipper: ScoopClipper(),
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [Color(0xFFFF914D), Color(0xFFFF6B00)]),
                              ),
                            ),
                          ),
                          _avatar(),
                        ],
                      ),

                      Text("6 / 8", style: TextStyle(fontSize: 55, fontWeight: FontWeight.w100, color: Color(0xFFDCDCDC))),
                      SizedBox(height: 30),
                    ],
                  ),
                ),

                Spacer(),

                // AMI IA E NAVBAR
                _amiIA(),

                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 25),
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 15)],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _navIcon(Icons.storefront_outlined, "Market"),
                      _navIcon(Icons.favorite_border, "Match"),
                      SizedBox(width: 70), // Espaço para a AMI
                      _navIcon(Icons.assignment_outlined, "Ads"),
                      _navIcon(Icons.person_outline, "Perfil"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // WIDGETS DE SUPORTE (SEM CONST PARA EVITAR O ERRO 1002880720)
  Widget _headerCircle(IconData i) => Container(padding: EdgeInsets.all(7), decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: Icon(i, color: Color(0xFFFF6B00), size: 18));
  
  Widget _badge(String txt) => Stack(children: [Icon(Icons.chat_bubble_outline, color: Colors.white, size: 28), Positioned(right: 0, top: 0, child: CircleAvatar(radius: 8, backgroundColor: Color(0xFFD84315), child: Text(txt, style: TextStyle(fontSize: 8, color: Colors.white, fontWeight: FontWeight.bold))))]);

  Widget _avatar() => Container(
    width: 90, height: 90,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: Colors.white, width: 4),
      image: DecorationImage(image: NetworkImage('https://i.pravatar.cc/150?u=pet'), fit: BoxFit.cover),
    ),
  );

  Widget _amiIA() => Column(
    children: [
      Container(
        width: 105, height: 105,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(colors: [Color(0xFFFFB347), Color(0xFFFF8C00)]),
          boxShadow: [BoxShadow(color: Color(0xFFFF6B00).withOpacity(0.4), blurRadius: 20)],
        ),
        child: Center(child: Text("AMI", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900))),
      ),
      SizedBox(height: 5),
      Text("IA ASSISTANT", style: TextStyle(color: Color(0xFFFF8C00), fontSize: 10, fontWeight: FontWeight.w900)),
    ],
  );

  Widget _navIcon(IconData i, String l) => Column(mainAxisSize: MainAxisSize.min, children: [Icon(i, color: Colors.grey[300], size: 28), Text(l, style: TextStyle(color: Colors.grey[400], fontSize: 10))]);
}

// CLIPPER COM IMPLEMENTAÇÃO COMPLETA (CORREÇÃO 1002880707)
class ScoopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.5, size.height * 1.3, size.width, size.height * 0.7);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
