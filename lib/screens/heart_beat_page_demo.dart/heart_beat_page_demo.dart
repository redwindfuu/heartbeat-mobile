import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:heart_beat/data/local/preference/preference_manager.dart';
import 'package:heart_beat/data/local/preference/preference_manager_impl.dart';
import 'package:heart_beat/data/repository/repository_impl.dart';

class HeartBeatPageDemo extends StatefulWidget {
  const HeartBeatPageDemo({Key? key}) : super(key: key);

  @override
  State<HeartBeatPageDemo> createState() => _HeartBeatPageDemoState();
}

class _HeartBeatPageDemoState extends State<HeartBeatPageDemo> {
  int currentIndex = 0;
  List<int> dataDemos = [];
  Timer? timer;
  bool isCount = true;
  Random random = Random();
  final repo = RepositoryImpl();

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      int min = 65;
      int max = 120;
      int beat = min + random.nextInt(max - min);
      postHeartBeat(beat);
      dataDemos.add(beat);
      setState(() {});
    });
  }

  void postHeartBeat(int beat) async {
    final userId = await PreferenceManagerImpl.instance.getString(PreferenceManager.userId);
    final data = {"userId": userId, "beat": beat};
    await repo.postHeartBeat(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Đếm nhịp tim")),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: dataDemos.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(8),
              child: Center(child: Text('Nhịp tim đo được: ${dataDemos[index]}')),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          timer?.cancel();
          setState(() {
            isCount = false;
          });
        },
        child: Icon(isCount == false ? Icons.play_circle : Icons.stop),
      ),
    );
  }
}
