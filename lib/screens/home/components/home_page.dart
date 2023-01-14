import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_beat/base/styles/app_color.dart';
import 'package:heart_beat/data/model/get_heart_beat_response.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/model/login_response.dart';
import '../home_controller.dart';
import '../widgets/home_page_user_info.dart';

class HomePage extends StatefulWidget {
  final LoginResponse user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.5,
          title: RichText(
            text: TextSpan(
              text: 'Xin chào, ',
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xFF212121)),
              children: <TextSpan>[
                TextSpan(text: widget.user.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              ],
            ),
          )),
      body: Column(
        children: [
          GetBuilder<HomeController>(
            builder: (controller) => controller.isLoading
                ? const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : Expanded(child: _buildContent()),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: HomePageUserInfo(),
          ),
          Container(
            color: const Color.fromARGB(255, 241, 242, 245),
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            height: 70,
            child: const Text(
              'Tổng quát',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 241, 242, 245),
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: _buildOverall(),
          ),
        ],
      ),
    );
  }

  Widget _buildOverall() {
    List<HeartBeat>? data = [];
    if (controller.getHeartBeatResponse?.listHeartBeat != null) {
      data = controller.getHeartBeatResponse?.listHeartBeat;
    }
    return controller.getHeartBeatResponse?.healthInfo == null
        ? Container(
            height: 200,
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            decoration: _buildCard(),
            child: const Text(
              "Dữ liệu còn khá ít chưa đủ để phân tích.",
              style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.w400),
            ),
          )
        : Column(
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 40),
                decoration: _buildCard(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(child: Text("Tình trạng sức khỏe", style: TextStyle(fontSize: 16))),
                        const SizedBox(width: 10),
                        Text(
                          controller.getHeartBeatResponse?.healthInfo?["evaluate"],
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Chi tiết: ",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller.getHeartBeatResponse?.healthInfo?["messages"],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Thống kê nhịp tim",
                style: TextStyle(fontSize: 16, color: Color(0xFF028237), fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              const Divider(color: Color(0xFF028237), thickness: 1),
              const SizedBox(height: 25),
              SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries<HeartBeat, String>>[
                  ColumnSeries<HeartBeat, String>(
                    dataSource: data!,
                    color: const Color(0xFF72CF70),
                    xValueMapper: (HeartBeat heartBeat, index) => index.toString(),
                    yValueMapper: (HeartBeat heartBeat, _) => heartBeat.beat,
                    xAxisName: 'Nhịp tim',
                    yAxisName: 'Lần đo',
                  ),
                ],
              ),
              const SizedBox(height: 25),
            ],
          );
  }

  BoxDecoration _buildCard() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 1),
        ),
      ],
    );
  }
}
