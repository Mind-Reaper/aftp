import 'package:aftp/constants.dart';
import 'package:aftp/widgets/search_card.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                          filled: true,
                          // isDense: true,
                          fillColor: Color(0xff262A34),
                          contentPadding: EdgeInsets.symmetric(horizontal: 4),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
                            child: ImageIcon(
                              AssetImage('assets/images/search.png'),
                              color: Colors.white,
                            ),
                          ),
                          hintText: 'Enter keyword',
                          suffixIcon: GestureDetector(
                              onTap: () {
                                controller.clear();
                              },
                              child: Icon(
                                Icons.cancel,
                                size: 24,
                                color: Color(0xff181A20),
                              )),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Cancel',
                    style: TextStyle(
                        color: Color(0xff5E6272), fontSize: 16, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            SizedBox(height: 32),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: ListView(
                physics: BouncingScrollPhysics(),
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  SearchCard(
                    enabled: true,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SearchCard(
                    enabled: false,
                    date: 'Dec 3',
                    name: 'GM1 Hankin',
                    number: '3311 8787',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SearchCard(
                    enabled: true,
                    date: 'Dec 2',
                    name: 'GM1 Simpser',
                    number: '3341 8821',
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
