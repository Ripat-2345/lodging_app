import 'package:flutter/material.dart';
import 'package:lodging_app/pages/bookings/bookings_page.dart';
import 'package:lodging_app/pages/home/home_page.dart';
import 'package:lodging_app/pages/profile/profile_page.dart';
import 'package:lodging_app/pages/search/search_page.dart';
import 'package:lodging_app/theme.dart';

class BottomMenuBarPage extends StatefulWidget {
  const BottomMenuBarPage({super.key});

  @override
  State<BottomMenuBarPage> createState() => _BottomMenuBarPageState();
}

class _BottomMenuBarPageState extends State<BottomMenuBarPage> {
  final List<Map> _listPage = [
    {
      "icon": "assets/icons/browse_icon.png",
      "title": "Browse",
      "page": const HomePage(),
    },
    {
      "icon": "assets/icons/search_icon.png",
      "title": "Search",
      "page": const SearchPage(),
    },
    {
      "icon": "assets/icons/booking_icon.png",
      "title": "Bookings",
      "page": const BookingsPage(),
    },
    {
      "icon": "assets/icons/profile_icon.png",
      "title": "Profile",
      "page": const ProfilePage(),
    },
  ];

  Map? _selectedPage;
  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedPage = _listPage[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedPage!['page'],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 22, right: 22, bottom: 5),
        height: 76,
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: BottomNavigationBar(
            backgroundColor: darkBlueColor,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: yellowColor,
            unselectedItemColor: whiteColor,
            selectedLabelStyle: semiBoldTextStyle.copyWith(fontSize: 12),
            unselectedLabelStyle: semiBoldTextStyle.copyWith(fontSize: 11),
            currentIndex: _listPage.indexOf(_selectedPage!),
            items: _listPage.map((data) {
              return BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: ImageIcon(
                    AssetImage(data['icon']),
                    size: 28,
                  ),
                ),
                label: data['title'],
              );
            }).toList(),
            onTap: (value) {
              setState(() {
                _selectedPage = _listPage[value];
              });
            },
          ),
        ),
      ),
    );
  }
}
