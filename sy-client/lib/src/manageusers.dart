import 'dart:math' show Random;

import 'package:grpc/grpc.dart';

import 'common.dart';
import 'generated/manageusers.pb.dart';
import 'generated/manageusers.pbgrpc.dart';

class Client {
  ClientChannel channel;
  ManageUsersClient stub;

  Future<void> main(List<String> args) async {
    channel = ClientChannel('localhost',
        port: 10000,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));
    stub = ManageUsersClient(channel,
        options: CallOptions(timeout: Duration(seconds: 30)));
    // Run all of the demos in order.
    try {
      await runCreateUser();
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();
  }

  /// Run the getFeature demo. Calls getFeature with a point known to have a
  /// feature and a point known not to have a feature.
  Future<void> runCreateUser() async {
    final a = CreateUserParams();
    var r = await stub.createUser(a);
    print('${r}');
  }

}
