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

          // GRID DE COMANDOS
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
                _buildAmiIcon(context), 
                _buildIcon(Icons.emoji_events_outlined, "Ranking"),
                _buildIcon(Icons.local_mall_outlined, "Loja"),
                _buildIcon(Icons.gavel_rounded, "Jurídico"),
                _buildIcon(Icons.notifications_active_outlined, "Alertas"),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildAmiIcon(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AmiChatScreen())),
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
              backgroundImage: NetworkImage('https://raw.githubusercontent.com/viana223844/Petunion-app/main/ami_face.png'), 
            ),
          ),
          SizedBox(height: 4),
          Text("AMI", style: TextStyle(fontSize: 12, fontWeight: FontWeight.black, color: Colors.blueAccent)),
        ],
      ),
    );
  }

  // REUTILIZAÇÃO DE WIDGETS
  Widget _buildIcon(IconData icon, String label) {
    return Column(children: [
      Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
        child: Icon(icon, color: Color(0xFF1565C0), size: 28),
      ),
      SizedBox(height: 6),
      Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.blueGrey)),
    ]);
  }

  Widget _buildBottomNav() {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 0, 25, 30),
      height: 75,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Icon(Icons.home_filled, color: Color(0xFF0D47A1), size: 28),
        Icon(Icons.explore_outlined, color: Colors.grey.shade400, size: 28),
        Icon(Icons.chat_bubble_outline, color: Colors.grey.shade400, size: 28),
        Icon(Icons.person_outline, color: Colors.grey.shade400, size: 28),
      ]),
    );
  }
}

// NOVA TELA: CHAT DA AMI (ESTILO WHATSAPP COM MARCA D'ÁGUA)
class AmiChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0D47A1),
        title: Row(children: [
          CircleAvatar(radius: 18, backgroundImage: NetworkImage('https://raw.githubusercontent.com/viana223844/Petunion-app/main/ami_face.png')),
          SizedBox(width: 10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Ami Especialista", style: TextStyle(fontSize: 16)),
            Text("Online agora", style: TextStyle(fontSize: 11, color: Colors.lightBlueAccent)),
          ])
        ]),
      ),
      body: Stack(
        children: [
          // MARCA D'ÁGUA DO CONSULTÓRIO
          Opacity(
            opacity: 0.05, // Suave para não atrapalhar a leitura
            child: Center(child: Icon(Icons.local_hospital, size: 300, color: Colors.blueGrey)),
          ),
          Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(15),
                  children: [
                    _buildMessageBubble("Olá! Sou a Ami. Como posso ajudar com a saúde ou questões jurídicas do seu pet em Brasília hoje?", true),
                  ],
                ),
              ),
              _buildInputArea(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String text, bool isAmi) {
    return Row(
      mainAxisAlignment: isAmi ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (isAmi) CircleAvatar(radius: 15, backgroundImage: NetworkImage('https://raw.githubusercontent.com/viana223844/Petunion-app/main/ami_face.png')),
        Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          constraints: BoxConstraints(maxWidth: 250),
          decoration: BoxDecoration(
            color: isAmi ? Colors.white : Color(0xFFDCF8C6),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)],
          ),
          child: Text(text, style: TextStyle(color: Colors.black87, fontSize: 14)),
        ),
      ],
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: Colors.white,
      child: Row(children: [
        Expanded(child: TextField(decoration: InputDecoration(hintText: "Digite sua dúvida...", border: InputBorder.none))),
        IconButton(icon: Icon(Icons.send, color: Color(0xFF0D47A1)), onPressed: () {}),
      ]),
    );
  }
}
