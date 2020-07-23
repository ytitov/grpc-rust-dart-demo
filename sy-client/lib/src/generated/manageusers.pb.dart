///
//  Generated code. Do not modify.
//  source: manageusers.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'manageusers.pbenum.dart';

export 'manageusers.pbenum.dart';

class CreateUserParams extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateUserParams', package: const $pb.PackageName('manageusers'), createEmptyInstance: create)
    ..aOS(1, 'email')
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
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);
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
    ..aOS(1, 'email')
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
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
}

class ListParams extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ListParams', package: const $pb.PackageName('manageusers'), createEmptyInstance: create)
    ..e<ListSubject>(1, 'subject', $pb.PbFieldType.OE, defaultOrMaker: ListSubject.USERS, valueOf: ListSubject.valueOf, enumValues: ListSubject.values)
    ..hasRequiredFields = false
  ;

  ListParams._() : super();
  factory ListParams() => create();
  factory ListParams.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListParams.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ListParams clone() => ListParams()..mergeFromMessage(this);
  ListParams copyWith(void Function(ListParams) updates) => super.copyWith((message) => updates(message as ListParams));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListParams create() => ListParams._();
  ListParams createEmptyInstance() => create();
  static $pb.PbList<ListParams> createRepeated() => $pb.PbList<ListParams>();
  @$core.pragma('dart2js:noInline')
  static ListParams getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListParams>(create);
  static ListParams _defaultInstance;

  @$pb.TagNumber(1)
  ListSubject get subject => $_getN(0);
  @$pb.TagNumber(1)
  set subject(ListSubject v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSubject() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubject() => clearField(1);
}

