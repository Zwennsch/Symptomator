import 'package:flutter/material.dart';
import 'package:symptomator/backend/disease.dart';
import 'package:symptomator/widgets/illness_card.dart';

class AddDisease extends StatefulWidget {
  const AddDisease({Key? key}) : super(key: key);

  @override
  _AddDiseaseState createState() => _AddDiseaseState();
}

class _AddDiseaseState extends State<AddDisease> {
  String _nameOfDisease = '';
  Icon _iconOfDisease = const Icon(Icons.person_add_alt_rounded);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          IllnessCard(disease: Disease(_iconOfDisease, _nameOfDisease)),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.black54,
            height: 20,
            thickness: 5,
            indent: 2,
            endIndent: 2,
          ),
          TextFormField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Name Of Disease',
              ),
              onChanged: (name) {
                setState(() {
                  _nameOfDisease = name;
                });
              }),
          const SizedBox(height: 10),
          const Text('Select Disease-Icon'),
          Expanded(child: Wrap(children: iconsRow())),
          // const Divider(
          //   color: Colors.black54,
          //   height: 10,
          //   thickness: 2,
          //   indent: 2,
          //   endIndent: 2,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton.icon(
                  onPressed: () => print('back to main_screen'),
                  icon: const Icon(Icons.add),
                  label: const Text('Add To List')),
            ],
          )
        ],
      ),
    );
  }

  List<IconButton> iconsRow() {
    const List<Icon> theIcons = [
      Icon(Icons.ac_unit),
      Icon(Icons.alarm),
      Icon(Icons.accessibility_new),
      Icon(Icons.account_balance_sharp)
    ];
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
