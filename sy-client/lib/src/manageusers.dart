import 'dart:math' show Random;

import 'package:grpc/grpc.dart';

//import 'generated/manageusers.pb.dart';
import 'generated/manageusers.pbgrpc.dart';

//import 'generated/messages.pb.dart';
import 'generated/messages.pbgrpc.dart';

class Client {
  ClientChannel channel;
  ManageUsersClient stub;
  MessagesClient messagesStub;

  Client(String url, int port) {
    channel = ClientChannel(url,
        port: port,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));
    stub = ManageUsersClient(channel,
        options: CallOptions(timeout: Duration(seconds: 30)));
    messagesStub = MessagesClient(channel,
        options: CallOptions(timeout: Duration(seconds: 30)));
  }

  Future<void> newMessage(String username, String message, String recipient_username) async {
	  final packet = NewMessageParms();
	  
	  packet.username = username;
	  packet.messageText = message;
	  packet.recipientUsername = recipient_username;

	  var response = await messagesStub.newMessage(packet);

	  print('message sent?\n${response}');
  }

  Future<void> authUser(String username, String pwd) async {
	  final message = AuthParms();
	  
	  message.username = username;
	  message.pwd = pwd;

	  var response = await stub.authUser(message);

	  print('user authorized?\n${response}');
  }

  Future<void> setPassword(String username, String pwd) async {
	  final message = SetPwdParms();
	  
	  message.username = username;
	  message.pwd = pwd;

	  var response = await stub.setPassword(message);

	  print('password set:\n${response}');
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
