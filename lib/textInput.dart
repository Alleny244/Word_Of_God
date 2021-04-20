import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class InputField extends StatefulWidget {
  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  TextEditingController obj = TextEditingController();
  var errorT = "";
  void validationg() async {
    var name = obj.text.toString();
    print(name);
    if (name == "") {
      setState(() {
        errorT = "Please provide an input";
      });
    } else {
      final response = await get(
        Uri.parse(
            "https://api.scripture.api.bible/v1/bibles/9f78f34aabe691c9-02/verses/${name}?content-type=text&include-notes=false&include-titles=true&include-chapter-numbers=true&include-verse-numbers=true&include-verse-spans=false&use-org-id=false"),
        headers: {
          'api-key': "628e76b850a6ed3dd7efd17f12468b70",
        },
      );
      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.body.toString());
        var wording = responseJson['data']['reference'];
        var para = responseJson['data']['content'];
        Navigator.pushReplacementNamed(context, '/spinner', arguments: {
          'wording': wording,
          'para': para,
        });
      } else {
        Navigator.pushNamed(context, '/notfound');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'JER = യിരെമ്യാവു';
    return Container(
      child: Scaffold(
          appBar: AppBar(),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  value: dropdownValue,
                  items: <String>[
                    "JER = യിരെമ്യാവു",
                    "PSA = സങ്കീർത്തനങ്ങൾ",
                    "1CO = 1. കൊരിന്ത്യർ",
                    "PHP = ഫിലിപ്യർ",
                    "JHN = യോഹന്നാൻ",
                    "ROM = റോമർ",
                    "ISA = യെശയ്യാവ്",
                    "GAL = ഗലാത്യർ",
                    "HEB = എബ്രായർ",
                    "2TI = 2. തിമൊഥെയൊസ്",
                    "PRO = സദൃശവാക്യങ്ങൾ",
                    "ISA = യെശയ്യാവ്",
                    "JOS = യോശുവ",
                    "MAT = മത്തായി",
                    "ROM = റോമർ",
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(40),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      // override textfield's icon color when selected
                      accentColor: Color(0xFFB22222),
                    ),
                    child: TextField(
                      controller: obj,
                      enableInteractiveSelection: true,
                      cursorColor: Color(0xFFB22222),
                      autocorrect: true,
                      decoration: InputDecoration(
                        errorText: '$errorT',
                        hoverColor: Color(0xFFB22222),
                        focusColor: Color(0xFFB22222),
                        hintText: "JER.1.3",
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.book_sharp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFB22222),
                      ),
                    ),
                    onPressed: validationg,
                    icon: const Icon(Icons.search),
                    label: Text("Search"),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
