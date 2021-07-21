import 'package:flutter/material.dart';

// class IllnessCard extends StatefulWidget {
//   final Icon icon;
//   final String illness;
//   const IllnessCard({Key? key, required this.icon, required this.illness})
//       : super(key: key);

//   @override
//   _IllnessCardState createState() => _IllnessCardState();
// }

// class _IllnessCardState extends State<IllnessCard> {
//   @override
//   Widget build(BuildContext context) {
//     double rating = 0;
//     return Card(
//       child: ListTile(
//         leading: widget.icon,
//         title: Text(widget.illness),
//         trailing: Slider(
//           value: rating,
//           onChanged: (newValue) {
//             setState(() => rating = newValue);
//           },
//           max: 5,
//           divisions: 5,
//         ),
//       ),
//     );
//   }
// }

class IllnessCard extends StatefulWidget {
  final Icon icon;
  final String illness;
  const IllnessCard({Key? key, required this.icon, required this.illness})
      : super(key: key);

  @override
  _IllnessCardState createState() => _IllnessCardState();
}

class _IllnessCardState extends State<IllnessCard> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_final_locals
    double rating = 0;
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(4),
      height: 80,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.icon,
              Text(
                widget.illness,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Slider(
                  value: rating,
                  onChanged: (newValue) {
                    setState(() => rating = newValue);
                  },
                  max: 6,
                  divisions: 6,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
