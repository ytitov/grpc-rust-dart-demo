///
//  Generated code. Do not modify.
//  source: manageusers.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'manageusers.pbenum.dart';

class CreateUserParams extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateUserParams', package: const $pb.PackageName('manageusers'), createEmptyInstance: create)
    ..aOS(1, 'username')
    ..hasRequiredFields = false
  ;

  CreateUserParams._() : super();
  factory CreateUserParams() => create();
  factory CreateUserParams.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateUserParams.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateUserParams clone() => CreateUserParams()..mergeFromMessage(this);
  CreateUserParams copyWith(void Function(CreateUserParams) updates) => super.copyWith((message) => updates(message as CreateUserParams));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateUserParams create() => CreateUserParams._();
  CreateUserParams createEmptyInstance() => create();
  static $pb.PbList<CreateUserParams> createRepeated() => $pb.PbList<CreateUserParams>();
  @$core.pragma('dart2js:noInline')
  static CreateUserParams getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateUserParams>(create);
  static CreateUserParams _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);
}

class CreateGroupParams extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateGroupParams', package: const $pb.PackageName('manageusers'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..hasRequiredFields = false
  ;

  CreateGroupParams._() : super();
  factory CreateGroupParams() => create();
  factory CreateGroupParams.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateGroupParams.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateGroupParams clone() => CreateGroupParams()..mergeFromMessage(this);
  CreateGroupParams copyWith(void Function(CreateGroupParams) updates) => super.copyWith((message) => updates(message as CreateGroupParams));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateGroupParams create() => CreateGroupParams._();
  CreateGroupParams createEmptyInstance() => create();
  static $pb.PbList<CreateGroupParams> createRepeated() => $pb.PbList<CreateGroupParams>();
  @$core.pragma('dart2js:noInline')
  static CreateGroupParams getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateGroupParams>(create);
  static CreateGroupParams _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class EmptyParams extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('EmptyParams', package: const $pb.PackageName('manageusers'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  EmptyParams._() : super();
  factory EmptyParams() => create();
  factory EmptyParams.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmptyParams.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  EmptyParams clone() => EmptyParams()..mergeFromMessage(this);
  EmptyParams copyWith(void Function(EmptyParams) updates) => super.copyWith((message) => updates(message as EmptyParams));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmptyParams create() => EmptyParams._();
  EmptyParams createEmptyInstance() => create();
  static $pb.PbList<EmptyParams> createRepeated() => $pb.PbList<EmptyParams>();
  @$core.pragma('dart2js:noInline')
  static EmptyParams getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmptyParams>(create);
  static EmptyParams _defaultInstance;
}

class User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('User', package: const $pb.PackageName('manageusers'), createEmptyInstance: create)
    ..aOS(1, 'username')
    ..aOS(2, 'id')
    ..hasRequiredFields = false
  ;

  User._() : super();
  factory User() => create();
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  User clone() => User()..mergeFromMessage(this);
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
}

class Group extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Group', package: const $pb.PackageName('manageusers'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aOS(2, 'name')
    ..hasRequiredFields = false
  ;

  Group._() : super();
  factory Group() => create();
  factory Group.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Group.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Group clone() => Group()..mergeFromMessage(this);
  Group copyWith(void Function(Group) updates) => super.copyWith((message) => updates(message as Group));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Group create() => Group._();
  Group createEmptyInstance() => create();
  static $pb.PbList<Group> createRepeated() => $pb.PbList<Group>();
  @$core.pragma('dart2js:noInline')
  static Group getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Group>(create);
  static Group _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class WhichUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('WhichUser', package: const $pb.PackageName('manageusers'), createEmptyInstance: create)
    ..aOS(1, 'username')
    ..hasRequiredFields = false
  ;

  WhichUser._() : super();
  factory WhichUser() => create();
  factory WhichUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WhichUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  WhichUser clone() => WhichUser()..mergeFromMessage(this);
  WhichUser copyWith(void Function(WhichUser) updates) => super.copyWith((message) => updates(message as WhichUser));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WhichUser create() => WhichUser._();
  WhichUser createEmptyInstance() => create();
  static $pb.PbList<WhichUser> createRepeated() => $pb.PbList<WhichUser>();
  @$core.pragma('dart2js:noInline')
  static WhichUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WhichUser>(create);
  static WhichUser _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);
}

class GenericError extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GenericError', package: const $pb.PackageName('manageusers'), createEmptyInstance: create)
    ..aOB(1, 'success')
    ..aOS(2, 'message')
    ..hasRequiredFields = false
  ;

  GenericError._() : super();
  factory GenericError() => create();
  factory GenericError.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenericError.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GenericError clone() => GenericError()..mergeFromMessage(this);
  GenericError copyWith(void Function(GenericError) updates) => super.copyWith((message) => updates(message as GenericError));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GenericError create() => GenericError._();
  GenericError createEmptyInstance() => create();
  static $pb.PbList<GenericError> createRepeated() => $pb.PbList<GenericError>();
  @$core.pragma('dart2js:noInline')
  static GenericError getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenericError>(create);
  static GenericError _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class RenamedUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RenamedUser', package: const $pb.PackageName('manageusers'), createEmptyInstance: create)
    ..aOS(1, 'oldusername')
    ..aOS(2, 'newusername')
    ..hasRequiredFields = false
  ;

  RenamedUser._() : super();
  factory RenamedUser() => create();
  factory RenamedUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RenamedUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RenamedUser clone() => RenamedUser()..mergeFromMessage(this);
  RenamedUser copyWith(void Function(RenamedUser) updates) => super.copyWith((message) => updates(message as RenamedUser));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RenamedUser create() => RenamedUser._();
  RenamedUser createEmptyInstance() => create();
  static $pb.PbList<RenamedUser> createRepeated() => $pb.PbList<RenamedUser>();
  @$core.pragma('dart2js:noInline')
  static RenamedUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RenamedUser>(create);
  static RenamedUser _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get oldusername => $_getSZ(0);
  @$pb.TagNumber(1)
  set oldusername($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOldusername() => $_has(0);
  @$pb.TagNumber(1)
  void clearOldusername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get newusername => $_getSZ(1);
  @$pb.TagNumber(2)
  set newusername($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNewusername() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewusername() => clearField(2);
}

