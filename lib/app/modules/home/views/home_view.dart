// ignore_for_file: prefer_const_constructors

import 'package:pedometer_app/app/utils.dart';

import '../../../export.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Get.find<HomeController>();

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    controller.initHome();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedometer App'),
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        initState: (_) {},
        builder: (_) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Steps taken:',
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  ribuan(controller.stepsCount),
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Pedestrian Status',
                  style: TextStyle(fontSize: 30),
                ),
                Icon(
                  controller.statusPedo == 'walking'
                      ? Icons.directions_walk
                      : controller.statusPedo == 'stopped'
                          ? Icons.accessibility_new
                          : Icons.error,
                  size: 100,
                ),
                Center(
                  child: Text(
                    controller.statusPedo,
                    style: controller.statusPedo == 'walking' ||
                            controller.statusPedo == 'stopped'
                        ? TextStyle(fontSize: 30)
                        : TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Distance: ${controller.distance.toStringAsFixed(2)} km',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Calories: ${ribuan(controller.calories.toStringAsFixed(0))} kcal',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
