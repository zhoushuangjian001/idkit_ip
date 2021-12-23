# idkit_ip

This package is mainly used to obtain the user's public network IP address for convenient expansion, mainly to obtain two public network addresses, IPv4 and IPv6.

#### IPv4 user public network address acquisition

```dart
String ip1 = await IDKitIp.getIPv4(format: IPFormat.json);
print(ip1); // {'ip':'204.2.250.22'}

String ip = await IDKitIp.getIPv4();
print(ip); // 204.2.250.22
```

#### IPv6 user public network address acquisition

```dart
String ip2 = await IDKitIp.getIPv6(format: IPFormat.json);
print(ip2); // {'ip':'204.2.250.22'}

String ip3 = await IDKitIp.getIPv6();
print(ip3); // 204.2.250.22
```

#### Important tip

For a complete use case, please see the `example` project.
