library idkit_ip;

import 'package:idkit_ip/idkit_ip.dart';
import 'package:idkit_ip/src/ip_config.dart';

// ignore: avoid_void_async
void main() async {
  final String ip1 = await IDKitIp.getIPv4(format: IPFormat.json);
  print(ip1);

  final String ip = await IDKitIp.getIPv4();
  print(ip);

  final String ip2 = await IDKitIp.getIPv6(format: IPFormat.json);
  print(ip2);

  final String ip3 = await IDKitIp.getIPv6();
  print(ip3);
}
