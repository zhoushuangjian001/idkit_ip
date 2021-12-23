import 'dart:convert' show utf8;
import 'dart:io' show HttpClient, HttpClientRequest, HttpClientResponse;
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
  static Future<String> _requestUri(Uri uri) async {
    Future<String> result = Future<String>.value('0.0.0.0');
    try {
      final HttpClient httpClient = HttpClient();
      final HttpClientRequest httpClientRequest = await httpClient.getUrl(uri);
      final HttpClientResponse httpClientResponse = await httpClientRequest.close();
      if (httpClientResponse.statusCode == 200) {
        result = httpClientResponse.transform(utf8.decoder).join();
      }
    } catch (e) {
      throw Exception(
          'The address request is abnormal, the parameter:\n Host:${uri.host}\n Path:${uri.path}\n Param:${uri.query} \n\n Error message:\n $e');
    }
    return result;
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
}
