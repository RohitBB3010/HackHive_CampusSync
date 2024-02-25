import 'package:campus_sync/authority/home_pages.dart/pages/authority_profile.dart';
import 'package:flutter/material.dart';

class AuthorityBottomNavbar extends StatelessWidget {
  const AuthorityBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (int index) {
          switch (index) {
            case 0:
              break;

            case 1:
              Navigator.pushNamed(context, '/profile');
              break;
            default:
          }
        },
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.document_scanner_rounded), label: 'Proposals'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ]);
  }
}
