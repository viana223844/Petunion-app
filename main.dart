import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PetunionHome(),
    ));

class PetunionHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // OUTDOOR DIGITAL (O CARROSSEL DE INFORMAÇÕES QUE VOCÊ IDEALIZOU)
          Container(
            height: 320,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue.shade800, Colors.blue.shade400],
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 40, backgroundColor: Colors.white24, child: Icon(Icons.pets, color: Colors.white, size: 40)),
                  SizedBox(height: 15),
                  Text("OUTDOOR PETUNION", style: TextStyle(color: Colors.white70, letterSpacing: 2, fontSize: 12)),
                  SizedBox(height: 10),
                  Text("🏆 Pet Vencedor: Thor", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                  Text("Asa Sul - Brasília", style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
            ),
          ),
          
          // GRADE DE FUNÇÕES (BASEADA NA TELA QUE VOCÊ ENVIOU)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 25,
                children: [
                  _buildIcon(Icons.chat_bubble_outline, "Chat Vet"),
                  _buildIcon(Icons.favorite_border, "Saúde"),
                  _buildIcon(Icons.camera_alt_outlined, "Mural"),
                  _buildIcon(Icons.map_outlined, "Parques"),
                  _buildIcon(Icons.shopping_bag_outlined, "Loja"),
                  _buildIcon(Icons.star_outline, "Ranking"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), shape: BoxShape.circle),
          child: Icon(icon, color: Colors.blue.shade700, size: 28),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87)),
      ],
    );
  }
}


