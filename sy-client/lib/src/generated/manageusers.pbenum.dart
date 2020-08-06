///
//  Generated code. Do not modify.
//  source: manageusers.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ListAllSubject extends $pb.ProtobufEnum {
  static const ListAllSubject USERS = ListAllSubject._(0, 'USERS');
  static const ListAllSubject GROUPS = ListAllSubject._(1, 'GROUPS');
  static const ListAllSubject USER_GROUPS = ListAllSubject._(2, 'USER_GROUPS');

  static const $core.List<ListAllSubject> values = <ListAllSubject> [
    USERS,
    GROUPS,
    USER_GROUPS,
  ];

  static final $core.Map<$core.int, ListAllSubject> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ListAllSubject valueOf($core.int value) => _byValue[value];

  const ListAllSubject._($core.int v, $core.String n) : super(v, n);
}

