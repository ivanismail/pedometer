import 'package:get_storage/get_storage.dart';
import 'package:pedometer_app/app/storage.dart';


bool checkToken() =>
    GetStorage().read(XStorage.weight) != '' &&
    GetStorage().read(XStorage.weight) != null;