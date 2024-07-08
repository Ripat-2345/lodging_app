import 'package:flutter/material.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  final List<Map<String, dynamic>> _faqs = [
    {
      "question": "Tentang akun saya",
      "subQuestions": [
        {
          "question": "Bagaimana cara membuat akun?",
          "answer":
              "Untuk membuat akun, klik tombol 'Daftar' di halaman utama, lalu isi formulir pendaftaran dengan informasi yang diperlukan."
        },
        {
          "question": "Bagaimana cara mengubah kata sandi?",
          "answer":
              "Anda dapat mengubah kata sandi dari halaman profil Anda dengan mengklik 'Edit Profil' dan kemudian memilih 'Ubah Kata Sandi'."
        },
        {
          "question": "Apa yang harus saya lakukan jika saya lupa kata sandi?",
          "answer":
              "Jika Anda lupa kata sandi, klik 'Lupa Kata Sandi' di halaman login dan ikuti petunjuk untuk mereset kata sandi Anda."
        },
      ],
      "isOpen": false,
    },
    {
      "question": "Reservasi",
      "answer":
          "Untuk memesan hotel, cari hotel yang Anda inginkan di aplikasi, pilih tanggal check-in dan check-out, lalu ikuti petunjuk untuk menyelesaikan reservasi.",
      "isOpen": false,
    },
    {
      "question": "Pembayaran",
      "answer":
          "Kami menerima berbagai metode pembayaran termasuk kartu kredit, transfer bank, dan pembayaran melalui dompet digital.",
      "isOpen": false,
    },
    {
      "question": "Bagaimana cara membatalkan reservasi?",
      "answer":
          "Anda dapat membatalkan reservasi dari halaman 'Reservasi Saya' dengan memilih reservasi yang ingin dibatalkan dan mengklik 'Batalkan Reservasi'.",
      "isOpen": false,
    },
    {
      "question": "Bagaimana cara menghubungi layanan pelanggan?",
      "answer":
          "Anda dapat menghubungi layanan pelanggan kami melalui tombol 'Hubungi' di halaman 'Help Center' atau mengirim email ke support@lodgingapp.com.",
      "isOpen": false,
    },
  ];

  String? _selectedSubQuestion;
  String _answer = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 28,
            color: context.read<ThemeProvider>().themeApp
                ? darkBlueColor
                : whiteColor,
          ),
        ),
        title: Text(
          'Help Center',
          style: semiBoldTextStyle.copyWith(
            color: context.read<ThemeProvider>().themeApp
                ? darkBlueColor
                : whiteColor,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(
            left: 22,
            top: 10,
            right: 22,
            bottom: 22,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: whiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ada yang bisa kami bantu?",
                style: semiBoldTextStyle.copyWith(
                  color: darkBlueColor,
                  fontSize: 20,
                ),
              ),
              Text(
                "Silahkan pilih topik",
                style: mediumTextStyle.copyWith(
                  color: blueColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              ..._faqs.map((faq) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        faq["question"],
                        style: mediumTextStyle.copyWith(
                          color: darkBlueColor,
                          fontSize: 16,
                        ),
                      ),
                      trailing: Icon(
                        faq["isOpen"]
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: darkBlueColor,
                      ),
                      onTap: () {
                        setState(() {
                          faq["isOpen"] = !faq["isOpen"];
                        });
                      },
                    ),
                    if (faq["isOpen"] && faq["subQuestions"] != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            (faq["subQuestions"] as List<Map<String, String>>)
                                .map((subFaq) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _selectedSubQuestion = subFaq["question"];
                                    _answer = subFaq["answer"]!;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 16.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        subFaq["question"]!,
                                        style: mediumTextStyle.copyWith(
                                          color: darkBlueColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const Divider(),
                                    ],
                                  ),
                                ),
                              ),
                              if (_selectedSubQuestion == subFaq["question"])
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 32.0, bottom: 10.0),
                                  child: Text(
                                    _answer,
                                    style: regularTextStyle.copyWith(
                                      color: darkBlueColor,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                            ],
                          );
                        }).toList(),
                      ),
                    if (faq["isOpen"] && faq["subQuestions"] == null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          faq["answer"],
                          style: regularTextStyle.copyWith(
                            color: darkBlueColor,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                  ],
                );
              }).toList(),
              const SizedBox(height: 30),
              Text(
                "Apabila kendala anda tidak tersedia di atas, silahkan hubungi help center!",
                style: mediumTextStyle.copyWith(
                  color: blueColor,
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
