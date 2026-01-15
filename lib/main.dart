import 'package:flutter/material.dart';

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

class PetunionHome extends StatelessWidget {
  const PetunionHome({super.key});

  @override
  Widget build(BuildContext context) {
    // LayoutBuilder resolve a projeção de erro de compilação de tamanho (getter size)
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;

        return Scaffold(
          backgroundColor: const Color(0xFFF8F8F8),
          body: Stack(
            children: [
              // 1. HEADER GRADIENTE COM CURVA (REFERÊNCIA 1002880357)
              Container(
                height: height * 0.42,
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
                child: Column(
                  children: [
                    // TOP BAR PIXEL-PERFECT (REF: 1002880357)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                      child: Row(
                        children: [
                          _circleIcon(Icons.pets),
                          const SizedBox(width: 12),
                          const Text("PETUNION", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900, letterSpacing: 2)),
                          const Spacer(),
                          const Icon(Icons.add, color: Colors.white, size: 28),
                          const SizedBox(width: 15),
                          _notificationBadge("4"),
                        ],
                      ),
                    ),

                    // 2. CARD "SOCIAIS & ACCOUNTS" COM SCOOP (REF: 1002880357)
                    Container(
                      width: width * 0.92,
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
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                            child: Text("Selecione quais Sociais e Contatos serão compartilhados com seu novo amigo.", 
                              textAlign: TextAlign.center, style: TextStyle(color: Colors.black38, fontSize: 13, height: 1.4)),
                          ),
                          
                          // SCOOP CLIPPER PARA O AVATAR
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipPath(
                                clipper: ScoopClipper(),
                                child: Container(
                                  height: 120,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(colors: [Color(0xFFFF914D), Color(0xFFFF6B00)]),
                                  ),
                                ),
                              ),
                              Container(
                                width: 90, height: 90,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 4),
                                  boxShadow: [BoxShadow(color: Colors.orange.withOpacity(0.2), blurRadius: 15)],
                                  image: const DecorationImage(image: NetworkImage('https://i.pravatar.cc/150?u=a'), fit: BoxFit.cover),
                                ),
                              ),
                            ],
                          ),

                          // CONTADOR ULTRA-LIGHT
                          const Text("6 / 8", style: TextStyle(fontSize: 58, fontWeight: FontWeight.w100, color: Color(0xFFDCDCDC))),
                          Container(width: 55, height: 2, color: const Color(0xFFF2F2F2)),
                          const SizedBox(height: 35),
                        ],
                      ),
                    ),

                    const Spacer(),

                    // 3. AMI IA E NAVBAR PILL (REF: 1002880357)
                    _amiSection(),

                    Container(
                      margin: const EdgeInsets.fromLTRB(18, 5, 18, 25),
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
                          const SizedBox(width: 60), // GAP PARA A AMI
                          _navItem(Icons.assignment_outlined, "Ads"),
                          _navItem(Icons.person_outline, "Perfil"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _circleIcon(IconData i) => Container(padding: const EdgeInsets.all(7), decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: Icon(i, color: const Color(0xFFFF6B00), size: 18));

  Widget _notificationBadge(String n) => Stack(children: [const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 28), Positioned(right: 0, top: 0, child: CircleAvatar(radius: 8, backgroundColor: const Color(0xFFD84315), child: Text(n, style: const TextStyle(fontSize: 8, color: Colors.white, fontWeight: FontWeight.bold))))]);

  Widget _amiSection() => Column(children: [
    Container(
      width: 105, height: 105,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const RadialGradient(colors: [Color(0xFFFFB347), Color(0xFFFF8C00)]),
        boxShadow: [BoxShadow(color: const Color(0xFFFF6B00).withOpacity(0.4), blurRadius: 20, offset: const Offset(0, 8))],
      ),
      child: const Center(child: Text("AMI", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900))),
    ),
    const SizedBox(height: 5),
    const Text("IA ASSISTANT", style: TextStyle(color: Color(0xFFFF8C00), fontSize: 10, fontWeight: FontWeight.w900)),
  ]);

  Widget _navItem(IconData i, String l) => Column(mainAxisSize: MainAxisSize.min, children: [Icon(i, color: Colors.grey[300], size: 28), Text(l, style: TextStyle(color: Colors.grey[400], fontSize: 10, fontWeight: FontWeight.w700))]);
}

class ScoopClipper extends CustomClipper<Path> {
  @override
  Path getPath(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width / 2, size.height * 1.3, size.width, size.height * 0.7);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
