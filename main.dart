import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: PetunionHome()));

class PetunionHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F4F8),
      body: Stack(
        children: [
          // OUTDOOR DINÂMICO
          Container(
            height: 320,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFF0D47A1), Color(0xFF1E88E5)]),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(45)),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("PETUNION BRASÍLIA", style: TextStyle(color: Colors.white60, letterSpacing: 3, fontSize: 11)),
                  SizedBox(height: 12),
                  Text("Thor em Destaque", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                  Text("Estrela da Asa Sul", style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
          ),

          // GRID DE COMANDOS COM TOQUE NA AMI
          Padding(
            padding: const EdgeInsets.only(top: 285),
            child: GridView.count(
              crossAxisCount: 3,
              padding: EdgeInsets.symmetric(horizontal: 25),
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              children: [
                _buildIcon(Icons.health_and_safety_outlined, "Chat Vet"),
                _buildIcon(Icons.pets, "Meus Pets"),
                _buildIcon(Icons.dashboard_customize_outlined, "Mural"),
                _buildIcon(Icons.map_outlined, "Parques"),
                
                _buildAmiIcon(context), // AGORA PASSAMOS O CONTEXTO PARA O TOQUE
                
                _buildIcon(Icons.emoji_events_outlined, "Ranking"),
                _buildIcon(Icons.local_mall_outlined, "Loja"),
                _buildIcon(Icons.gavel_rounded, "Jurídico"),
                _buildIcon(Icons.notifications_active_outlined, "Alertas"),
              ],
            ),
          ),
        ],
      ),
      
      bottomNavigationBar: Container(
        margin: EdgeInsets.fromLTRB(25, 0, 25, 30),
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(0, 10))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.home_filled, "União", true),
            _buildNavItem(Icons.explore_outlined, "Mapa", false),
            _buildNavItem(Icons.chat_bubble_outline, "Social", false),
            _buildNavItem(Icons.person_outline, "Perfil", false),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
          child: Icon(icon, color: Color(0xFF1565C0), size: 28),
        ),
        SizedBox(height: 6),
        Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.blueGrey)),
      ],
    );
  }

  // FUNÇÃO DA AMI COM DETECÇÃO DE TOQUE
  Widget _buildAmiIcon(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Ami: 'Olá! Estou preparando sua consultoria técnica...'")),
        );
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [Colors.blueAccent, Colors.cyanAccent]),
              boxShadow: [BoxShadow(color: Colors.blueAccent.withOpacity(0.4), blurRadius: 12)],
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage('https://raw.githubusercontent.com/viana223844/Petunion-app/main/ami_face.png'), 
            ),
          ),
          SizedBox(height: 4),
          Text("AMI", style: TextStyle(fontSize: 12, fontWeight: FontWeight.black, color: Colors.blueAccent)),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool active) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: active ? Color(0xFF0D47A1) : Colors.grey.shade400, size: 28),
        if (active) Container(margin: EdgeInsets.only(top: 4), height: 4, width: 4, decoration: BoxDecoration(color: Color(0xFF0D47A1), shape: BoxShape.circle))
      ],
    );
  }
}
