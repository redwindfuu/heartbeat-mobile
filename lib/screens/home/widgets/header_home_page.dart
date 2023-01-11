import 'package:flutter/material.dart';
import 'package:heart_beat/base/styles/app_image.dart';

class HeaderHomePage extends StatefulWidget {
  const HeaderHomePage({Key? key}) : super(key: key);

  @override
  State<HeaderHomePage> createState() => _HeaderHomePageState();
}

class _HeaderHomePageState extends State<HeaderHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Xin chào!', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),),
        const SizedBox(height: 8,),
        Text('Hoàng Anh', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),),
        const SizedBox(height: 16,),
        const Divider(thickness: 4,),
        const SizedBox(height: 16,),
        Text('Thông tin của bạn', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
        const SizedBox(height: 8,),
        Row(
          children: [
            Expanded(child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(image: AssetImage(AppImage.bgOrangeHome))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Số tiền của bạn', style: TextStyle(fontSize: 16, color: Colors.white),),
                  const SizedBox(height: 8,),
                  Text('200.000 VNĐ', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),),
                ],
              ),
            )),
            const SizedBox(width: 16,),
            Expanded(child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(image: AssetImage(AppImage.bgBlueHome))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Số tiền của bạn', style: TextStyle(fontSize: 16, color: Colors.white),),
                  const SizedBox(height: 8,),
                  Text('200.000 VNĐ', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),),
                ],
              ),
            ))
          ],
        )
      ],
    );
  }
}
