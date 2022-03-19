import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:symptomator/backend/disease.dart';
import 'package:symptomator/my_flutter_app_icons.dart';
import 'package:symptomator/widgets/illness_card.dart';

class AddDisease extends ConsumerWidget {
  final List<Disease> userDiseases;
  final TextEditingController _controller = TextEditingController();
  String _nameOfDisease = '';
  Icon _iconOfDisease = const Icon(Icons.person_add_alt_rounded);
  late List<Disease> _userDiseasesCopy;

  AddDisease({Key? key, required this.userDiseases}) : super(key: key);
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          IllnessCard(disease: Disease(_iconOfDisease, _nameOfDisease)),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.purpleAccent,
            height: 20,
            thickness: 5,
            indent: 2,
            endIndent: 2,
          ),
          TextFormField(
              controller: _controller,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Name Of Disease',
              ),
              onChanged: (name) {
                
              }),
          const SizedBox(height: 10),
          const Text('Select Icon'),
          Expanded(child: Wrap(children: iconsRow())),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    _sendDataToMainScreen(context);
                  },
                  icon: const Icon(Icons.arrow_left_outlined),
                  label: const Text('BACK TO MAIN')),
              ElevatedButton.icon(
                  onPressed: () {
                    _userDiseasesCopy
                        .add(Disease(_iconOfDisease, _nameOfDisease));
                    _showInfo(_nameOfDisease, context);
                    _controller.clear();
                    _resetCard();
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add To List')),
            ],
          )
        ],
      ),
    );
  }

  void _showInfo(String nameOfDisease, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            titlePadding: const EdgeInsets.all(24),
            title: Text(
              '$nameOfDisease \nadded to List of Diseases',
              textAlign: TextAlign.center,
            ),
          );
        });
  }

  void _resetCard() {
    setState(() {
      _nameOfDisease = '';
      _iconOfDisease = const Icon(Icons.person_add_alt_rounded);
    });
  }

  void _sendDataToMainScreen(BuildContext context) {
    // FIXME: cannot dispose controller here because exception gets thrown!
    // _controller.dispose();
    Navigator.pop(context, _userDiseasesCopy);
  }

    static const List<Icon> theIcons = [
      Icon(Icons.ac_unit),
      Icon(Icons.alarm),
      Icon(Icons.accessibility_new),
      Icon(Icons.account_balance_sharp),
      Icon(MyFlutterApp.head_side_cough),
      Icon(MyFlutterApp.temperatire),
      Icon(MyFlutterApp2.head_side_virus)
    ];
  List<IconButton> iconsRow() {
    final List<IconButton> theList = [];
    for (int i = 0; i < theIcons.length; i++) {
      theList.add(IconButton(
          onPressed: () {
            setState(() {
              _iconOfDisease = theIcons[i];
            });
          },
          icon: theIcons[i]));
    }
    return theList;
  }
}


// List<IconButton> icons ={IconButton(onPressed: onPressed, icon: icon)}
