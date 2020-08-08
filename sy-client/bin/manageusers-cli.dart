import 'package:route_guide/src/manageusers.dart';
import 'package:args/args.dart';

// arg example
// https://github.com/dart-lang/args/blob/master/example/test_runner.dart
main(List<String> args) async {
  var mainParser = ArgParser();
  var userAddCmd = mainParser.addCommand('add-user', ArgParser()
      ..addOption('username', abbr: 'u', help: 'username of the new user')
  );
  var groupAddCmd = mainParser.addCommand('add-group', ArgParser()
      ..addOption('name', abbr: 'n', help: 'name of the group')
  );
  var listGroupsCmd = mainParser.addCommand('list-groups');
  var listUsersCmd = mainParser.addCommand('list-users');

  // create a connection
  var c = Client('localhost', 10000);

  try {
    var par = mainParser.parse(args);

    if (par.command != null) {
      switch (par.command.name) {
        case 'add-user': {
          try {
            var p = userAddCmd.parse(args);
            await c.createUser(p['username']);
          } catch (e) {
            print("${e.message}");
          }
          break;
        }
        case 'add-group': {
          try {
            var p = groupAddCmd.parse(args);
            await c.createGroup(p['name']);
          } catch (e) {
            print("${e.toString()}");
          }
          break;
        }
        case 'list-groups': {
          await c.listAllGroups();
          break;
        }
        case 'list-users': {
          await c.listAllUsers();
          break;
        }
        default: {
          print("You must issue one of the commands with the following flags:");
          for (final c in mainParser.commands.keys) {
            print(c);
            print(mainParser.commands[c].usage);
          }
        }
      }
    } else {
      print("ERROR: This only supports commands: ${mainParser.commands.keys}");
      print(mainParser.usage);
    }
  } catch (e) {
    print("You must issue one of the commands with the following flags:");
    for (final c in mainParser.commands.keys) {
      print(c);
      print(mainParser.commands[c].usage);
    }
  }
  await c.shutdown();
}
