import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_projectonthismac/components/button.dart';
import 'package:my_first_projectonthismac/pages/menu_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // SizedBox(height: 50),
              Text(
                'SUSHI MAN',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset("lib/images/salmon_eggs.png"),
              ),
              const SizedBox(height: 20),
              Text(
                'THE TASTE OF JAPANESE FOOD',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 44,
                  color: const Color.fromARGB(255, 238, 241, 238),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Feel the taste of the most popular Japanese food from anywhere and anytime',
                style: TextStyle(
                  color: Colors.grey[300],
                  height: 2,
                ),
              ),
              const SizedBox(height: 25),
              CustomButton(
                text: 'Get Started',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MenuPage()));
                  // Navigator.pushNamed(context, '/menupage');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
