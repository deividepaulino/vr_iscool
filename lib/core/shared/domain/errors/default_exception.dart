abstract class VrException implements Exception {
  final String _msg;

  VrException(this._msg);

  String get message => _msg;
}
