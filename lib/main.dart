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
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Stack(
        children: [
          // 1. HEADER LARANJA COM GRADIENTE E CURVA INVERTIDA (SCOOP)
          Container(
            height: screenHeight * 0.44,
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

          // 2. CAMADA DE INTERFACE
          SafeArea(
            child: Column(
              children: [
                // TOP BAR: LOGO + ADD + CHAT NOTIFICATION
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Row(
                    children: [
                      _buildHeaderIcon(Icons.pets),
                      const SizedBox(width: 12),
                      const Text(
                        "PETUNION",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.8,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.add, color: Colors.white, size: 28),
                      const SizedBox(width: 18),
                      _buildNotificationIcon("4"),
                    ],
                  ),
                ),

                // 3. O CARD "SOCIALS & ACCOUNTS" (DESIGN FIDEDIGNO)
                Container(
                  width: screenWidth * 0.91,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.98),
                    borderRadius: BorderRadius.circular(45),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 35,
                        offset: const Offset(0, 15),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Sociais & Accounts",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFFE65100),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Selecione quais Sociais e Contatos serão compartilhados com seu novo amigo.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 13,
                          height: 1.4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 25),
                      // AVATAR DO USUÁRIO COM GLOW SUTIL
                      Container(
                        width: 92,
                        height: 92,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          boxShadow: [
                            BoxShadow(color: Colors.orange.withOpacity(0.2), blurRadius: 15)
                          ],
                          image: const DecorationImage(
                            image: NetworkImage('https://i.pravatar.cc/150?u=petunion'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // CONTADOR 6/8 (FONTE LIGHT/THIN)
                      const Text(
                        "6 / 8",
                        style: TextStyle(
                          fontSize: 52,
                          fontWeight: FontWeight.w100,
                          color: Color(0xFFDCDCDC),
                          letterSpacing: -1,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(width: 45, height: 2, color: const Color(0xFFF2F2F2)),
                    ],
                  ),
                ),

                const Spacer(),

                // 4. AMI IA ASSISTANT (ELEMENTO CENTRAL FLUTUANTE)
                Column(
                  children: [
                    Container(
                      width: 105,
                      height: 105,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const RadialGradient(
                          colors: [Color(0xFFFF9D5C), Color(0xFFFF6B00)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFF6B00).withOpacity(0.35),
                            blurRadius: 25,
                            offset: const Offset(0, 12),
                          )
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "AMI",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "IA ASSISTANT",
                      style: TextStyle(
                        color: Color(0xFFFF6B00),
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // 5. BARRA DE NAVEGAÇÃO CUSTOMIZADA (ESTILO PILL)
                Container(
                  margin: const EdgeInsets.fromLTRB(18, 0, 18, 25),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 15,
                        offset: const Offset(0, -4),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildNavItem(Icons.storefront_outlined, "Market"),
                      _buildNavItem(Icons.favorite_border, "Match"),
                      const SizedBox(width: 50), // Espaço central para a AMI
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

  Widget _buildHeaderIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Icon(icon, color: const Color(0xFFFF6B00), size: 18),
    );
  }

  Widget _buildNotificationIcon(String count) {
    return Stack(
      children: [
        const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 26),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(color: Color(0xFFD84315), shape: BoxShape.circle),
            child: Text(count, style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.grey[350], size: 26),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
