import 'dart:developer';

class ApiVariables {
  /////////////
  ///General///
  /////////////
  static const _scheme = 'https';
  static const _host = "doctorsback-end.000webhostapp.com";
  // final _host = '192.168.243.1';
  // final _port = 5000;

  static Uri _mainUri({
    required String path,
    Map<String, String>? params,
  }) {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      path: path,
      queryParameters: params,
    );
    log(uri.toString());
    return uri;
  }

  static Uri _mobileUri({required String path, Map<String, String>? params}) =>
      _mainUri(path: 'api/$path', params: params);

  ///Auth

  static Uri register() => _mobileUri(path: 'register');

  static Uri login() => _mobileUri(path: 'login');

  static Uri sendResetPasswordOTP() => _mobileUri(path: 'password/sendemail');

  static Uri checkPasswordCode() => _mobileUri(path: 'password/checkCode');

  static Uri changePassword() => _mobileUri(path: 'password/changePassword');
}
