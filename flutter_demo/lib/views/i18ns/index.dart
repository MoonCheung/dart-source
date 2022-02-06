import 'package:get/get.dart' hide Trans;
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_demo/views/i18ns/lang.dart';

class i18nsPage extends StatefulWidget {
  const i18nsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _i18nsPageState createState() => _i18nsPageState();
}

class _i18nsPageState extends State<i18nsPage> {
  // 引入i18n lang类
  List<Language> languageList = [
    Language(
      langName: 'China - CN',
      locale: const Locale('zh'),
    ),
    Language(
      langName: 'English - UK',
      locale: const Locale('en'),
    )
  ];

  Language? selectedLang;

  @override
  Widget build(BuildContext context) {
    // 选中lang方法触发
    selectedLang =
        languageList.singleWhere((el) => el.locale == context.locale); // 10
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.yellow,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('title'.tr() + ":",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400)),
                      Expanded(
                          child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          'app_local_demo'.tr(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ))
                    ]),
              ),
              Container(
                  color: Colors.blue,
                  width: width,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'details'.tr() + ":",
                          style: const TextStyle(fontSize: 15),
                        ),
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text('demo_details'.tr(),
                              style: const TextStyle(fontSize: 15)),
                        ))
                      ])),
              Center(
                  child: DropdownButton<Language>(
                      iconSize: 18,
                      elevation: 16,
                      value: selectedLang,
                      style: const TextStyle(color: Colors.black),
                      items: languageList
                          .map<DropdownMenuItem<Language>>((Language lang) {
                        return DropdownMenuItem<Language>(
                          value: lang,
                          child: Text(
                            lang.langName,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      underline: Container(
                        color: Colors.transparent,
                      ),
                      onChanged: (newVal) {
                        setState(() {
                          selectedLang = newVal;
                        });
                        if (newVal!.langName == 'China - CN') {
                          context.setLocale(newVal.locale);
                          Get.updateLocale(newVal.locale);
                        } else if (newVal.langName == 'English - UK') {
                          context.setLocale(newVal.locale);
                          Get.updateLocale(newVal.locale);
                        }
                      }))
            ]));
  }
}
