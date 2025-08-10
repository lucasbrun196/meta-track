import 'package:flutter/material.dart';
import 'package:meta_track/app/utils/widgets/models/auth_bottom_text_button_model.dart';

class AuthBaseLayout extends StatelessWidget {
  final Widget cardContent;
  final AuthBottomTextButton authBottomTextButton;

  const AuthBaseLayout({
    super.key,
    required this.cardContent,
    required this.authBottomTextButton,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromARGB(255, 120, 87, 217),
                    Color.fromARGB(255, 255, 255, 255),
                  ])),
              height: screenSize.height * 0.65,
              width: screenSize.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 120),
                child: Text(
                  'META TRACK',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontFamily: 'Playfairdisplay',
                    fontSize: 48,
                    shadows: [
                      Shadow(
                        color: const Color.fromARGB(150, 0, 0, 0),
                        offset: Offset(0, 20),
                        blurRadius: 45,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 120),
              child: InkWell(
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
                onTap: authBottomTextButton.onTap,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(
                        color: const Color.fromARGB(130, 120, 87, 217),
                      )),
                  height: 60,
                  width: screenSize.width * 0.85 - 40,
                  child: Center(
                    child: Text(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: const Color.fromARGB(255, 120, 87, 217),
                      ),
                      authBottomTextButton.title,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Center(
          child: Card(
            elevation: 10,
            child: SizedBox(
              width: screenSize.width * 0.85,
              height: screenSize.height * 0.50,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: cardContent,
              ),
            ),
          ),
        )
      ],
    );
  }
}
