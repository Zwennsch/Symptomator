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
  /// the date that gets selected by the user. By default it is set to the actual day
  /// Minute, Second and Millisecond is set to zero.
  DateTime _selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
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
    String _dateStringFormatted =
        DateFormat('dd-MM-yyyy').format(_selectedDate);
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
          GestureDetector(
            onTap: () => pickDate(context),
            child: Text('Datum: $_dateStringFormatted'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TODO: make you select your own avatar from a picture
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

  Future pickDate(BuildContext context) async {
    final initialDate = _selectedDate;
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(DateTime.now().year - 1),
        lastDate: DateTime(DateTime.now().year + 1));
    if (newDate == null) return;
    setState(() {
      _selectedDate = newDate;
    });
  }

  List<GestureDetector> illnessCards(List<Disease> diseases) {
    final List<GestureDetector> illnessCards = [];
    for (final Disease disease in diseases) {
      illnessCards.add(GestureDetector(
        // TODO: should maybe show a Dialog with the help of showDialog to ask user if he/she wants to delete item
        onLongPress: () {
          _showDeleteDialog(context, disease);
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

  void _showDeleteDialog(BuildContext context, Disease disease) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Delete ${disease.name}", textAlign: TextAlign.center),
          content:
              const Text("Do you want to delete this disease from the list?"),
          actions: [
            ElevatedButton(
              onPressed: () {
                _user.removeDisease(disease);
                Navigator.of(context).pop();
                setState(() {});
              },
              child: const Text("OK"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("CANCEL"),
            ),
          ],
        );
      },
    );
  }

  void saveEntryToLocalStorage() {
    // final map = UserEntry.getMapFromIllnessList(_user.diseases);
    print(_user.diseases);
    final UserEntry entry = UserEntry(
        user: _user, date: _selectedDate, diseaseSeverityList: _user.diseases);
    _user.addEntry(entry);
    print(_user.storedEntries);
  }
}
