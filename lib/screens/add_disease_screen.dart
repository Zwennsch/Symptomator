import 'package:flutter/material.dart';
import 'package:symptomator/backend/disease.dart';
import 'package:symptomator/my_flutter_app_icons.dart';
import 'package:symptomator/widgets/illness_card.dart';

class AddDisease extends StatefulWidget {
  final List<Disease> userDiseases;
  const AddDisease({Key? key, required this.userDiseases}) : super(key: key);

  @override
  _AddDiseaseState createState() => _AddDiseaseState();
}

class _AddDiseaseState extends State<AddDisease> {
  final TextEditingController _controller = TextEditingController();
  String _nameOfDisease = '';
  Icon _iconOfDisease = const Icon(Icons.person_add_alt_rounded);
  late List<Disease> _userDiseases;

  @override
  void initState() {
    super.initState();
    _userDiseases = widget.userDiseases;
  }

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
                setState(() {
                  _nameOfDisease = name;
                });
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
                  // TODO: show small message that disease was added
                  onPressed: () {
                    _userDiseases.add(Disease(_iconOfDisease, _nameOfDisease));
                    
                    final SnackBar snackBar = SnackBar(
                        content: Text('$_nameOfDisease was added to the list'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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

  void _resetCard() {
    setState(() {
      _nameOfDisease = '';
      _iconOfDisease = const Icon(Icons.person_add_alt_rounded);
    });
  }

  void _sendDataToMainScreen(BuildContext context) {
    // FIXME: cannot dispose controller here because exception gets thrown!
    // _controller.dispose();
    Navigator.pop(context, _userDiseases);
  }

  List<IconButton> iconsRow() {
    const List<Icon> theIcons = [
      Icon(Icons.ac_unit),
      Icon(Icons.alarm),
      Icon(Icons.accessibility_new),
      Icon(Icons.account_balance_sharp),
      Icon(MyFlutterApp.head_side_cough),
      Icon(MyFlutterApp.temperatire),
      Icon(MyFlutterApp2.head_side_virus)
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
