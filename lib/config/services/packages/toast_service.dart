import 'package:schools_map/config/core/exports.dart';
import 'package:fluttertoast/fluttertoast.dart';

FToast fToast = FToast();
bool _isShow = false;

class ToastService {
  static FToast init(BuildContext context) => fToast.init(context);

  static Widget _buildToast(
    String msg,
    Color col,
    //   {
    //   ResponseModel? response,
    // }
  ) {
    return GestureDetector(
      onDoubleTap: () {
        // if (response != null) {
        //   Go.to(Go.err, argument: {'response': response});
        // }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: col,
        ),
        child: Text(
          msg,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ),
    );
  }

  static get soon => Fluttertoast.showToast(
        msg: "Under development!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.orange,
        // webBgColor: Colors.orange,
        textColor: Colors.white,
        fontSize: 16.0,
      );

  static get login => Fluttertoast.showToast(
      msg: "Agza boluň!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      // webBgColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);

  static get wilPop => Fluttertoast.showToast(
      msg: "Çykmak üçin ýene bir gezek basyň!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[200],
      // webBgColor: Colors.grey[200],
      textColor: Colors.black,
      fontSize: 16.0);

  static message(
    String msg,
    bool isOk, {
    Color? col,
    String? webCol,
    // ResponseModel? response,
  }) {
    if (LifecycleManager.lifeState.isResumed && !_isShow) {
      const duration = Duration(seconds: 2);
      _isShow = true;
      if (DeviceService.platform.isWeb) {
        Fluttertoast.showToast(
          msg: msg,
          webBgColor: "linear-gradient(to right, $webCol)",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: col,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        col ??= isOk ? Colors.green : Colors.red;
        webCol ??= isOk ? '#196110, #4fe838' : '#ba0b28, #e83855';
        final toast = _buildToast(
          msg,
          col,
          // response: response,
        );
        fToast.showToast(
          child: toast,
          // isDismissable: true,
          // ignorePointer: true,
        );
      }
      Future.delayed(duration).then((value) => _isShow = false);
    }
    // else {
    //   // Fluttertoast.cancel();
    // }
  }
}
