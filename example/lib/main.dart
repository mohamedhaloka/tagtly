import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tagtly/tagtly.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tagtly Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TagtlyApp(),
    );
  }
}

class TagtlyApp extends StatefulWidget {
  const TagtlyApp({Key? key}) : super(key: key);

  @override
  State<TagtlyApp> createState() => _TagtlyAppState();
}

class _TagtlyAppState extends State<TagtlyApp> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tagtly Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: TagtlyTextField(
              decoration: const InputDecoration(
                  hintText: 'Type anything',
                  contentPadding: EdgeInsets.symmetric(horizontal: 8)),
              onChanged: (String value) {
                text = value;
                setState(() {});
              },
            ),
          ),
          const Text(
            'Output:',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
          ),
          Expanded(
              child: TagtlyTextView(
            text,
            onClick: (TextObj value) => log(value.type.toString()),
          ))
        ],
      ),
    );
  }
}

List<String> posts = <String>[
  '''عاوز توصل للاحترافيه في مجالك وتزود فرص دخلك؟
لو حلمك تشتغل Freelance وتقبض بالدولار من بيتك
أو تشتغل في أكبر الشركات في مجالك
هتقدر تحقق حلمك
شاهد اكثر من ٢،٥٠٠ فيديو تعليمي باشتراك واحد يناسب ميزانيتك
من خلال منصة #ينفع من أكبر المنصات للمحتوى التعليمي بالوطن العربي
بأشتراك 130 جنيه شهرياً''',
  '''باقي من الزمن ٢٤ ساعة و نبدا المرحلة الجديدة من استقبال جيل جديد في MEGA 🤫
https://www.mega.com/id=6537&uhks=is/sjsi?8js
سجل في الفورم دي و انضم لينا:

https://docs.google.com/forms/d/e/1FAIpQLSdVn8aiufizaNZ6eTK60JjQmiFvUKOppdArN2ueyA32a5D17g/viewform?usp=sf_link

#MEGA_Team
#creative_solutions
#its_mega''',
  '''لجأ نادي برشلونة إلى خدعة بسيطة من أجل تأمين لاعبه الجديد رافينيا فور وصوله.

واستعان برشلونة بأحد الأشخاص يشبه كثيرا.

وارتدى اللاعب ملابس تشبه الملابس الذي يرتديها رافينيا مع وضع نظارة وقبعة، لتتجمع حوله الصحافة ووسائل الإعلام والجمهور.

وفي الوقت ذاته كان رافينيا يسير وحيدا في طريق آخر بعد خروجه من الطائرة دون أن يلاحظه أحد.''',
  '''Username: m.nasr@gmail.com
Password: wPViBku2%G6w
Incoming Server: mail.dreams-it.org
IMAP Port: 993 POP3 Port: 995
Outgoing Server: mail.dreams-it.org
SMTP Port: 465
IMAP, POP3, and SMTP require authentication.
''',
];
