import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:heart_beat/data/model/bluetooth_model.dart';
import 'package:heart_beat/screens/heart_beat_page_demo.dart/heart_beat_page_demo.dart';

import '../home_controller.dart';

class CountHeartBeatPage extends StatefulWidget {
  const CountHeartBeatPage({Key? key}) : super(key: key);

  @override
  State<CountHeartBeatPage> createState() => _CountHeartBeatPageState();
}

class _CountHeartBeatPageState extends State<CountHeartBeatPage> {
  final controller = Get.find<HomeController>();
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<ScanResult> scanResultList = [];
  bool _isScanning = false;
  List<BlueToothModel> dataDemos = [];

  @override
  void initState() {
    super.initState();
    // initBle();
  }

  // void initBle() {
  //   flutterBlue.isScanning.listen((isScanning) {
  //     _isScanning = isScanning;
  //     setState(() {});
  //   });
  // }

  // scan() async {
  //   if (!_isScanning) {
  //     scanResultList.clear();
  //     flutterBlue.startScan(timeout: const Duration(seconds: 4));
  //     flutterBlue.scanResults.listen((results) {
  //       scanResultList = results;
  //       setState(() {});
  //     });
  //   } else {
  //     flutterBlue.stopScan();
  //   }
  // }

  // Widget deviceSignal(ScanResult r) {
  //   return Text(r.rssi.toString());
  // }

  // Widget deviceMacAddress(ScanResult r) {
  //   return Text(r.device.id.id);
  // }

  // Widget deviceName(ScanResult r) {
  //   String name = '';

  //   if (r.device.name.isNotEmpty) {
  //     name = r.device.name;
  //   } else if (r.advertisementData.localName.isNotEmpty) {
  //     name = r.advertisementData.localName;
  //   } else {
  //     name = 'N/A';
  //   }
  //   return Text(name);
  // }

  Widget leading() {
    return const CircleAvatar(
      backgroundColor: Colors.cyan,
      child: Icon(
        Icons.bluetooth,
        color: Colors.white,
      ),
    );
  }

  // void onTap(ScanResult r) {
  //   print('${r.device.name}');
  // }

  // Widget listItem(ScanResult r) {
  //   return ListTile(
  //     onTap: () => onTap(r),
  //     leading: leading(),
  //     title: deviceName(r),
  //     subtitle: deviceMacAddress(r),
  //     trailing: deviceSignal(r),
  //   );
  // }

  Widget listItemDemo(BlueToothModel model) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HeartBeatPageDemo()),
        );
      },
      leading: leading(),
      title: Text(model.name ?? ""),
      subtitle: Text(model.macAddresss ?? ""),
      trailing: const Icon(Icons.chevron_right),
    );
  }

  void scanDemo() async {
    if (!_isScanning) {
      setState(() {
        _isScanning = true;
      });
      Timer.periodic(Duration(seconds: 2), (timer) {
        if (dataDemos.isEmpty) {
          dataDemos.add(
            BlueToothModel(
              name: "HC-05",
              macAddresss: "98:D3:32:1D:BE:47",
            ),
          );
          dataDemos.add(
            BlueToothModel(
              name: "SAMSUNG-A51",
              macAddresss: "BA:9F:32:1D:CD:47",
            ),
          );
        }
        if (dataDemos.isNotEmpty) {
          timer.cancel();
        }
        setState(() {});
      });
    } else {
      setState(() {
        _isScanning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        title: const Text("Danh sách thiết bị"),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: dataDemos.length,
          itemBuilder: (context, index) {
            return listItemDemo(dataDemos[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scanDemo,
        child: Icon(_isScanning ? Icons.stop : Icons.search),
      ),
    );
  }
}
