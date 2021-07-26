import 'package:flutter/material.dart';
import 'package:symptomator/my_flutter_app_icons.dart';
import 'package:symptomator/styles/text_styles.dart';
import 'package:intl/intl.dart';
import 'package:symptomator/widgets/illness_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.name, required this.surName, required this.newUser})
      : super(key: key);
  final String name;
  final String surName;
  final bool newUser;

  @override
  _MainScreenState createState() => _MainScreenState();
}

// TODO: side should not have any disease when user first opens page
class _MainScreenState extends State<MainScreen> {
  String date = DateFormat('dd-MM-yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Symptomator'),
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
          Text('Datum: $date'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person)),
              Text(
                '${widget.name} ${widget.surName}',
                textAlign: TextAlign.center,
                style: nameStyle,
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: const [
                IllnessCard(
                    illnessIcon: Icon(MyFlutterApp.head_side_cough),
                    illness: "Husten"),
                IllnessCard(
                    illnessIcon: Icon(MyFlutterApp.temperatire),
                    illness: 'Fieber'),
                IllnessCard(
                    illnessIcon: Icon(MyFlutterApp2.head_side_virus),
                    illness: "Kopfschmerzen"),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                  onPressed: () => print('SAVE'),
                  icon: const Icon(Icons.save),
                  label: const Text('SAVE')),
              ElevatedButton.icon(
                  onPressed: () => print('Add Desease'),
                  icon: const Icon(Icons.add),
                  label: const Text('ADD NEW')),
            ],
          )
        ],
      ),
    );
  }
}
