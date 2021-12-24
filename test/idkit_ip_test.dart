import 'package:flutter_test/flutter_test.dart';
import 'package:idkit_ip/idkit_ip.dart';

void main() {
  test('Get ip', () async {
    final String ip1 = await IDKitIp.getIPv4(format: IPFormat.json);
    print(ip1);

    final String ip2 = await IDKitIp.getIPv4();
    print(ip2);

    final String ip3 = await IDKitIp.getIPv6(format: IPFormat.json);
    print(ip3);

    final String ip4 = await IDKitIp.getIPv6();
    print(ip4);
  });
}
