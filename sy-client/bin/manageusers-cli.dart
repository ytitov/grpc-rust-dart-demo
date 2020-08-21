import 'package:route_guide/src/manageusers.dart';
import 'package:args/args.dart';

// arg example
// https://github.com/dart-lang/args/blob/master/example/test_runner.dart
main(List<String> args) async {
  var mainParser = ArgParser();
  var userSetGroupCmd = mainParser.addCommand('set-group', ArgParser()
      ..addOption('username', abbr: 'u', help: 'username of the existing user to assign to group')
      ..addOption('groupname', abbr: 'g', help: 'group to assign to user')
  );
  var userRenameCmd = mainParser.addCommand('rename-user', ArgParser()
      ..addOption('oldusername', abbr: 'u', help: 'username of the existing user, use with -n newname')
      ..addOption('newusername', abbr: 'n', help: 'username to change to, use with -u oldname')
  );
  var userAddCmd = mainParser.addCommand('add-user', ArgParser()
      ..addOption('username', abbr: 'u', help: 'username of the new user')
  );
  var userDelCmd = mainParser.addCommand('delete-user', ArgParser()
      ..addOption('username', abbr: 'u', help: 'username of the user to delete')
  );
  var groupAddCmd = mainParser.addCommand('add-group', ArgParser()
      ..addOption('name', abbr: 'n', help: 'name of the group')
  );
  var setPwdCmd = mainParser.addCommand('set-pwd', ArgParser()
      ..addOption('username', abbr: 'u', help: 'username, use with -p newpwd')
      ..addOption('pwd', abbr: 'p', help: 'password, use with -u username')
  );
  var authUserCmd = mainParser.addCommand('auth-user', ArgParser()
      ..addOption('username', abbr: 'u', help: 'username, use with -p pwd')
      ..addOption('pwd', abbr: 'p', help: 'password, use with -u username')
  );
  var listGroupsCmd = mainParser.addCommand('list-groups');
  var listUsersCmd = mainParser.addCommand('list-users');

  // create a connection
  var c = Client('localhost', 10000);

  try {
    var par = mainParser.parse(args);

    if (par.command != null) {
      switch (par.command.name) {
		case 'auth-user': {
			try {
				var parms = authUserCmd.parse(args);
				await c.authUser(parms['username'], parms['pwd']);
			} catch (e) {
				print("${e.message}");
			}
			break;
		}
		case 'set-pwd': {
			try {
				var parms = setPwdCmd.parse(args);
				await c.setPassword(parms['username'], parms['pwd']);
			} catch (e) {
				print("${e.message}");
			}
			break;
		}
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
        case 'delete-user': {
          try {
            var p = userDelCmd.parse(args);
            await c.deleteUser(p['username']);
          } catch (e) {
            print("${e.message}");
          }
          break;
        }
        case 'set-group': {
          try {
            var p = userSetGroupCmd.parse(args);
            await c.setGroup(p['username'], p['groupname']);
          } catch (e) {
            print("${e.message}");
          }
          break;
        }
        case 'rename-user': {
          try {
            var p = userRenameCmd.parse(args);
			// parser will throw and error if oldusername or newusername are not set
            await c.renameUser(p['oldusername'], p['newusername']);
          } catch (e) {
            print("${e.message}");
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
