import 'package:flutter/material.dart';

class IllnessCard extends StatefulWidget {
  final Icon illnessIcon;
  final String illness;
  const IllnessCard(
      {Key? key, required this.illnessIcon, required this.illness})
      : super(key: key);

  @override
  _IllnessCardState createState() => _IllnessCardState();
}

class _IllnessCardState extends State<IllnessCard> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_final_locals
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Colors.black38, offset: Offset(5, 5), blurRadius: 10)
          ]),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(4),
      height: 80,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.illnessIcon,
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.illness,
                style: const TextStyle(fontSize: 20),
              ),
              Expanded(
                  child: Text(
                // TODO : Find a better word for 'Schwere'
                '${rating.toInt()}',
                textAlign: TextAlign.end,
                style: const TextStyle(fontSize: 20),
              )),
            ],
          ),
          Expanded(
            child: Slider(
              value: rating,
              onChanged: (newValue) {
                setState(() {
                  rating = newValue;
                  // print(rating);
                });
              },
              max: 6,
              divisions: 6,
            ),
          )
        ],
      ),
    );
  }
}
