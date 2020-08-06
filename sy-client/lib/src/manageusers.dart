import 'dart:math' show Random;

import 'package:grpc/grpc.dart';

import 'common.dart';
import 'generated/manageusers.pb.dart';
import 'generated/manageusers.pbgrpc.dart';

class Client {
  ClientChannel channel;
  ManageUsersClient stub;

  Client(String url, int port) {
    channel = ClientChannel(url,
        port: port,
        options:
        const ChannelOptions(credentials: ChannelCredentials.insecure()));
    stub = ManageUsersClient(channel,
        options: CallOptions(timeout: Duration(seconds: 30)));
  }

  Future<void> createUser(String email) async {
    final a = CreateUserParams();
    a.email = email;
    var r = await stub.createUser(a);
    print('created user:\n${r}');
  }

  Future<void> shutdown() async {
    await channel.shutdown();
  }
}
