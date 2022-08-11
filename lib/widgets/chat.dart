import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/siswa_model.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<SiswaModel> data = [
    SiswaModel("L", "Adhanafi Ilyasa Sutejo", "Jakarta", "15.20", 1),
    SiswaModel("L", "Ahmad Aziz Wira Widodo", "Jepara", "15.22", 3),
    SiswaModel("L", "Akbar Rizqullah Putra Susanto", "Semarang", "15.30", 2),
    SiswaModel("L", "Alwan Athallah Mumtaz", "Depok", "16.02", 2),
    SiswaModel("L", "Amri Iqro Samudra Al-Fatihah", "NTB", "16.13", 1),
    SiswaModel("L", "Anakku Lanang Sejati Adli", "Kudus", "16.50", 3),
    SiswaModel("L", "Andika Setya Eka Natha", "Kudus", "17.00", 2),
    SiswaModel("L", "Antariksa Kusuma Harmawan", "Kudus", "17.27", 1),
    SiswaModel("P", "Azzra Rienov Fahlivi", "Depok", "17.48", 2),
    SiswaModel("L", "Bayu Septian Kurniawan", "Kudus", "17.50", 1),
    SiswaModel("L", "Bhre Nabil Faeyza", "Bogor", "17.51", 4),
    SiswaModel("L", "Bimo Adi Bramantyo", "Jakarta", "18.00", 2),
    SiswaModel("L", "Daffa Syauqi Syarif", "Kudus", "18.06", 3),
    SiswaModel("L", "Danar Gading", "Jakarta", "18.20", 2),
    SiswaModel("L", "Dimas Bagus Adityas", "Kudus", "18.30", 2),
    SiswaModel("L", "Firdaus Hafidz Al-Kaff", "Demak", "18.45", 1),
    SiswaModel("L", "Hegel Al Rafli", "Temanggung", "18.55", 2),
    SiswaModel("L", "Hibatullah Fawwaz Hana", "Kudus", "19.15", 2),
    SiswaModel("L", "Mikhail Haqeen", "Bekasi", "19.27", 1),
    SiswaModel("P", "Wulan Febrianti", "NTB", "20.00", 3),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: data.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(data[index].nama),
                  duration: Duration(milliseconds: 1000),
                ),
              ),
              onLongPress: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Hapus Pesan"),
                  content: Text(
                      "Apakah anda yakin ingin menghapus pesan dari ${data[index].nama}"),
                  actions: [
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          data.removeAt(index);
                        });
                        Navigator.pop(context);
                      },
                      child: Text("Ya"),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Tidak"),
                    ),
                  ],
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
                        data[index].gender == "L"
                            ? "assets/images/men.png"
                            : "assets/images/woman.png",
                      ),
                      radius: height * 0.03,
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index].nama.length > 22
                              ? data[index].nama.substring(0, 22) + '...'
                              : data[index].nama,
                          maxLines: 1,
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
                          data[index].pesan,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(data[index].waktu),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        CircleAvatar(
                          radius: height * 0.013,
                          child: Text(data[index].jumlah.toString()),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
