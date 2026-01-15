import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PetunionHome(),
  ));
}

class PetunionHome extends StatelessWidget {
  const PetunionHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(
        children: [
          // 1. FUNDO GRADIENTE SUPERIOR
          Container(
            height: 350,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFF914D), Color(0xFFFF6B00)],
              ),
            ),
          ),

          // 2. CONTEÚDO DA INTERFACE
          SafeArea(
            child: Column(
              children: [
                // HEADER: LOGO + ADD + CHAT (REF: 1002880357)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    children: [
                      _buildHeaderCircle(Icons.pets),
                      const SizedBox(width: 12),
                      const Text("PETUNION", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: 2)),
                      const Spacer(),
                      const Icon(Icons.add, color: Colors.white, size: 30),
                      const SizedBox(width: 15),
                      _buildNotificationBadge("4"),
                    ],
                  ),
                ),

                // 3. O CARD "SOCIALS & ACCOUNTS" COM CURVATURA CONVEXA
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 30, offset: const Offset(0, 15))],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      const Text("Sociais & Accounts", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFFFF7A00))),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: Text("Selecione quais Sociais e Contatos serão compartilhados com seu novo amigo.", 
                          textAlign: TextAlign.center, style: TextStyle(color: Colors.black38, fontSize: 13, height: 1.4)),
                      ),
                      
                      // ÁREA DO AVATAR COM O "SCOOP" LARANJA (REF: 1002880357)
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            size: const Size(double.infinity, 130),
                            painter: CurvePainter(),
                          ),
                          Container(
                            width: 95, height: 95,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 4),
                              image: const DecorationImage(
                                image: NetworkImage('https://i.pravatar.cc/150?u=thor'), 
                                fit: BoxFit.cover
                              ),
                            ),
                          ),
                        ],
                      ),

                      // CONTADOR 6/8 ELEGANT (REF: 1002880357)
                      const Text("6 / 8", style: TextStyle(fontSize: 58, fontWeight: FontWeight.w100, color: Color(0xFFE0E0E0))),
                      const SizedBox(height: 5),
                      Container(width: 60, height: 2, color: const Color(0xFFF2F2F2)),
                      const SizedBox(height: 35),
                    ],
                  ),
                ),

                const Spacer(),

                // 4. AMI E BARRA DE NAVEGAÇÃO "PILL"
                _buildFloatingAmi(),
                
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 5, 15, 25),
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 20)],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildNavItem(Icons.storefront_outlined, "Market"),
                      _buildNavItem(Icons.favorite_border, "Match"),
                      const SizedBox(width: 60), // GAP PARA A AMI
                      _buildNavItem(Icons.assignment_outlined, "Ads"),
                      _buildNavItem(Icons.person_outline, "Perfil"),
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

  // WIDGETS AUXILIARES PARA FIDELIDADE VISUAL
  Widget _buildHeaderCircle(IconData icon) => Container(padding: const EdgeInsets.all(6), decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: Icon(icon, color: const Color(0xFFFF6B00), size: 18));

  Widget _buildNotificationBadge(String count) => Stack(children: [const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 28), Positioned(right: 0, top: 0, child: CircleAvatar(radius: 8, backgroundColor: const Color(0xFFD84315), child: Text(count, style: const TextStyle(fontSize: 9, color: Colors.white, fontWeight: FontWeight.bold))))]);

  Widget _buildFloatingAmi() => Column(children: [
    Container(
      width: 105, height: 105,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const RadialGradient(colors: [Color(0xFFFF914D), Color(0xFFF37021)]),
        boxShadow: [BoxShadow(color: const Color(0xFFFF6B00).withOpacity(0.4), blurRadius: 25, offset: const Offset(0, 10))],
      ),
      child: const Center(child: Text("AMI", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900))),
    ),
    const SizedBox(height: 5),
    const Text("IA ASSISTANT", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: Color(0xFFFF6B00))),
  ]);

  Widget _buildNavItem(IconData icon, String label) => Column(mainAxisSize: MainAxisSize.min, children: [Icon(icon, color: Colors.grey[300], size: 28), Text(label, style: TextStyle(color: Colors.grey[400], fontSize: 10, fontWeight: FontWeight.w700))]);
}

// PAINTER PARA CRIAR A CURVA CONVEXA DO CARD (REF: 1002880357)
class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..shader = const LinearGradient(colors: [Color(0xFFFF914D), Color(0xFFFF6B00)]).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width / 2, size.height * 1.2, size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
