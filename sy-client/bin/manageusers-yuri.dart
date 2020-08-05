// Copyright (c) 2017, the gRPC project authors. Please see the AUTHORS file
// for details. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:route_guide/src/manageusers.dart';
import 'package:args/args.dart';

// arg example
// https://github.com/dart-lang/args/blob/master/example/test_runner.dart
main(List<String> args) async {
  var mainParser = ArgParser();
  var userAddCmd = mainParser.addCommand('add');
  var setCmd = mainParser.addCommand('set');
  var listCmd = mainParser.addCommand('list');

  userAddCmd.addOption('username', help: "the username of the new user");

  var par = mainParser.parse(args);

  if (par.command != null) {
    print("Running command: ${par.command.name}");
    switch (par.command.name) {
      case 'add': {
        var p = userAddCmd.parse(args);
        await Client().connect_and_create(p['username']);
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
  }
}
