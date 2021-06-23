import 'package:ping_discover_network_forked/ping_discover_network_forked.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

class NetworkService {
  
}

Future<List<String>> findNetworkPrinter({int port: 9100}) async {
  final String? ip = await WifiInfo().getWifiIP();
  if (ip != null) {
    final String subnet = ip.substring(0, ip.lastIndexOf('.'));

    final stream = NetworkAnalyzer.discover2(subnet, port);
    var results = await stream.toList();
    return [
      ...results.where((entry) => entry.exists).toList().map((e) => e.ip).toList()
    ];
  }
  return <String>[];
}
