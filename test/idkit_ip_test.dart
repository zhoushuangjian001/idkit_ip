library idkit_ip;

import 'package:idkit_ip/idkit_ip.dart';
import 'package:idkit_ip/src/ip_config.dart';

void main() async {
  String ip1 = await IDKitIp.getIPv4(format: IPFormat.json);
  print(ip1);

  String ip = await IDKitIp.getIPv4();
  print(ip);

  String ip2 = await IDKitIp.getIPv6(format: IPFormat.json);
  print(ip2);

  String ip3 = await IDKitIp.getIPv6();
  print(ip3);
}
