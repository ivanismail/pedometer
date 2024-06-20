// ignore_for_file: prefer_const_constructors

import 'package:pedometer_app/app/modules/home/controllers/home_controller.dart';

import '../../../export.dart';

class PersonalSettingView extends StatefulWidget {
  const PersonalSettingView({Key? key}) : super(key: key);

  @override
  State<PersonalSettingView> createState() => _PersonalSettingViewState();
}

class _PersonalSettingViewState extends State<PersonalSettingView> {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Setting'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: controller.genderController,
              decoration: InputDecoration(labelText: 'Gender'),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: controller.ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: controller.weightController,
              decoration: InputDecoration(labelText: 'Weight (kg)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: controller.heightController,
              decoration: InputDecoration(labelText: 'Height (cm)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.saveData,
              child: Text('Save & Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
