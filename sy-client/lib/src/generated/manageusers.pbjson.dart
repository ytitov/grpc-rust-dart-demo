///
//  Generated code. Do not modify.
//  source: manageusers.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const ListAllSubject$json = const {
  '1': 'ListAllSubject',
  '2': const [
    const {'1': 'USERS', '2': 0},
    const {'1': 'GROUPS', '2': 1},
    const {'1': 'USER_GROUPS', '2': 2},
  ],
};

const SetGroupParms$json = const {
  '1': 'SetGroupParms',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'group', '3': 2, '4': 1, '5': 9, '10': 'group'},
  ],
};

const CreateUserParams$json = const {
  '1': 'CreateUserParams',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
  ],
};

const CreateGroupParams$json = const {
  '1': 'CreateGroupParams',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

const EmptyParams$json = const {
  '1': 'EmptyParams',
};

const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
  ],
};

const Group$json = const {
  '1': 'Group',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

const WhichUser$json = const {
  '1': 'WhichUser',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
  ],
};

const GenericError$json = const {
  '1': 'GenericError',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

const RenamedUser$json = const {
  '1': 'RenamedUser',
  '2': const [
    const {'1': 'oldusername', '3': 1, '4': 1, '5': 9, '10': 'oldusername'},
    const {'1': 'newusername', '3': 2, '4': 1, '5': 9, '10': 'newusername'},
  ],
};

