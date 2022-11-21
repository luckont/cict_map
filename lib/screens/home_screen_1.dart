// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../constants/data.dart';
import './paint_screen.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({Key? key}) : super(key: key);
  static const routeName = '/home_screen_1';

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  String dropdownValue1 = list.first;
  String dropdownValue2 = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Bản đồ tầng trệt'),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Image.asset(
                './assets/images/CICT_tret.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.06,
              maxChildSize: 0.8,
              builder: (context, scrollController) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 16),
                        child: Container(
                          height: 5,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: ListView(
                          controller: scrollController,
                          padding: EdgeInsets.zero,
                          children: [
                            const Text(
                              'Vị trí đang đứng:',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 10),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2),
                                      borderRadius: BorderRadius.circular(16))),
                              value: dropdownValue1,
                              icon: const Icon(Icons.arrow_drop_down),
                              elevation: 16,
                              style: const TextStyle(color: Colors.blue),
                              onChanged: (String? value) {
                                setState(() {
                                  dropdownValue1 = value!;
                                });
                              },
                              items: list.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            SizedBox(height: 15),
                            const Text(
                              'Vị trí cần tìm:',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 10),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.blue, width: 2),
                                      borderRadius: BorderRadius.circular(16))),
                              value: dropdownValue2,
                              icon: const Icon(Icons.arrow_drop_down),
                              elevation: 16,
                              style: const TextStyle(color: Colors.blue),
                              onChanged: (String? value) {
                                setState(() {
                                  dropdownValue2 = value!;
                                });
                              },
                              items: list.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(ImageOnCanvas.routeName);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text("Chỉ đường",
                                      style: TextStyle(fontSize: 20)),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
