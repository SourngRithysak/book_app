import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _CreateStateScreen();
}

class _CreateStateScreen extends State<LanguageScreen> {
  String selectedLang = "km";

  final List<Map<String, dynamic>> languages = [
    {
      'nameKey': 'khmerLanguage',
      'code': 'km',
      'locale': Locale('km', 'KH'),
      'flag': 'assets/images/cambodia_flag.png'
    },
    {
      'nameKey': 'englishLanguage',
      'code': 'en',
      'locale': Locale('en', 'US'),
      'flag': 'assets/images/the_united_state_flag.png'
    },
    {
      'nameKey': 'chineseLanguage',
      'code': 'zh',
      'locale': Locale('zh', 'CN'),
      'flag': 'assets/images/china_flag.png'
    },
    {
      'nameKey': 'japaneseLanguage',
      'code': 'ja',
      'locale': Locale('ja', 'JP'),
      'flag': 'assets/images/japan_flag.png'
    },
    {
      'nameKey': 'koreanLanguage',
      'code': 'ko',
      'locale': Locale('ko', 'KR'),
      'flag': 'assets/images/korean_flag.png'
    }
  ];

  @override
  void initState() {
    super.initState();
    selectedLang = Get.locale?.languageCode ?? "km";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "language".tr,
          style: const TextStyle(
            fontFamily: 'Kantumruy_Pro',
            fontSize: 25,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 0.5,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final lang = languages[index];
          return ListTile(
            leading: Image.asset(lang['flag'], width: 50),
            title: Text(
              (lang['nameKey'].toString().tr),
              style: const TextStyle(fontFamily: 'Kantumruy_Pro'),
            ),
            trailing: Checkbox(
              value: selectedLang == lang['code'],
              onChanged: (_) {
                setState(() {
                  selectedLang = lang['code'];
                  Get.updateLocale(lang['locale']);
                });
              },
            ),
            onTap: () {
              setState(() {
                selectedLang = lang['code'];
                Get.updateLocale(lang['locale']);
              });
            },
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: languages.length,
      ),
    );
  }
}