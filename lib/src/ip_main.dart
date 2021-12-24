import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:idkit_ip/src/ip_config.dart';

class IDKitIp {
  /// Get user's public network IPv4
  static Future<String> getIPv4({IPFormat format = IPFormat.text}) {
    final Uri uri = Uri(
      scheme: scheme,
      host: host,
      query: _getResponseType(format),
    );
    return _requestUri(uri);
  }

  /// Get user's public network IPv4
  static Future<String> getIPv6({IPFormat format = IPFormat.text}) {
    final Uri uri = Uri(
      scheme: scheme,
      host: v6Host,
      query: _getResponseType(format),
    );
    return _requestUri(uri);
  }

  /// Make a network request
  static Future<String> _requestUri(Uri uri) {
    final Completer<String> completer = Completer<String>();
    try {
      http.get(uri).then((http.Response result) {
        if (result.statusCode == 200) {
          final String ip = result.body;
          completer.complete(ip);
        } else {
          completer.complete('0.0.0.0');
        }
      }).catchError((Object e) {
        completer.completeError(e);
      });
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }

  /// Network request response format
  static String _getResponseType(IPFormat format) {
    String result;
    switch (format) {
      case IPFormat.json:
        result = 'format=json';
        break;
      default:
        result = '';
    }
    return result;
  }

  /// Function description of this class.
  String getDesc() {
    return "Convenient extension of obtaining user's public network IP address, including IPv4 and IPv6.";
  }
}
