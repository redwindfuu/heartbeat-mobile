import 'package:flutter/material.dart';

class ItemUserInfo extends StatelessWidget {
  final String label;
  final String content;
  const ItemUserInfo({Key? key,
  required this.label,
  required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
          const SizedBox(width: 8,),
          Expanded(child: Text(content, style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.end,)),
        ],
      ),
    );
  }
}
