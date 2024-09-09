import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [Colors.purple, Colors.deepPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3))
        ],
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              '@ 2024 Photo Gallery. All rights reserved',
              style: GoogleFonts.titilliumWeb(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.facebook),
                  tooltip: 'Facebook',
                  color: Colors.grey[400],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.link),
                  color: Colors.grey[400],
                  tooltip: 'Link',
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.image),
                  color: Colors.grey[400],
                  tooltip: 'Image',
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.video_library),
                  color: Colors.grey[400],
                  tooltip: 'Video',
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'About Us',
                        style: GoogleFonts.titilliumWeb(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Contact',
                        style: GoogleFonts.titilliumWeb(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Privacy Policy',
                        style: GoogleFonts.titilliumWeb(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Terms of Service',
                        style: GoogleFonts.titilliumWeb(color: Colors.white),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
