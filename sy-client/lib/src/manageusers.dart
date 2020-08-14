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

  Future<void> listAllUsers() async {
    final sendmsg = EmptyParams();
    await for (var replymsg in stub.listAllUsers(sendmsg)) {
      print(replymsg);
    }
  }

  Future<void> setGroup(username, groupname) async {
    final sendmsg = SetGroupParms();
    sendmsg.username = username;
	sendmsg.group = groupname;
    var response = await stub.setGroup(sendmsg);
    print(response);
  }

  Future<void> renameUser(oldusername, newusername) async {
    final sendmsg = RenamedUser();
    sendmsg.oldusername = oldusername;
	sendmsg.newusername = newusername;
    var response = await stub.renameUser(sendmsg);
    print(response);
  }

  Future<void> deleteUser(username) async {
    final sendmsg = WhichUser();
    sendmsg.username = username;
    var response = await stub.deleteUser(sendmsg);
    print(response);
  }

  Future<void> shutdown() async {
    await channel.shutdown();
  }
}
