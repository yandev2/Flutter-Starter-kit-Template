//============> error class helper <============\\

class ErrorClass {
  int statusCode;
  String msg;

  ErrorClass({required this.statusCode, required String msg})
    : msg = msg.replaceAll('Exception:', '').trim();
}
