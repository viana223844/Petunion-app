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
      backgroundColor: const Color(0xFFFDFDFD),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // 1. FUNDO GRADIENTE SUPERIOR COM CURVA (HEADER)
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFF8A00), Color(0xFFFF5C00)],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),

          // 2. CONTEÚDO PRINCIPAL EM COLUNA
          SafeArea(
            child: Column(
              children: [
                // HEADER: LOGO + ADD + CHAT
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.pets, color: Color(0xFFFF5C00), size: 20),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "PETUNION",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.add, color: Colors.white, size: 30),
                      const SizedBox(width: 15),
                      Stack(
                        children: [
                          const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 28),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(color: Color(0xFFD84315), shape: BoxShape.circle),
                              constraints: const BoxConstraints(minWidth: 14, minHeight: 14),
                              child: const Text('4', style: TextStyle(color: Colors.white, fontSize: 8), textAlign: TextAlign.center),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // 3. CARD BRANCO CENTRAL (SOCIALS & ACCOUNTS)
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Sociais & Accounts",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF7A00),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Selecione quais Sociais e Contatos serão compartilhados com seu novo amigo.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black45, fontSize: 13),
                      ),
                      const SizedBox(height: 20),
                      // FOTO DO USUÁRIO
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          image: const DecorationImage(
                            image: NetworkImage('https://i.pravatar.cc/150?u=a'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // O "6 / 8" EM FONTE LEVE
                      const Text(
                        "6 / 8",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w100,
                          color: Color(0xFFE0E0E0),
                        ),
                      ),
                      Container(width: 50, height: 1.5, color: const Color(0xFFEEEEEE)),
                    ],
                  ),
                ),

                const Spacer(),

                // 4. AMI E BARRA DE NAVEGAÇÃO INTEGRADA
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    // BARRA DE NAVEGAÇÃO "PILL"
                    Container(
                      height: 80,
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 15,
                            offset: const Offset(0, -5),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildNavItem(Icons.storefront_outlined, "Market"),
                          _buildNavItem(Icons.favorite_border, "Match"),
                          const SizedBox(width: 70), // Espaço para a AMI
                          _buildNavItem(Icons.assignment_outlined, "Ads"),
                          _buildNavItem(Icons.person_outline, "Perfil"),
                        ],
                      ),
                    ),
                    // BOTÃO AMI FLUTUANTE CENTRAL
                    Positioned(
                      bottom: 40,
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const RadialGradient(
                                colors: [Color(0xFFFFB347), Color(0xFFFF8C00)],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFFF8C00).withOpacity(0.4),
                                  blurRadius: 20,
                                  offset: const Offset(0, 8),
                                )
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                "AMI",
                                style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "IA ASSISTANT",
                            style: TextStyle(color: Color(0xFFFF8C00), fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.grey[400], size: 28),
        Text(label, style: TextStyle(color: Colors.grey[400], fontSize: 10, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
