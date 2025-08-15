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
                  color: Color.fromARGB(255, 120, 87, 217),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(75),
                      bottomRight: Radius.circular(75))),
              height: screenSize.height * 0.65,
              width: screenSize.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 40),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 90),
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
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: const Color.fromARGB(255, 0, 0, 0),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
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
              ),
            ],
          ),
        )
      ],
    );
  }
}
