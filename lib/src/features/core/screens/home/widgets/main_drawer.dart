import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khat_application/src/constants/colors.dart';
import 'package:khat_application/src/constants/text_strings.dart';
import 'package:khat_application/src/repository/authentication_repository/authentication_repository.dart';
import 'package:khat_application/src/utils/theme/widget_themes/text_theme.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(context) {
    final txtTheme = Theme.of(context).textTheme;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "KHAT PLATFORM",
              style: TTextTheme.darkTextTheme.headlineMedium,
            ),
            accountEmail: Text(
              '${FirebaseAuth.instance.currentUser!.email}',
              style: TTextTheme.darkTextTheme.bodySmall,
            ),
            currentAccountPicture:
                const Icon(Icons.person, color: Colors.white, size: 70),
            decoration: BoxDecoration(color: tPrimaryColor.withOpacity(1)),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(tSettings, style: txtTheme.bodyLarge),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.mark_as_unread_sharp),
            title: Text(tContactUs, style: txtTheme.bodyLarge),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.comment_rounded),
            title: Text(tFAQ, style: txtTheme.bodyLarge),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.lock_person),
            title: Text(tPrivacyPolicy, style: txtTheme.bodyLarge),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(tLogout.toUpperCase(), style: txtTheme.bodyLarge),
            onTap: () {
              Get.defaultDialog(
                title: tLogout.toUpperCase(),
                titleStyle: txtTheme.displayMedium,
                content: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Are you sure, you want to Logout?",
                    style: txtTheme.bodyLarge,
                  ),
                ),
                confirm: SizedBox(
                  width: 90,
                  child: ElevatedButton(
                    onPressed: () => AuthenticationRepository.instance.logout(),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900],
                        side: BorderSide.none),
                    child: const Text("Yes"),
                  ),
                ),
                cancel: SizedBox(
                  width: 90,
                  child: OutlinedButton(
                      onPressed: () => Get.back(), child: const Text("No")),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
