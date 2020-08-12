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
  static final _$createGroup =
      $grpc.ClientMethod<$0.CreateGroupParams, $0.Group>(
          '/manageusers.ManageUsers/CreateGroup',
          ($0.CreateGroupParams value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Group.fromBuffer(value));
  static final _$listAllUsers = $grpc.ClientMethod<$0.EmptyParams, $0.User>(
      '/manageusers.ManageUsers/ListAllUsers',
      ($0.EmptyParams value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.User.fromBuffer(value));
  static final _$listAllGroups = $grpc.ClientMethod<$0.EmptyParams, $0.Group>(
      '/manageusers.ManageUsers/ListAllGroups',
      ($0.EmptyParams value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Group.fromBuffer(value));
  static final _$deleteUser = $grpc.ClientMethod<$0.WhichUser, $0.GenericError>(
      '/manageusers.ManageUsers/DeleteUser',
      ($0.WhichUser value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GenericError.fromBuffer(value));
  static final _$renameUser =
      $grpc.ClientMethod<$0.RenamedUser, $0.GenericError>(
          '/manageusers.ManageUsers/RenameUser',
          ($0.RenamedUser value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.GenericError.fromBuffer(value));

  ManageUsersClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.User> createUser($0.CreateUserParams request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createUser, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Group> createGroup($0.CreateGroupParams request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createGroup, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<$0.User> listAllUsers($0.EmptyParams request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$listAllUsers, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }

  $grpc.ResponseStream<$0.Group> listAllGroups($0.EmptyParams request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$listAllGroups, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }

  $grpc.ResponseFuture<$0.GenericError> deleteUser($0.WhichUser request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$deleteUser, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.GenericError> renameUser($0.RenamedUser request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$renameUser, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
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
    $addMethod($grpc.ServiceMethod<$0.CreateGroupParams, $0.Group>(
        'CreateGroup',
        createGroup_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateGroupParams.fromBuffer(value),
        ($0.Group value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EmptyParams, $0.User>(
        'ListAllUsers',
        listAllUsers_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.EmptyParams.fromBuffer(value),
        ($0.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EmptyParams, $0.Group>(
        'ListAllGroups',
        listAllGroups_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.EmptyParams.fromBuffer(value),
        ($0.Group value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.WhichUser, $0.GenericError>(
        'DeleteUser',
        deleteUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.WhichUser.fromBuffer(value),
        ($0.GenericError value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RenamedUser, $0.GenericError>(
        'RenameUser',
        renameUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RenamedUser.fromBuffer(value),
        ($0.GenericError value) => value.writeToBuffer()));
  }

  $async.Future<$0.User> createUser_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateUserParams> request) async {
    return createUser(call, await request);
  }

  $async.Future<$0.Group> createGroup_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateGroupParams> request) async {
    return createGroup(call, await request);
  }

  $async.Stream<$0.User> listAllUsers_Pre(
      $grpc.ServiceCall call, $async.Future<$0.EmptyParams> request) async* {
    yield* listAllUsers(call, await request);
  }

  $async.Stream<$0.Group> listAllGroups_Pre(
      $grpc.ServiceCall call, $async.Future<$0.EmptyParams> request) async* {
    yield* listAllGroups(call, await request);
  }

  $async.Future<$0.GenericError> deleteUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.WhichUser> request) async {
    return deleteUser(call, await request);
  }

  $async.Future<$0.GenericError> renameUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RenamedUser> request) async {
    return renameUser(call, await request);
  }

  $async.Future<$0.User> createUser(
      $grpc.ServiceCall call, $0.CreateUserParams request);
  $async.Future<$0.Group> createGroup(
      $grpc.ServiceCall call, $0.CreateGroupParams request);
  $async.Stream<$0.User> listAllUsers(
      $grpc.ServiceCall call, $0.EmptyParams request);
  $async.Stream<$0.Group> listAllGroups(
      $grpc.ServiceCall call, $0.EmptyParams request);
  $async.Future<$0.GenericError> deleteUser(
      $grpc.ServiceCall call, $0.WhichUser request);
  $async.Future<$0.GenericError> renameUser(
      $grpc.ServiceCall call, $0.RenamedUser request);
}
