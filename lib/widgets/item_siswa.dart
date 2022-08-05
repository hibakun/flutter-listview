import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemSiswa extends StatelessWidget {
  String gender;
  String nama;
  String kota;

  ItemSiswa(
      {Key? key, required this.gender, required this.nama, required this.kota})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(nama),
          duration: Duration(milliseconds: 1000),
        ),
      ),
      child: Container(
        width: width,
        margin: EdgeInsets.only(bottom: height * 0.015),
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage(
                gender == "L"
                    ? "assets/images/men.png"
                    : "assets/images/woman.png",
              ),
              radius: height * 0.035,
            ),
            SizedBox(
              width: width * 0.05,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    kota,
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}