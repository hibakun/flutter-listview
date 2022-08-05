import 'package:flutter/material.dart';
import 'package:flutter_listview/widgets/item_siswa.dart';
import '../models/siswa_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SiswaModel> data = [
    SiswaModel("L", "Adhanafi Ilyasa Sutejo", "Jakarta"),
    SiswaModel("L", "Ahmad Aziz Wira Widodo", "Jepara"),
    SiswaModel("L", "Akbar Rizqullah Putra Susanto", "Semarang"),
    SiswaModel("L", "Alwan Athallah Mumtaz", "Depok"),
    SiswaModel("L", "Amri Iqro Samudra Al-Fatihah", "NTB"),
    SiswaModel("L", "Anakku Lanang Sejati Adli", "Kudus"),
    SiswaModel("L", "Andika Setya Eka Natha", "Kudus"),
    SiswaModel("L", "Antariksa Kusuma Harmawan", "Kudus"),
    SiswaModel("P", "Azzra Rienov Fahlivi", "Depok"),
    SiswaModel("L", "Bayu Septian Kurniawan", "Kudus"),
    SiswaModel("L", "Bhre Nabil Faeyza", "Bogor"),
    SiswaModel("L", "Bimo Adi Bramantyo", "Jakarta"),
    SiswaModel("L", "Daffa Syauqi Syarif", "Kudus"),
    SiswaModel("L", "Danar Gading", "Jakarta"),
    SiswaModel("L", "Dimas Bagus Adityas", "Kudus"),
    SiswaModel("L", "Firdaus Hafidz Al-Kaff", "Demak"),
    SiswaModel("L", "Hegel Al Rafli", "Temanggung"),
    SiswaModel("L", "Hibatullah Fawwaz Hana", "Kudus"),
    SiswaModel("L", "Mikhail Haqeen", "Bekasi"),
    SiswaModel("P", "Wulan Febrianti", "NTB"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemSiswa(
              gender: data[index].gender,
              nama: data[index].nama,
              kota: data[index].kota,
            );
          },
        ),
      ),
    );
  }
}