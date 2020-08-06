import 'dart:math' show Random;

import 'package:grpc/grpc.dart';

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

  Future<void> createUser(String username) async {
    final a = CreateUserParams();
    a.username = username;
    var r = await stub.createUser(a);
    print('created user:\n${r}');
  }

  Future<void> createGroup(String name) async {
    final g = CreateGroupParams();
    g.name = name;
    var r = await stub.createGroup(g);
    print('created group:\n${r}');
  }

  Future<void> listAllGroups() async {
    final g = EmptyParams();
    await for (var g in stub.listAllGroups(g)) {
      print(g);
    }
  }

  Future<void> shutdown() async {
    await channel.shutdown();
  }
}
