import 'package:flutter/material.dart';
import 'package:symptomator/backend/disease.dart';
import 'package:symptomator/backend/local_storage_handler.dart';
import 'package:symptomator/backend/user.dart';
import 'package:symptomator/backend/user_entry.dart';
import 'package:symptomator/screens/add_disease_screen.dart';
import 'package:symptomator/styles/text_styles.dart';
import 'package:intl/intl.dart';
import 'package:symptomator/widgets/illness_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.user, required this.newUser})
      : super(key: key);
  final User user;
  final bool newUser;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DateTime today = DateTime.now();
  String dateStringFormatted = DateFormat('dd-MM-yyyy').format(DateTime.now());
  DateTime selectedDate = DateTime.now();
  final LocalStorageHandler _handler = LocalStorageHandler();
  late User _user;

  @override
  void initState() {
    super.initState();
    _user = widget.user;
    // _userDieseases = widget.user.diseases;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Symptomator'),
        centerTitle: true,
        actions: [
          IconButton(
            // TODO: implement graphics!
            onPressed: () {},
            icon: const Icon(Icons.auto_graph),
          ),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // TODO: make the date clickable to add a list for a past date ; use date_pickers_package
          Text('Datum: $dateStringFormatted'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person)),
              Text(
                '${widget.user.name} ${widget.user.surName}',
                textAlign: TextAlign.center,
                style: nameStyle,
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: illnessCards(_user.diseases),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                  // TODO: save entry to local storage
                  onPressed: () => saveEntryToLocalStorage(),
                  icon: const Icon(Icons.save),
                  label: const Text('SAVE')),
              ElevatedButton.icon(
                  onPressed: () => _getDiseasesFromAddDisease(context),
                  icon: const Icon(Icons.add),
                  label: const Text('ADD NEW')),
            ],
          )
        ],
      ),
    );
  }

  List<GestureDetector> illnessCards(List<Disease> diseases) {
    final List<GestureDetector> illnessCards = [];
    for (final Disease disease in diseases) {
      illnessCards.add(GestureDetector(
        // TODO: should maybe show a Dialog with the help of showDialog to ask user if he/she wants to delete item
        onLongPress: () {
          setState(() {
            _user.removeDisease(disease);
            // _userDieseases.remove(disease);
          });
        },
        child: IllnessCard(disease: disease),
      ));
    }
    return illnessCards;
  }

  Future<void> _getDiseasesFromAddDisease(BuildContext context) async {
    final List<Disease> newDiseasesList =
        (await showModalBottomSheet<List<Disease>>(
            isDismissible: false,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            context: context,
            builder: (context) => AddDisease(userDiseases: _user.diseases)))!;
    setState(() {
      _user.diseases = newDiseasesList;
    });
  }

  void saveEntryToLocalStorage() {
    final map = UserEntry.getMapFromIllnessList(_user.diseases);
    final UserEntry entry =
        UserEntry(user: _user, date: selectedDate, diseaseSeverityMap: map);
    _user.addEntry(entry);
    print(_user.allEntries);
  }
}
