import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: PetunionHome()));

class PetunionHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              // HEADER DESIGN
              Container(
                height: constraints.maxHeight * 0.45,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFF914D), Color(0xFFFF6B00)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(60)),
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    _buildTopBar(),
                    // CENTRAL PIXEL-PERFECT CARD
                    Container(
                      width: constraints.maxWidth * 0.9,
                      margin: EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(45),
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 30)],
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          Text("Sociais & Accounts", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFFE65100))),
                          SizedBox(height: 10),
                          // SCOOP CLIPPER AREA
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipPath(
                                clipper: ScoopClipper(),
                                child: Container(height: 120, decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFFF914D), Color(0xFFFF6B00)]))),
                              ),
                              _buildAvatar(),
                            ],
                          ),
                          Text("6 / 8", style: TextStyle(fontSize: 55, fontWeight: FontWeight.w100, color: Color(0xFFDCDCDC))),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                    Spacer(),
                    _buildAmiIA(),
                    _buildNavbar(constraints.maxWidth),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTopBar() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
    child: Row(
      children: [
        CircleAvatar(backgroundColor: Colors.white, radius: 15, child: Icon(Icons.pets, size: 18, color: Colors.orange)),
        SizedBox(width: 12),
        Text("PETUNION", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900, letterSpacing: 2)),
        Spacer(),
        Icon(Icons.add, color: Colors.white),
      ],
    ),
  );

  Widget _buildAvatar() => Container(
    width: 90, height: 90,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: Colors.white, width: 4),
      image: DecorationImage(image: NetworkImage('https://i.pravatar.cc/150?u=1'), fit: BoxFit.cover),
    ),
  );

  Widget _buildAmiIA() => Column(
    children: [
      Container(
        width: 100, height: 100,
        decoration: BoxDecoration(shape: BoxShape.circle, gradient: RadialGradient(colors: [Color(0xFFFFB347), Color(0xFFFF8C00)]), boxShadow: [BoxShadow(color: Colors.orange.withOpacity(0.4), blurRadius: 20)]),
        child: Center(child: Text("AMI", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900))),
      ),
      Text("IA ASSISTANT", style: TextStyle(color: Colors.orange, fontSize: 10, fontWeight: FontWeight.bold)),
    ],
  );

  Widget _buildNavbar(double width) => Container(
    margin: EdgeInsets.fromLTRB(15, 10, 15, 25),
    padding: EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(40), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.storefront, color: Colors.grey[300]),
        Icon(Icons.favorite_border, color: Colors.grey[300]),
        SizedBox(width: 50),
        Icon(Icons.assignment, color: Colors.grey[300]),
        Icon(Icons.person_outline, color: Colors.grey[300]),
      ],
    ),
  );
}

class ScoopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.6);
    path.quadraticBezierTo(size.width / 2, size.height * 1.3, size.width, size.height * 0.6);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
