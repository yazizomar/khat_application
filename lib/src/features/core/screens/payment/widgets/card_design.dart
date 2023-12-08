import "package:flutter/material.dart";

class CardDesign extends StatelessWidget {
  final IconData icon;
  final String title;
  final int value;
  final int? groupValue;
  final ValueChanged<int?> onChanged;

  const CardDesign({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: const BorderSide(color: Colors.black)),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: cardContext(icon, title),
    );
  }

  Widget cardContext(IconData icon, String title) {
    return Row(
      children: [
        const SizedBox(
          width: 12,
          height: 60,
        ),
        Icon(
          icon,
          size: 40.0,
        ),
        const SizedBox(width: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Container(),
        ),
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          toggleable: true,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          activeColor: Colors.black,
        ),
      ],
    );
  }
}
