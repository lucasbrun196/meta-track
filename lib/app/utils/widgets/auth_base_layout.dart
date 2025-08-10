import 'package:flutter/material.dart';
import 'package:meta_track/app/utils/widgets/models/auth_bottom_text_button_model.dart';

class AuthBaseLayout extends StatelessWidget {
  final String? title;
  final Widget cardContent;
  final AuthBottomTextButton? authBottomTextButton;

  const AuthBaseLayout({
    super.key,
    this.title,
    required this.cardContent,
    this.authBottomTextButton,
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
              child: title != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 120),
                      child: Text(
                        title!,
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
                    )
                  : null,
            ),
            authBottomTextButton != null
                ? Padding(
                    padding: EdgeInsetsGeometry.only(bottom: 120),
                    child: InkWell(
                      overlayColor: WidgetStatePropertyAll(Colors.transparent),
                      onTap: authBottomTextButton!.onTap,
                      child: SizedBox(
                        height: 50,
                        width: 100,
                        child: Center(
                          child: Text(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: const Color.fromARGB(255, 120, 87, 217),
                            ),
                            authBottomTextButton!.title,
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
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
