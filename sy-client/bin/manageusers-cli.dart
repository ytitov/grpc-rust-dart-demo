import 'package:route_guide/src/manageusers.dart';
import 'package:args/args.dart';

// arg example
// https://github.com/dart-lang/args/blob/master/example/test_runner.dart
main(List<String> args) async {
  var mainParser = ArgParser();
  var userAddCmd = mainParser.addCommand('add', ArgParser()
      ..addOption('username', abbr: 'u', help: 'username of the new user')
  );
  var setCmd = mainParser.addCommand('set');
  var listCmd = mainParser.addCommand('list');

  // create a connection
  var c = Client('localhost', 10000);

  try {
    var par = mainParser.parse(args);

    if (par.command != null) {
      switch (par.command.name) {
        case 'add': {
          try {
            var p = userAddCmd.parse(args);
            await c.createUser(p['username']);
          } catch (e) {
            print(e);
            print(userAddCmd.usage);
          }
          break;
        }
        case 'set': {
          print("set command not implemented");
          break;
        }
        case 'list': {
          print("list command not implemented");
          break;
        }
        default: {
          print("Not handled");
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
