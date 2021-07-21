import 'package:flutter/material.dart';
import 'package:symptomator/styles/text_styles.dart';
import 'package:intl/intl.dart';
import 'package:symptomator/widgets/illness_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String date = DateFormat('dd-MM-yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => print('still to fill out'),
            icon: const Icon(Icons.auto_graph),
          ),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text('Some other text'), Text('Datum: $date')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person)),
              Text(
                "Name Nachname",
                textAlign: TextAlign.center,
                style: nameStyle,
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                const IllnessCard(
                    icon: Icon(Icons.ac_unit), illness: "Kopfschmerzen"),
                const IllnessCard(
                    icon: Icon(Icons.access_alarm_outlined), illness: 'Fieber')
              ],
            ),
          )
        ],
      ),
    );
  }
}
