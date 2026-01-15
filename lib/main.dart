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
      backgroundColor: const Color(0xFFF9F9F9),
      body: Stack(
        children: [
          // 1. HEADER LARANJA COM GRADIENTE (TOP)
          Container(
            height: 380,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFF914D), Color(0xFFFF6B00)],
              ),
            ),
          ),

          // 2. CAMADA DE CONTEÚDO PRINCIPAL
          SafeArea(
            child: Column(
              children: [
                // TOP BAR (LOGO + ACTIONS)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      _buildCircleIcon(Icons.pets),
                      const SizedBox(width: 10),
                      const Text("PETUNION", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: 2)),
                      const Spacer(),
                      const Icon(Icons.add, color: Colors.white, size: 28),
                      const SizedBox(width: 15),
                      _buildNotificationIcon("4"),
                    ],
                  ),
                ),

                // 3. CARD BRANCO (FIDELIDADE 1:1)
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(45),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 30, offset: const Offset(0, 15))],
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
                      
                      // CONTAINER DA FOTO COM FUNDO CURVADO LARANJA (REFERÊNCIA 1002880357)
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 120,
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [Color(0xFFFF914D), Color(0xFFFF6B00)]),
                              borderRadius: BorderRadius.all(Radius.elliptical(200, 100)),
                            ),
                          ),
                          Container(
                            width: 90, height: 90,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 4),
                              image: const DecorationImage(image: NetworkImage('https://i.pravatar.cc/150?u=thor'), fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),

                      // CONTADOR 6/8 ULTRA-LIGHT
                      const SizedBox(height: 10),
                      const Text("6 / 8", style: TextStyle(fontSize: 55, fontWeight: FontWeight.w100, color: Color(0xFFE0E0E0))),
                      const SizedBox(height: 5),
                      Container(width: 50, height: 1.5, color: const Color(0xFFF2F2F2)),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),

                const Spacer(),

                // 4. AMI E NAVBAR (ESTILO FLOATING PILL)
                _buildAmiSection(),

                const SizedBox(height: 10),

                // BARRA DE NAVEGAÇÃO
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 20),
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
                      const SizedBox(width: 60), // Espaço para a AMI
                      _navItem(Icons.assignment_outlined, "Ads"),
                      _navItem(Icons.person_outline, "Perfil"),
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

  Widget _buildCircleIcon(IconData icon) => Container(padding: const EdgeInsets.all(6), decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: Icon(icon, color: const Color(0xFFFF6B00), size: 18));

  Widget _buildNotificationIcon(String count) => Stack(children: [const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 26), Positioned(right: 0, top: 0, child: CircleAvatar(radius: 7, backgroundColor: const Color(0xFFD84315), child: Text(count, style: const TextStyle(fontSize: 8, color: Colors.white))))]);

  Widget _buildAmiSection() => Column(children: [
    Container(
      width: 100, height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const RadialGradient(colors: [Color(0xFFFF914D), Color(0xFFF37021)]),
        boxShadow: [BoxShadow(color: const Color(0xFFFF6B00).withOpacity(0.4), blurRadius: 25, offset: const Offset(0, 10))],
      ),
      child: const Center(child: Text("AMI", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900))),
    ),
    const SizedBox(height: 5),
    const Text("IA ASSISTANT", style: TextStyle(fontSize: 9, fontWeight: FontWeight.w900, color: Color(0xFFFF6B00))),
  ]);

  Widget _navItem(IconData icon, String label) => Column(mainAxisSize: MainAxisSize.min, children: [Icon(icon, color: Colors.grey[350], size: 26), Text(label, style: TextStyle(color: Colors.grey[400], fontSize: 10, fontWeight: FontWeight.w700))]);
}
