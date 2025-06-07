import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isNotificationEnabled = true;
  bool isLanguageExpanded = false;
  String selectedLanguage = 'English';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.white70),
            title: Text(
              'Notifications',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
            trailing: Switch(
              value: isNotificationEnabled,
              onChanged: (val) {
                setState(() {
                  isNotificationEnabled = val;
                });
              },
              activeColor: MyColors.gold,
              activeTrackColor: MyColors.lightGrey,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: MyColors.darkGrey,
            ),
          ),

          ListTile(
            leading: const Icon(Icons.lock_outline, color: Colors.white70),
            title: Text(
              'Privacy',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: MyColors.darkGrey,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.privacy_tip, size: 50, color: MyColors.gold),
                      const SizedBox(height: 10),
                      Text(
                        'Feel secure with this app.\nWe are not accessing your details and information.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.language, color: Colors.white70),
            title: Text(
              'Language',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
            trailing: Icon(
              isLanguageExpanded ? Icons.expand_less : Icons.expand_more,
              color: Colors.white70,
            ),
            onTap: () {
              setState(() {
                isLanguageExpanded = !isLanguageExpanded;
              });
            },
          ),

          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: MyColors.lightGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedLanguage = 'English';
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Icon(
                                selectedLanguage == 'English'
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'English',
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedLanguage = 'Telugu';
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Icon(
                                selectedLanguage == 'Telugu'
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Telugu',
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
              ),
            ),
            crossFadeState: isLanguageExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
        ],
      ),
    );
  }
}
