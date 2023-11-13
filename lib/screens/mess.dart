import 'package:flutter/material.dart';

class MessPage extends StatefulWidget {
  final List<Map<String, String>> data;
  final List<Map<String, String>> data2;

  MessPage({required this.data, required this.data2});

  @override
  State<MessPage> createState() => _MessPageState();
}

class _MessPageState extends State<MessPage> {
  bool veg = true;
  bool spl = false;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> dataToDisplay = veg ? widget.data : widget.data2;

    return Column(
      children: [
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Text("MESS MENU", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            ),
            FilterChip(
              label: Text("Veg / Non-Veg"),
              backgroundColor: Color.fromARGB(255, 64, 64, 64),
              showCheckmark: false,
              selectedColor: const Color.fromARGB(255, 255, 154, 23),
              onSelected: (bool value) {
                setState(() {
                  veg = value;
                  spl = false;
                  dataToDisplay = veg ? widget.data : widget.data2;
                });
              },
              selected: veg,
            ),
            FilterChip(
              label: Text("Special"),
              showCheckmark: false,
              backgroundColor: Color.fromARGB(255, 64, 64, 64),
              selectedColor: const Color.fromARGB(255, 255, 154, 23),
              onSelected: (bool value) {
                setState(() {
                  spl = value;
                  veg = false;
                  dataToDisplay = spl ? widget.data2 : widget.data;
                });
              },
              selected: spl,
            ),
          ],
        ),
        SizedBox(height: 10,),
        Expanded(
          child: ListView.builder(
            itemCount: dataToDisplay.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(dataToDisplay[index]['DAYS'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                      subtitle: Column(
                        children: [
                          Text("BREAKFAST", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 10,),
                          Text(dataToDisplay[index]['BREAK FAST'].toString()),
                          SizedBox(height: 20,),
                          Text("LUNCH", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 10,),
                          Text(dataToDisplay[index]['LUNCH'].toString()),
                          SizedBox(height: 20,),
                          Text("SNACKS", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 10,),
                          Text(dataToDisplay[index]['SNACKS'].toString()),
                          SizedBox(height: 20,),
                          Text("DINNER", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 10,),
                          Text(dataToDisplay[index]['DINNER'].toString()),
                          SizedBox(height: 20,),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          height: 100,
          width: double.infinity,
        ),
      ],
    );
  }
}
