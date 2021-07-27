
import 'package:flutter/material.dart';
import 'package:symptomator/backend/disease.dart';
import 'package:symptomator/widgets/illness_card.dart';

class AddDisease extends StatefulWidget {
  const AddDisease({Key? key}) : super(key: key);

  @override
  _AddDiseaseState createState() => _AddDiseaseState();
}

class _AddDiseaseState extends State<AddDisease> {
  @override
  Widget build(BuildContext context) {
    String _nameOfDisease = '';
    final Icon _iconOfDisease = Icon(Icons.add);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          IllnessCard(disease: Disease(_iconOfDisease, _nameOfDisease)),
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
          Row(children: []),
        ],
      ),
    );
  }
}

// List<IconButton> icons ={IconButton(onPressed: onPressed, icon: icon)}
