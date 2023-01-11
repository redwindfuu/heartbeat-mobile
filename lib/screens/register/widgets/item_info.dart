import 'package:flutter/material.dart';
import 'package:heart_beat/base/styles/app_color.dart';

class ItemInfo extends StatefulWidget {
  final List<String> listData;
  final String label;
  final ValueChanged<String> valueChanged;

  const ItemInfo({Key? key,
  required this.label,
    required this.listData,
  required this.valueChanged}) : super(key: key);

  @override
  State<ItemInfo> createState() => _ItemInfoState();
}

class _ItemInfoState extends State<ItemInfo> {

  String selected = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
        const SizedBox(height: 16,),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: widget.listData.map((e) => GestureDetector(
            onTap: (){
              setState(() {
                selected = e;
                widget.valueChanged(e);
              });
            },
            child: Row(children: [
              Icon(e == selected ? Icons.radio_button_checked : Icons.radio_button_off, color: AppColor.primaryColor,),
              const SizedBox(width: 8,),
              Text(e, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)
            ],),
          )).toList(),
        )
      ],
    );
  }
}
