import 'package:fluttertoast/fluttertoast.dart';
import 'package:sql_demo/component/color_cmp.dart';

toastMessage({required String message}) async {
  await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorCmp.black,
      textColor: colorCmp.colorf3f3f3,
      fontSize: 16.0);
}
