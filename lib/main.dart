import 'package:flutter/material.dart';

void main() => runApp(const PetunionApp());

class PetunionApp extends StatelessWidget {
  const PetunionApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PetunionHome(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class PetunionHome extends StatelessWidget {
  const PetunionHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Projeção de Erro 1: Garantir que as dimensões sejam lidas corretamente
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: Stack(
        children: [
          // FUNDO GRADIENTE SUPERIOR (FIDELIDADE 1002880357)
          Container(
            height: size.height * 0.45,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFF914D), Color(0xFFFF6B00)],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(55),
                bottomRight: Radius.circular(55),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView( // Projeção de Erro 3: Previne Overflow em telas menores
              physics: const NeverScrollableScrollPhysics(),
              child: SizedBox(
                height: size.height - MediaQuery.of(context).padding.top,
                child: Column(
                  children: [
                    // HEADER MINIMALISTA
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: Row(
                        children: [
                          _buildHeaderBtn(Icons.pets),
                          const SizedBox(width: 12),
                          const Text("PETUNION", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900, letterSpacing: 2)),
                          const Spacer(),
                          const Icon(Icons.add, color: Colors.white, size: 30),
                          const SizedBox(width: 15),
                          _buildChatBadge("4"),
                        ],
                      ),
                    ),

                    // O CARD BRANCO (THE MASTERPIECE)
                    Container(
                      width: size.width * 0.92,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(45),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 40, offset: const Offset(0, 20))],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          const Text("Sociais & Accounts", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFFFF7A00))),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                            child: Text("Selecione quais Sociais e Contatos serão compartilhados com seu novo amigo.", 
                              textAlign: TextAlign.center, style: TextStyle(color: Colors.black38, fontSize: 13, height: 1.4, fontWeight: FontWeight.w500)),
                          ),
                          
                          // SCOOP CURVE COM AVATAR
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CustomPaint(
                                size: const Size(double.infinity, 120),
                                painter: ScoopPainter(),
                              ),
                              Container(
                                width: 95, height: 95,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 4),
                                  boxShadow: [BoxShadow(color: Colors.orange.withOpacity(0.2), blurRadius: 15)],
                                ),
                                child: const ClipOval(child: Icon(Icons.person, size: 50, color: Colors.grey)), // Projeção Erro 2: Fallback se a imagem falhar
                              ),
                            ],
                          ),

                          const Text("6 / 8", style: TextStyle(fontSize: 58, fontWeight: FontWeight.w100, color: Color(0xFFDCDCDC), letterSpacing: -2)),
                          const SizedBox(height: 5),
                          Container(width: 50, height: 2, color: const Color(0xFFF2F2F2)),
                          const SizedBox(height: 35),
                        ],
                      ),
                    ),

                    const Spacer(),

                    // AMI IA (O CORAÇÃO DO APP)
                    _buildAmiCentral(),

                    // BARRA DE NAVEGAÇÃO PILL (FIDELIDADE TOTAL)
                    Container(
                      margin: const EdgeInsets.fromLTRB(18, 0, 18, 25),
                      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20)],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _navItem(Icons.storefront_outlined, "Market"),
                          _navItem(Icons.favorite_border, "Match"),
                          const SizedBox(width: 50),
                          _navItem(Icons.assignment_outlined, "Ads"),
                          _navItem(Icons.person_outline, "Perfil"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // WIDGETS DE SUPORTE
  Widget _buildHeaderBtn(IconData icon) => Container(padding: const EdgeInsets.all(7), decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: Icon(icon, color: const Color(0xFFFF6B00), size: 18));

  Widget _buildChatBadge(String n) => Stack(children: [const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 28), Positioned(right: 0, top: 0, child: CircleAvatar(radius: 8, backgroundColor: const Color(0xFFD84315), child: Text(n, style: const TextStyle(fontSize: 8, color: Colors.white, fontWeight: FontWeight.bold))))]);

  Widget _buildAmiCentral() => Column(children: [
    Container(
      width: 105, height: 105,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const RadialGradient(colors: [Color(0xFFFF9D5C), Color(0xFFFF6B00)]),
        boxShadow: [BoxShadow(color: const Color(0xFFFF6B00).withOpacity(0.3), blurRadius: 25, offset: const Offset(0, 10))],
      ),
      child: const Center(child: Text("AMI", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900))),
    ),
    const SizedBox(height: 6),
    const Text("IA ASSISTANT", style: TextStyle(color: Color(0xFFFF6B00), fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1)),
    const SizedBox(height: 10),
  ]);

  Widget _navItem(IconData i, String l) => Column(mainAxisSize: MainAxisSize.min, children: [Icon(i, color: Colors.grey[300], size: 26), const SizedBox(height: 4), Text(l, style: TextStyle(color: Colors.grey[400], fontSize: 10, fontWeight: FontWeight.w700))]);
}

// PAINTER DA CURVA CONVEXA (THE SCOOP)
class ScoopPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = const LinearGradient(colors: [Color(0xFFFF914D), Color(0xFFFF6B00)]).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width / 2, size.height * 1.3, size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
