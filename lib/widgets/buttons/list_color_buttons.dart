import 'package:flutter/material.dart';

class ColorButtonPage extends StatefulWidget {
  @override
  _ColorButtonPageState createState() => _ColorButtonPageState();
}

class _ColorButtonPageState extends State<ColorButtonPage> {
  String selectedColor = '';

  List<String> colors = [
    'Red',
    'Green',
    'Blue',
    'Yellow',
    'Purple',
    'Orange',
    'Pink',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Buttons'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    colors.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = colors[index];
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: selectedColor == colors[index]
                              ? Colors.grey[400]
                              : null,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check,
                              color: selectedColor == colors[index]
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                            SizedBox(width: 8),
                            Text(
                              colors[index],
                              style: TextStyle(
                                fontSize: 16,
                                color: selectedColor == colors[index]
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
