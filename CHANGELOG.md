## 0.0.1

Expansion of obtaining user's public network IP address.
Mainly obtain the two public network addresses of IPv4 and IPv6:

1. Public network IPv4 acquisition method

   ```dart
   Future<String> getIPv4({IPFormat format = IPFormat.text}) -> Future<String>
   ```

2. Public network IPv6 acquisition method

   ```dart
   Future<String> getIPv6({IPFormat format = IPFormat.text}) -> Future<String>
   ```

## 0.0.2

Support for obtaining the public IP address of the package in the Flutter-Web project.
At the same time, the static checking of the code is modified.
