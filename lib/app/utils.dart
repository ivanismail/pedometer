import 'package:get_storage/get_storage.dart';
import 'package:pedometer_app/app/storage.dart';

bool checkToken() =>
    GetStorage().read(XStorage.weight) != '' &&
    GetStorage().read(XStorage.weight) != null;

/// Convert value to "XX.XXX.XXX" as [String]
String ribuan(value, {String separator = '.', String trailing = ''}) {
  return value.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}$separator') +
      trailing;
}
