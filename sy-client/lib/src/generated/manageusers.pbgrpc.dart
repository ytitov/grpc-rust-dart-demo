///
//  Generated code. Do not modify.
//  source: manageusers.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'manageusers.pb.dart' as $0;
export 'manageusers.pb.dart';

class ManageUsersClient extends $grpc.Client {
  static final _$createUser = $grpc.ClientMethod<$0.CreateUserParams, $0.User>(
      '/manageusers.ManageUsers/CreateUser',
      ($0.CreateUserParams value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.User.fromBuffer(value));
  static final _$listUsers = $grpc.ClientMethod<$0.EmptyParams, $0.User>(
      '/manageusers.ManageUsers/ListUsers',
      ($0.EmptyParams value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.User.fromBuffer(value));

  ManageUsersClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.User> createUser($0.CreateUserParams request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createUser, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<$0.User> listUsers($0.EmptyParams request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$listUsers, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }
}

abstract class ManageUsersServiceBase extends $grpc.Service {
  $core.String get $name => 'manageusers.ManageUsers';

  ManageUsersServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateUserParams, $0.User>(
        'CreateUser',
        createUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateUserParams.fromBuffer(value),
        ($0.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EmptyParams, $0.User>(
        'ListUsers',
        listUsers_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.EmptyParams.fromBuffer(value),
        ($0.User value) => value.writeToBuffer()));
  }

  $async.Future<$0.User> createUser_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateUserParams> request) async {
    return createUser(call, await request);
  }

  $async.Stream<$0.User> listUsers_Pre(
      $grpc.ServiceCall call, $async.Future<$0.EmptyParams> request) async* {
    yield* listUsers(call, await request);
  }

  $async.Future<$0.User> createUser(
      $grpc.ServiceCall call, $0.CreateUserParams request);
  $async.Stream<$0.User> listUsers(
      $grpc.ServiceCall call, $0.EmptyParams request);
}
