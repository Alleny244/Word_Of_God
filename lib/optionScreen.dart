import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:math';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  void searchVerse() {
    Navigator.pushNamed(context, '/input');
  }

  void randomVerse() async {
    const VERSES = [
      "JER",
      "PSA",
      "1COR",
      "PHP",
      "JHN",
      "ROM",
      "ISA",
      "PSA",
      "GAL",
      "HEB",
      "2TI",
      "1COR",
      "PRO",
      "ISA",
      "JOS",
      "HEB",
      "MAT",
      "ROM",
      "PHP",
      "MAT",
    ];
    String chapter = new Random().nextInt(25).toString();
    String verse = new Random().nextInt(45).toString();
    String name =
        VERSES[new Random().nextInt(15)] + "." + chapter + "." + verse;

    final response = await get(
      Uri.parse(
          "https://api.scripture.api.bible/v1/bibles/9f78f34aabe691c9-02/verses/$name?content-type=text&include-notes=false&include-titles=true&include-chapter-numbers=true&include-verse-numbers=true&include-verse-spans=false&use-org-id=false"),
      headers: {
        'api-key': "628e76b850a6ed3dd7efd17f12468b70",
      },
    );
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body.toString());
      var wording = responseJson['data']['reference'];
      var para = responseJson['data']['content'];
      Navigator.pushReplacementNamed(context, '/loader', arguments: {
        'wording': wording,
        'para': para,
      });
    } else {
      randomVerse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: randomVerse,
                  child: Text("Word of the day"),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: searchVerse,
                  child: Text("Search Verse"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
