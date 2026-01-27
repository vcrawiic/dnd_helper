import '../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Query$Classes {
  factory Variables$Query$Classes({Input$ClassOrder? order}) =>
      Variables$Query$Classes._({if (order != null) r'order': order});

  Variables$Query$Classes._(this._$data);

  factory Variables$Query$Classes.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('order')) {
      final l$order = data['order'];
      result$data['order'] = l$order == null
          ? null
          : Input$ClassOrder.fromJson((l$order as Map<String, dynamic>));
    }
    return Variables$Query$Classes._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$ClassOrder? get order => (_$data['order'] as Input$ClassOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('order')) {
      final l$order = order;
      result$data['order'] = l$order?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Query$Classes<Variables$Query$Classes> get copyWith =>
      CopyWith$Variables$Query$Classes(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$Classes || runtimeType != other.runtimeType) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (_$data.containsKey('order') != other._$data.containsKey('order')) {
      return false;
    }
    if (l$order != lOther$order) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$order = order;
    return Object.hashAll([_$data.containsKey('order') ? l$order : const {}]);
  }
}

abstract class CopyWith$Variables$Query$Classes<TRes> {
  factory CopyWith$Variables$Query$Classes(
    Variables$Query$Classes instance,
    TRes Function(Variables$Query$Classes) then,
  ) = _CopyWithImpl$Variables$Query$Classes;

  factory CopyWith$Variables$Query$Classes.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Classes;

  TRes call({Input$ClassOrder? order});
}

class _CopyWithImpl$Variables$Query$Classes<TRes>
    implements CopyWith$Variables$Query$Classes<TRes> {
  _CopyWithImpl$Variables$Query$Classes(this._instance, this._then);

  final Variables$Query$Classes _instance;

  final TRes Function(Variables$Query$Classes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? order = _undefined}) => _then(
    Variables$Query$Classes._({
      ..._instance._$data,
      if (order != _undefined) 'order': (order as Input$ClassOrder?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$Classes<TRes>
    implements CopyWith$Variables$Query$Classes<TRes> {
  _CopyWithStubImpl$Variables$Query$Classes(this._res);

  TRes _res;

  call({Input$ClassOrder? order}) => _res;
}

class Query$Classes {
  Query$Classes({required this.classes, this.$__typename = 'Query'});

  factory Query$Classes.fromJson(Map<String, dynamic> json) {
    final l$classes = json['classes'];
    final l$$__typename = json['__typename'];
    return Query$Classes(
      classes: (l$classes as List<dynamic>)
          .map(
            (e) => Query$Classes$classes.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$Classes$classes> classes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$classes = classes;
    _resultData['classes'] = l$classes.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$classes = classes;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$classes.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Classes || runtimeType != other.runtimeType) {
      return false;
    }
    final l$classes = classes;
    final lOther$classes = other.classes;
    if (l$classes.length != lOther$classes.length) {
      return false;
    }
    for (int i = 0; i < l$classes.length; i++) {
      final l$classes$entry = l$classes[i];
      final lOther$classes$entry = lOther$classes[i];
      if (l$classes$entry != lOther$classes$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Classes on Query$Classes {
  CopyWith$Query$Classes<Query$Classes> get copyWith =>
      CopyWith$Query$Classes(this, (i) => i);
}

abstract class CopyWith$Query$Classes<TRes> {
  factory CopyWith$Query$Classes(
    Query$Classes instance,
    TRes Function(Query$Classes) then,
  ) = _CopyWithImpl$Query$Classes;

  factory CopyWith$Query$Classes.stub(TRes res) =
      _CopyWithStubImpl$Query$Classes;

  TRes call({List<Query$Classes$classes>? classes, String? $__typename});
  TRes classes(
    Iterable<Query$Classes$classes> Function(
      Iterable<CopyWith$Query$Classes$classes<Query$Classes$classes>>,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$Classes<TRes>
    implements CopyWith$Query$Classes<TRes> {
  _CopyWithImpl$Query$Classes(this._instance, this._then);

  final Query$Classes _instance;

  final TRes Function(Query$Classes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? classes = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$Classes(
          classes: classes == _undefined || classes == null
              ? _instance.classes
              : (classes as List<Query$Classes$classes>),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes classes(
    Iterable<Query$Classes$classes> Function(
      Iterable<CopyWith$Query$Classes$classes<Query$Classes$classes>>,
    )
    _fn,
  ) => call(
    classes: _fn(
      _instance.classes.map((e) => CopyWith$Query$Classes$classes(e, (i) => i)),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$Classes<TRes>
    implements CopyWith$Query$Classes<TRes> {
  _CopyWithStubImpl$Query$Classes(this._res);

  TRes _res;

  call({List<Query$Classes$classes>? classes, String? $__typename}) => _res;

  classes(_fn) => _res;
}

const documentNodeQueryClasses = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Classes'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'order')),
          type: NamedTypeNode(
            name: NameNode(value: 'ClassOrder'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'classes'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'order'),
                value: VariableNode(name: NameNode(value: 'order')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'proficiencies'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: 'saving_throws'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'full_name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'desc'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'skills'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'name'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: '__typename'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                          ],
                        ),
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: 'spellcasting'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'info'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'name'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'desc'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: '__typename'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                          ],
                        ),
                      ),
                      FieldNode(
                        name: NameNode(value: 'level'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'spellcasting_ability'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'name'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'skills'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(
                                selections: [
                                  FieldNode(
                                    name: NameNode(value: 'name'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'desc'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'ability_score'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: SelectionSetNode(
                                      selections: [
                                        FieldNode(
                                          name: NameNode(value: 'name'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null,
                                        ),
                                        FieldNode(
                                          name: NameNode(value: 'desc'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null,
                                        ),
                                        FieldNode(
                                          name: NameNode(value: 'skills'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: SelectionSetNode(
                                            selections: [
                                              FieldNode(
                                                name: NameNode(value: 'name'),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: null,
                                              ),
                                              FieldNode(
                                                name: NameNode(value: 'desc'),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: null,
                                              ),
                                              FieldNode(
                                                name: NameNode(
                                                  value: '__typename',
                                                ),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: null,
                                              ),
                                            ],
                                          ),
                                        ),
                                        FieldNode(
                                          name: NameNode(value: '__typename'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null,
                                        ),
                                      ],
                                    ),
                                  ),
                                  FieldNode(
                                    name: NameNode(value: '__typename'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                ],
                              ),
                            ),
                            FieldNode(
                              name: NameNode(value: '__typename'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                          ],
                        ),
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);

class Query$Classes$classes {
  Query$Classes$classes({
    required this.name,
    this.proficiencies,
    this.saving_throws,
    this.spellcasting,
    this.$__typename = 'Class',
  });

  factory Query$Classes$classes.fromJson(Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$proficiencies = json['proficiencies'];
    final l$saving_throws = json['saving_throws'];
    final l$spellcasting = json['spellcasting'];
    final l$$__typename = json['__typename'];
    return Query$Classes$classes(
      name: (l$name as String),
      proficiencies: (l$proficiencies as List<dynamic>?)
          ?.map(
            (e) => Query$Classes$classes$proficiencies.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      saving_throws: (l$saving_throws as List<dynamic>?)
          ?.map(
            (e) => Query$Classes$classes$saving_throws.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      spellcasting: l$spellcasting == null
          ? null
          : Query$Classes$classes$spellcasting.fromJson(
              (l$spellcasting as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final List<Query$Classes$classes$proficiencies>? proficiencies;

  final List<Query$Classes$classes$saving_throws>? saving_throws;

  final Query$Classes$classes$spellcasting? spellcasting;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$proficiencies = proficiencies;
    _resultData['proficiencies'] = l$proficiencies
        ?.map((e) => e.toJson())
        .toList();
    final l$saving_throws = saving_throws;
    _resultData['saving_throws'] = l$saving_throws
        ?.map((e) => e.toJson())
        .toList();
    final l$spellcasting = spellcasting;
    _resultData['spellcasting'] = l$spellcasting?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$proficiencies = proficiencies;
    final l$saving_throws = saving_throws;
    final l$spellcasting = spellcasting;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$proficiencies == null
          ? null
          : Object.hashAll(l$proficiencies.map((v) => v)),
      l$saving_throws == null
          ? null
          : Object.hashAll(l$saving_throws.map((v) => v)),
      l$spellcasting,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Classes$classes || runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$proficiencies = proficiencies;
    final lOther$proficiencies = other.proficiencies;
    if (l$proficiencies != null && lOther$proficiencies != null) {
      if (l$proficiencies.length != lOther$proficiencies.length) {
        return false;
      }
      for (int i = 0; i < l$proficiencies.length; i++) {
        final l$proficiencies$entry = l$proficiencies[i];
        final lOther$proficiencies$entry = lOther$proficiencies[i];
        if (l$proficiencies$entry != lOther$proficiencies$entry) {
          return false;
        }
      }
    } else if (l$proficiencies != lOther$proficiencies) {
      return false;
    }
    final l$saving_throws = saving_throws;
    final lOther$saving_throws = other.saving_throws;
    if (l$saving_throws != null && lOther$saving_throws != null) {
      if (l$saving_throws.length != lOther$saving_throws.length) {
        return false;
      }
      for (int i = 0; i < l$saving_throws.length; i++) {
        final l$saving_throws$entry = l$saving_throws[i];
        final lOther$saving_throws$entry = lOther$saving_throws[i];
        if (l$saving_throws$entry != lOther$saving_throws$entry) {
          return false;
        }
      }
    } else if (l$saving_throws != lOther$saving_throws) {
      return false;
    }
    final l$spellcasting = spellcasting;
    final lOther$spellcasting = other.spellcasting;
    if (l$spellcasting != lOther$spellcasting) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Classes$classes on Query$Classes$classes {
  CopyWith$Query$Classes$classes<Query$Classes$classes> get copyWith =>
      CopyWith$Query$Classes$classes(this, (i) => i);
}

abstract class CopyWith$Query$Classes$classes<TRes> {
  factory CopyWith$Query$Classes$classes(
    Query$Classes$classes instance,
    TRes Function(Query$Classes$classes) then,
  ) = _CopyWithImpl$Query$Classes$classes;

  factory CopyWith$Query$Classes$classes.stub(TRes res) =
      _CopyWithStubImpl$Query$Classes$classes;

  TRes call({
    String? name,
    List<Query$Classes$classes$proficiencies>? proficiencies,
    List<Query$Classes$classes$saving_throws>? saving_throws,
    Query$Classes$classes$spellcasting? spellcasting,
    String? $__typename,
  });
  TRes proficiencies(
    Iterable<Query$Classes$classes$proficiencies>? Function(
      Iterable<
        CopyWith$Query$Classes$classes$proficiencies<
          Query$Classes$classes$proficiencies
        >
      >?,
    )
    _fn,
  );
  TRes saving_throws(
    Iterable<Query$Classes$classes$saving_throws>? Function(
      Iterable<
        CopyWith$Query$Classes$classes$saving_throws<
          Query$Classes$classes$saving_throws
        >
      >?,
    )
    _fn,
  );
  CopyWith$Query$Classes$classes$spellcasting<TRes> get spellcasting;
}

class _CopyWithImpl$Query$Classes$classes<TRes>
    implements CopyWith$Query$Classes$classes<TRes> {
  _CopyWithImpl$Query$Classes$classes(this._instance, this._then);

  final Query$Classes$classes _instance;

  final TRes Function(Query$Classes$classes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? proficiencies = _undefined,
    Object? saving_throws = _undefined,
    Object? spellcasting = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Classes$classes(
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      proficiencies: proficiencies == _undefined
          ? _instance.proficiencies
          : (proficiencies as List<Query$Classes$classes$proficiencies>?),
      saving_throws: saving_throws == _undefined
          ? _instance.saving_throws
          : (saving_throws as List<Query$Classes$classes$saving_throws>?),
      spellcasting: spellcasting == _undefined
          ? _instance.spellcasting
          : (spellcasting as Query$Classes$classes$spellcasting?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes proficiencies(
    Iterable<Query$Classes$classes$proficiencies>? Function(
      Iterable<
        CopyWith$Query$Classes$classes$proficiencies<
          Query$Classes$classes$proficiencies
        >
      >?,
    )
    _fn,
  ) => call(
    proficiencies: _fn(
      _instance.proficiencies?.map(
        (e) => CopyWith$Query$Classes$classes$proficiencies(e, (i) => i),
      ),
    )?.toList(),
  );

  TRes saving_throws(
    Iterable<Query$Classes$classes$saving_throws>? Function(
      Iterable<
        CopyWith$Query$Classes$classes$saving_throws<
          Query$Classes$classes$saving_throws
        >
      >?,
    )
    _fn,
  ) => call(
    saving_throws: _fn(
      _instance.saving_throws?.map(
        (e) => CopyWith$Query$Classes$classes$saving_throws(e, (i) => i),
      ),
    )?.toList(),
  );

  CopyWith$Query$Classes$classes$spellcasting<TRes> get spellcasting {
    final local$spellcasting = _instance.spellcasting;
    return local$spellcasting == null
        ? CopyWith$Query$Classes$classes$spellcasting.stub(_then(_instance))
        : CopyWith$Query$Classes$classes$spellcasting(
            local$spellcasting,
            (e) => call(spellcasting: e),
          );
  }
}

class _CopyWithStubImpl$Query$Classes$classes<TRes>
    implements CopyWith$Query$Classes$classes<TRes> {
  _CopyWithStubImpl$Query$Classes$classes(this._res);

  TRes _res;

  call({
    String? name,
    List<Query$Classes$classes$proficiencies>? proficiencies,
    List<Query$Classes$classes$saving_throws>? saving_throws,
    Query$Classes$classes$spellcasting? spellcasting,
    String? $__typename,
  }) => _res;

  proficiencies(_fn) => _res;

  saving_throws(_fn) => _res;

  CopyWith$Query$Classes$classes$spellcasting<TRes> get spellcasting =>
      CopyWith$Query$Classes$classes$spellcasting.stub(_res);
}

class Query$Classes$classes$proficiencies {
  Query$Classes$classes$proficiencies({
    required this.name,
    this.$__typename = 'Proficiency',
  });

  factory Query$Classes$classes$proficiencies.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$Classes$classes$proficiencies(
      name: (l$name as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Classes$classes$proficiencies ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Classes$classes$proficiencies
    on Query$Classes$classes$proficiencies {
  CopyWith$Query$Classes$classes$proficiencies<
    Query$Classes$classes$proficiencies
  >
  get copyWith => CopyWith$Query$Classes$classes$proficiencies(this, (i) => i);
}

abstract class CopyWith$Query$Classes$classes$proficiencies<TRes> {
  factory CopyWith$Query$Classes$classes$proficiencies(
    Query$Classes$classes$proficiencies instance,
    TRes Function(Query$Classes$classes$proficiencies) then,
  ) = _CopyWithImpl$Query$Classes$classes$proficiencies;

  factory CopyWith$Query$Classes$classes$proficiencies.stub(TRes res) =
      _CopyWithStubImpl$Query$Classes$classes$proficiencies;

  TRes call({String? name, String? $__typename});
}

class _CopyWithImpl$Query$Classes$classes$proficiencies<TRes>
    implements CopyWith$Query$Classes$classes$proficiencies<TRes> {
  _CopyWithImpl$Query$Classes$classes$proficiencies(this._instance, this._then);

  final Query$Classes$classes$proficiencies _instance;

  final TRes Function(Query$Classes$classes$proficiencies) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? name = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$Classes$classes$proficiencies(
          name: name == _undefined || name == null
              ? _instance.name
              : (name as String),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );
}

class _CopyWithStubImpl$Query$Classes$classes$proficiencies<TRes>
    implements CopyWith$Query$Classes$classes$proficiencies<TRes> {
  _CopyWithStubImpl$Query$Classes$classes$proficiencies(this._res);

  TRes _res;

  call({String? name, String? $__typename}) => _res;
}

class Query$Classes$classes$saving_throws {
  Query$Classes$classes$saving_throws({
    required this.full_name,
    required this.desc,
    required this.skills,
    this.$__typename = 'AbilityScore',
  });

  factory Query$Classes$classes$saving_throws.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$full_name = json['full_name'];
    final l$desc = json['desc'];
    final l$skills = json['skills'];
    final l$$__typename = json['__typename'];
    return Query$Classes$classes$saving_throws(
      full_name: (l$full_name as String),
      desc: (l$desc as List<dynamic>).map((e) => (e as String)).toList(),
      skills: (l$skills as List<dynamic>)
          .map(
            (e) => Query$Classes$classes$saving_throws$skills.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String full_name;

  final List<String> desc;

  final List<Query$Classes$classes$saving_throws$skills> skills;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$full_name = full_name;
    _resultData['full_name'] = l$full_name;
    final l$desc = desc;
    _resultData['desc'] = l$desc.map((e) => e).toList();
    final l$skills = skills;
    _resultData['skills'] = l$skills.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$full_name = full_name;
    final l$desc = desc;
    final l$skills = skills;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$full_name,
      Object.hashAll(l$desc.map((v) => v)),
      Object.hashAll(l$skills.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Classes$classes$saving_throws ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$full_name = full_name;
    final lOther$full_name = other.full_name;
    if (l$full_name != lOther$full_name) {
      return false;
    }
    final l$desc = desc;
    final lOther$desc = other.desc;
    if (l$desc.length != lOther$desc.length) {
      return false;
    }
    for (int i = 0; i < l$desc.length; i++) {
      final l$desc$entry = l$desc[i];
      final lOther$desc$entry = lOther$desc[i];
      if (l$desc$entry != lOther$desc$entry) {
        return false;
      }
    }
    final l$skills = skills;
    final lOther$skills = other.skills;
    if (l$skills.length != lOther$skills.length) {
      return false;
    }
    for (int i = 0; i < l$skills.length; i++) {
      final l$skills$entry = l$skills[i];
      final lOther$skills$entry = lOther$skills[i];
      if (l$skills$entry != lOther$skills$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Classes$classes$saving_throws
    on Query$Classes$classes$saving_throws {
  CopyWith$Query$Classes$classes$saving_throws<
    Query$Classes$classes$saving_throws
  >
  get copyWith => CopyWith$Query$Classes$classes$saving_throws(this, (i) => i);
}

abstract class CopyWith$Query$Classes$classes$saving_throws<TRes> {
  factory CopyWith$Query$Classes$classes$saving_throws(
    Query$Classes$classes$saving_throws instance,
    TRes Function(Query$Classes$classes$saving_throws) then,
  ) = _CopyWithImpl$Query$Classes$classes$saving_throws;

  factory CopyWith$Query$Classes$classes$saving_throws.stub(TRes res) =
      _CopyWithStubImpl$Query$Classes$classes$saving_throws;

  TRes call({
    String? full_name,
    List<String>? desc,
    List<Query$Classes$classes$saving_throws$skills>? skills,
    String? $__typename,
  });
  TRes skills(
    Iterable<Query$Classes$classes$saving_throws$skills> Function(
      Iterable<
        CopyWith$Query$Classes$classes$saving_throws$skills<
          Query$Classes$classes$saving_throws$skills
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$Classes$classes$saving_throws<TRes>
    implements CopyWith$Query$Classes$classes$saving_throws<TRes> {
  _CopyWithImpl$Query$Classes$classes$saving_throws(this._instance, this._then);

  final Query$Classes$classes$saving_throws _instance;

  final TRes Function(Query$Classes$classes$saving_throws) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? full_name = _undefined,
    Object? desc = _undefined,
    Object? skills = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Classes$classes$saving_throws(
      full_name: full_name == _undefined || full_name == null
          ? _instance.full_name
          : (full_name as String),
      desc: desc == _undefined || desc == null
          ? _instance.desc
          : (desc as List<String>),
      skills: skills == _undefined || skills == null
          ? _instance.skills
          : (skills as List<Query$Classes$classes$saving_throws$skills>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes skills(
    Iterable<Query$Classes$classes$saving_throws$skills> Function(
      Iterable<
        CopyWith$Query$Classes$classes$saving_throws$skills<
          Query$Classes$classes$saving_throws$skills
        >
      >,
    )
    _fn,
  ) => call(
    skills: _fn(
      _instance.skills.map(
        (e) => CopyWith$Query$Classes$classes$saving_throws$skills(e, (i) => i),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$Classes$classes$saving_throws<TRes>
    implements CopyWith$Query$Classes$classes$saving_throws<TRes> {
  _CopyWithStubImpl$Query$Classes$classes$saving_throws(this._res);

  TRes _res;

  call({
    String? full_name,
    List<String>? desc,
    List<Query$Classes$classes$saving_throws$skills>? skills,
    String? $__typename,
  }) => _res;

  skills(_fn) => _res;
}

class Query$Classes$classes$saving_throws$skills {
  Query$Classes$classes$saving_throws$skills({
    required this.name,
    this.$__typename = 'Skill',
  });

  factory Query$Classes$classes$saving_throws$skills.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$Classes$classes$saving_throws$skills(
      name: (l$name as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Classes$classes$saving_throws$skills ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Classes$classes$saving_throws$skills
    on Query$Classes$classes$saving_throws$skills {
  CopyWith$Query$Classes$classes$saving_throws$skills<
    Query$Classes$classes$saving_throws$skills
  >
  get copyWith =>
      CopyWith$Query$Classes$classes$saving_throws$skills(this, (i) => i);
}

abstract class CopyWith$Query$Classes$classes$saving_throws$skills<TRes> {
  factory CopyWith$Query$Classes$classes$saving_throws$skills(
    Query$Classes$classes$saving_throws$skills instance,
    TRes Function(Query$Classes$classes$saving_throws$skills) then,
  ) = _CopyWithImpl$Query$Classes$classes$saving_throws$skills;

  factory CopyWith$Query$Classes$classes$saving_throws$skills.stub(TRes res) =
      _CopyWithStubImpl$Query$Classes$classes$saving_throws$skills;

  TRes call({String? name, String? $__typename});
}

class _CopyWithImpl$Query$Classes$classes$saving_throws$skills<TRes>
    implements CopyWith$Query$Classes$classes$saving_throws$skills<TRes> {
  _CopyWithImpl$Query$Classes$classes$saving_throws$skills(
    this._instance,
    this._then,
  );

  final Query$Classes$classes$saving_throws$skills _instance;

  final TRes Function(Query$Classes$classes$saving_throws$skills) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? name = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$Classes$classes$saving_throws$skills(
          name: name == _undefined || name == null
              ? _instance.name
              : (name as String),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );
}

class _CopyWithStubImpl$Query$Classes$classes$saving_throws$skills<TRes>
    implements CopyWith$Query$Classes$classes$saving_throws$skills<TRes> {
  _CopyWithStubImpl$Query$Classes$classes$saving_throws$skills(this._res);

  TRes _res;

  call({String? name, String? $__typename}) => _res;
}

class Query$Classes$classes$spellcasting {
  Query$Classes$classes$spellcasting({
    required this.info,
    required this.level,
    required this.spellcasting_ability,
    this.$__typename = 'Spellcasting',
  });

  factory Query$Classes$classes$spellcasting.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$info = json['info'];
    final l$level = json['level'];
    final l$spellcasting_ability = json['spellcasting_ability'];
    final l$$__typename = json['__typename'];
    return Query$Classes$classes$spellcasting(
      info: (l$info as List<dynamic>)
          .map(
            (e) => Query$Classes$classes$spellcasting$info.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      level: (l$level as int),
      spellcasting_ability:
          Query$Classes$classes$spellcasting$spellcasting_ability.fromJson(
            (l$spellcasting_ability as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$Classes$classes$spellcasting$info> info;

  final int level;

  final Query$Classes$classes$spellcasting$spellcasting_ability
  spellcasting_ability;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$info = info;
    _resultData['info'] = l$info.map((e) => e.toJson()).toList();
    final l$level = level;
    _resultData['level'] = l$level;
    final l$spellcasting_ability = spellcasting_ability;
    _resultData['spellcasting_ability'] = l$spellcasting_ability.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$info = info;
    final l$level = level;
    final l$spellcasting_ability = spellcasting_ability;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$info.map((v) => v)),
      l$level,
      l$spellcasting_ability,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Classes$classes$spellcasting ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$info = info;
    final lOther$info = other.info;
    if (l$info.length != lOther$info.length) {
      return false;
    }
    for (int i = 0; i < l$info.length; i++) {
      final l$info$entry = l$info[i];
      final lOther$info$entry = lOther$info[i];
      if (l$info$entry != lOther$info$entry) {
        return false;
      }
    }
    final l$level = level;
    final lOther$level = other.level;
    if (l$level != lOther$level) {
      return false;
    }
    final l$spellcasting_ability = spellcasting_ability;
    final lOther$spellcasting_ability = other.spellcasting_ability;
    if (l$spellcasting_ability != lOther$spellcasting_ability) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Classes$classes$spellcasting
    on Query$Classes$classes$spellcasting {
  CopyWith$Query$Classes$classes$spellcasting<
    Query$Classes$classes$spellcasting
  >
  get copyWith => CopyWith$Query$Classes$classes$spellcasting(this, (i) => i);
}

abstract class CopyWith$Query$Classes$classes$spellcasting<TRes> {
  factory CopyWith$Query$Classes$classes$spellcasting(
    Query$Classes$classes$spellcasting instance,
    TRes Function(Query$Classes$classes$spellcasting) then,
  ) = _CopyWithImpl$Query$Classes$classes$spellcasting;

  factory CopyWith$Query$Classes$classes$spellcasting.stub(TRes res) =
      _CopyWithStubImpl$Query$Classes$classes$spellcasting;

  TRes call({
    List<Query$Classes$classes$spellcasting$info>? info,
    int? level,
    Query$Classes$classes$spellcasting$spellcasting_ability?
    spellcasting_ability,
    String? $__typename,
  });
  TRes info(
    Iterable<Query$Classes$classes$spellcasting$info> Function(
      Iterable<
        CopyWith$Query$Classes$classes$spellcasting$info<
          Query$Classes$classes$spellcasting$info
        >
      >,
    )
    _fn,
  );
  CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability<TRes>
  get spellcasting_ability;
}

class _CopyWithImpl$Query$Classes$classes$spellcasting<TRes>
    implements CopyWith$Query$Classes$classes$spellcasting<TRes> {
  _CopyWithImpl$Query$Classes$classes$spellcasting(this._instance, this._then);

  final Query$Classes$classes$spellcasting _instance;

  final TRes Function(Query$Classes$classes$spellcasting) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? info = _undefined,
    Object? level = _undefined,
    Object? spellcasting_ability = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Classes$classes$spellcasting(
      info: info == _undefined || info == null
          ? _instance.info
          : (info as List<Query$Classes$classes$spellcasting$info>),
      level: level == _undefined || level == null
          ? _instance.level
          : (level as int),
      spellcasting_ability:
          spellcasting_ability == _undefined || spellcasting_ability == null
          ? _instance.spellcasting_ability
          : (spellcasting_ability
                as Query$Classes$classes$spellcasting$spellcasting_ability),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes info(
    Iterable<Query$Classes$classes$spellcasting$info> Function(
      Iterable<
        CopyWith$Query$Classes$classes$spellcasting$info<
          Query$Classes$classes$spellcasting$info
        >
      >,
    )
    _fn,
  ) => call(
    info: _fn(
      _instance.info.map(
        (e) => CopyWith$Query$Classes$classes$spellcasting$info(e, (i) => i),
      ),
    ).toList(),
  );

  CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability<TRes>
  get spellcasting_ability {
    final local$spellcasting_ability = _instance.spellcasting_ability;
    return CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability(
      local$spellcasting_ability,
      (e) => call(spellcasting_ability: e),
    );
  }
}

class _CopyWithStubImpl$Query$Classes$classes$spellcasting<TRes>
    implements CopyWith$Query$Classes$classes$spellcasting<TRes> {
  _CopyWithStubImpl$Query$Classes$classes$spellcasting(this._res);

  TRes _res;

  call({
    List<Query$Classes$classes$spellcasting$info>? info,
    int? level,
    Query$Classes$classes$spellcasting$spellcasting_ability?
    spellcasting_ability,
    String? $__typename,
  }) => _res;

  info(_fn) => _res;

  CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability<TRes>
  get spellcasting_ability =>
      CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability.stub(
        _res,
      );
}

class Query$Classes$classes$spellcasting$info {
  Query$Classes$classes$spellcasting$info({
    required this.name,
    required this.desc,
    this.$__typename = 'SpellcastingInfo',
  });

  factory Query$Classes$classes$spellcasting$info.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$name = json['name'];
    final l$desc = json['desc'];
    final l$$__typename = json['__typename'];
    return Query$Classes$classes$spellcasting$info(
      name: (l$name as String),
      desc: (l$desc as List<dynamic>).map((e) => (e as String)).toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final List<String> desc;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$desc = desc;
    _resultData['desc'] = l$desc.map((e) => e).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$desc = desc;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      Object.hashAll(l$desc.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Classes$classes$spellcasting$info ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$desc = desc;
    final lOther$desc = other.desc;
    if (l$desc.length != lOther$desc.length) {
      return false;
    }
    for (int i = 0; i < l$desc.length; i++) {
      final l$desc$entry = l$desc[i];
      final lOther$desc$entry = lOther$desc[i];
      if (l$desc$entry != lOther$desc$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Classes$classes$spellcasting$info
    on Query$Classes$classes$spellcasting$info {
  CopyWith$Query$Classes$classes$spellcasting$info<
    Query$Classes$classes$spellcasting$info
  >
  get copyWith =>
      CopyWith$Query$Classes$classes$spellcasting$info(this, (i) => i);
}

abstract class CopyWith$Query$Classes$classes$spellcasting$info<TRes> {
  factory CopyWith$Query$Classes$classes$spellcasting$info(
    Query$Classes$classes$spellcasting$info instance,
    TRes Function(Query$Classes$classes$spellcasting$info) then,
  ) = _CopyWithImpl$Query$Classes$classes$spellcasting$info;

  factory CopyWith$Query$Classes$classes$spellcasting$info.stub(TRes res) =
      _CopyWithStubImpl$Query$Classes$classes$spellcasting$info;

  TRes call({String? name, List<String>? desc, String? $__typename});
}

class _CopyWithImpl$Query$Classes$classes$spellcasting$info<TRes>
    implements CopyWith$Query$Classes$classes$spellcasting$info<TRes> {
  _CopyWithImpl$Query$Classes$classes$spellcasting$info(
    this._instance,
    this._then,
  );

  final Query$Classes$classes$spellcasting$info _instance;

  final TRes Function(Query$Classes$classes$spellcasting$info) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? desc = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Classes$classes$spellcasting$info(
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      desc: desc == _undefined || desc == null
          ? _instance.desc
          : (desc as List<String>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Classes$classes$spellcasting$info<TRes>
    implements CopyWith$Query$Classes$classes$spellcasting$info<TRes> {
  _CopyWithStubImpl$Query$Classes$classes$spellcasting$info(this._res);

  TRes _res;

  call({String? name, List<String>? desc, String? $__typename}) => _res;
}

class Query$Classes$classes$spellcasting$spellcasting_ability {
  Query$Classes$classes$spellcasting$spellcasting_ability({
    required this.name,
    required this.skills,
    this.$__typename = 'AbilityScore',
  });

  factory Query$Classes$classes$spellcasting$spellcasting_ability.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$name = json['name'];
    final l$skills = json['skills'];
    final l$$__typename = json['__typename'];
    return Query$Classes$classes$spellcasting$spellcasting_ability(
      name: (l$name as String),
      skills: (l$skills as List<dynamic>)
          .map(
            (e) =>
                Query$Classes$classes$spellcasting$spellcasting_ability$skills.fromJson(
                  (e as Map<String, dynamic>),
                ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final List<Query$Classes$classes$spellcasting$spellcasting_ability$skills>
  skills;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$skills = skills;
    _resultData['skills'] = l$skills.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$skills = skills;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      Object.hashAll(l$skills.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Classes$classes$spellcasting$spellcasting_ability ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$skills = skills;
    final lOther$skills = other.skills;
    if (l$skills.length != lOther$skills.length) {
      return false;
    }
    for (int i = 0; i < l$skills.length; i++) {
      final l$skills$entry = l$skills[i];
      final lOther$skills$entry = lOther$skills[i];
      if (l$skills$entry != lOther$skills$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Classes$classes$spellcasting$spellcasting_ability
    on Query$Classes$classes$spellcasting$spellcasting_ability {
  CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability<
    Query$Classes$classes$spellcasting$spellcasting_ability
  >
  get copyWith =>
      CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability<
  TRes
> {
  factory CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability(
    Query$Classes$classes$spellcasting$spellcasting_ability instance,
    TRes Function(Query$Classes$classes$spellcasting$spellcasting_ability) then,
  ) = _CopyWithImpl$Query$Classes$classes$spellcasting$spellcasting_ability;

  factory CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$Classes$classes$spellcasting$spellcasting_ability;

  TRes call({
    String? name,
    List<Query$Classes$classes$spellcasting$spellcasting_ability$skills>?
    skills,
    String? $__typename,
  });
  TRes skills(
    Iterable<Query$Classes$classes$spellcasting$spellcasting_ability$skills>
    Function(
      Iterable<
        CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills<
          Query$Classes$classes$spellcasting$spellcasting_ability$skills
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$Classes$classes$spellcasting$spellcasting_ability<
  TRes
>
    implements
        CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability<TRes> {
  _CopyWithImpl$Query$Classes$classes$spellcasting$spellcasting_ability(
    this._instance,
    this._then,
  );

  final Query$Classes$classes$spellcasting$spellcasting_ability _instance;

  final TRes Function(Query$Classes$classes$spellcasting$spellcasting_ability)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? skills = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Classes$classes$spellcasting$spellcasting_ability(
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      skills: skills == _undefined || skills == null
          ? _instance.skills
          : (skills
                as List<
                  Query$Classes$classes$spellcasting$spellcasting_ability$skills
                >),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes skills(
    Iterable<Query$Classes$classes$spellcasting$spellcasting_ability$skills>
    Function(
      Iterable<
        CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills<
          Query$Classes$classes$spellcasting$spellcasting_ability$skills
        >
      >,
    )
    _fn,
  ) => call(
    skills: _fn(
      _instance.skills.map(
        (e) =>
            CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills(
              e,
              (i) => i,
            ),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$Classes$classes$spellcasting$spellcasting_ability<
  TRes
>
    implements
        CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability<TRes> {
  _CopyWithStubImpl$Query$Classes$classes$spellcasting$spellcasting_ability(
    this._res,
  );

  TRes _res;

  call({
    String? name,
    List<Query$Classes$classes$spellcasting$spellcasting_ability$skills>?
    skills,
    String? $__typename,
  }) => _res;

  skills(_fn) => _res;
}

class Query$Classes$classes$spellcasting$spellcasting_ability$skills {
  Query$Classes$classes$spellcasting$spellcasting_ability$skills({
    required this.name,
    required this.desc,
    required this.ability_score,
    this.$__typename = 'Skill',
  });

  factory Query$Classes$classes$spellcasting$spellcasting_ability$skills.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$name = json['name'];
    final l$desc = json['desc'];
    final l$ability_score = json['ability_score'];
    final l$$__typename = json['__typename'];
    return Query$Classes$classes$spellcasting$spellcasting_ability$skills(
      name: (l$name as String),
      desc: (l$desc as List<dynamic>).map((e) => (e as String)).toList(),
      ability_score:
          Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score.fromJson(
            (l$ability_score as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final List<String> desc;

  final Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score
  ability_score;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$desc = desc;
    _resultData['desc'] = l$desc.map((e) => e).toList();
    final l$ability_score = ability_score;
    _resultData['ability_score'] = l$ability_score.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$desc = desc;
    final l$ability_score = ability_score;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      Object.hashAll(l$desc.map((v) => v)),
      l$ability_score,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$Classes$classes$spellcasting$spellcasting_ability$skills ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$desc = desc;
    final lOther$desc = other.desc;
    if (l$desc.length != lOther$desc.length) {
      return false;
    }
    for (int i = 0; i < l$desc.length; i++) {
      final l$desc$entry = l$desc[i];
      final lOther$desc$entry = lOther$desc[i];
      if (l$desc$entry != lOther$desc$entry) {
        return false;
      }
    }
    final l$ability_score = ability_score;
    final lOther$ability_score = other.ability_score;
    if (l$ability_score != lOther$ability_score) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Classes$classes$spellcasting$spellcasting_ability$skills
    on Query$Classes$classes$spellcasting$spellcasting_ability$skills {
  CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills<
    Query$Classes$classes$spellcasting$spellcasting_ability$skills
  >
  get copyWith =>
      CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills<
  TRes
> {
  factory CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills(
    Query$Classes$classes$spellcasting$spellcasting_ability$skills instance,
    TRes Function(
      Query$Classes$classes$spellcasting$spellcasting_ability$skills,
    )
    then,
  ) = _CopyWithImpl$Query$Classes$classes$spellcasting$spellcasting_ability$skills;

  factory CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$Classes$classes$spellcasting$spellcasting_ability$skills;

  TRes call({
    String? name,
    List<String>? desc,
    Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score?
    ability_score,
    String? $__typename,
  });
  CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score<
    TRes
  >
  get ability_score;
}

class _CopyWithImpl$Query$Classes$classes$spellcasting$spellcasting_ability$skills<
  TRes
>
    implements
        CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills<
          TRes
        > {
  _CopyWithImpl$Query$Classes$classes$spellcasting$spellcasting_ability$skills(
    this._instance,
    this._then,
  );

  final Query$Classes$classes$spellcasting$spellcasting_ability$skills
  _instance;

  final TRes Function(
    Query$Classes$classes$spellcasting$spellcasting_ability$skills,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? desc = _undefined,
    Object? ability_score = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Classes$classes$spellcasting$spellcasting_ability$skills(
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      desc: desc == _undefined || desc == null
          ? _instance.desc
          : (desc as List<String>),
      ability_score: ability_score == _undefined || ability_score == null
          ? _instance.ability_score
          : (ability_score
                as Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score<
    TRes
  >
  get ability_score {
    final local$ability_score = _instance.ability_score;
    return CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score(
      local$ability_score,
      (e) => call(ability_score: e),
    );
  }
}

class _CopyWithStubImpl$Query$Classes$classes$spellcasting$spellcasting_ability$skills<
  TRes
>
    implements
        CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills<
          TRes
        > {
  _CopyWithStubImpl$Query$Classes$classes$spellcasting$spellcasting_ability$skills(
    this._res,
  );

  TRes _res;

  call({
    String? name,
    List<String>? desc,
    Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score?
    ability_score,
    String? $__typename,
  }) => _res;

  CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score<
    TRes
  >
  get ability_score =>
      CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score.stub(
        _res,
      );
}

class Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score {
  Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score({
    required this.name,
    required this.desc,
    required this.skills,
    this.$__typename = 'AbilityScore',
  });

  factory Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$name = json['name'];
    final l$desc = json['desc'];
    final l$skills = json['skills'];
    final l$$__typename = json['__typename'];
    return Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score(
      name: (l$name as String),
      desc: (l$desc as List<dynamic>).map((e) => (e as String)).toList(),
      skills: (l$skills as List<dynamic>)
          .map(
            (e) =>
                Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills.fromJson(
                  (e as Map<String, dynamic>),
                ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final List<String> desc;

  final List<
    Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills
  >
  skills;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$desc = desc;
    _resultData['desc'] = l$desc.map((e) => e).toList();
    final l$skills = skills;
    _resultData['skills'] = l$skills.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$desc = desc;
    final l$skills = skills;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      Object.hashAll(l$desc.map((v) => v)),
      Object.hashAll(l$skills.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$desc = desc;
    final lOther$desc = other.desc;
    if (l$desc.length != lOther$desc.length) {
      return false;
    }
    for (int i = 0; i < l$desc.length; i++) {
      final l$desc$entry = l$desc[i];
      final lOther$desc$entry = lOther$desc[i];
      if (l$desc$entry != lOther$desc$entry) {
        return false;
      }
    }
    final l$skills = skills;
    final lOther$skills = other.skills;
    if (l$skills.length != lOther$skills.length) {
      return false;
    }
    for (int i = 0; i < l$skills.length; i++) {
      final l$skills$entry = l$skills[i];
      final lOther$skills$entry = lOther$skills[i];
      if (l$skills$entry != lOther$skills$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score
    on Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score {
  CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score<
    Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score
  >
  get copyWith =>
      CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score<
  TRes
> {
  factory CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score(
    Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score
    instance,
    TRes Function(
      Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score,
    )
    then,
  ) = _CopyWithImpl$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score;

  factory CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score;

  TRes call({
    String? name,
    List<String>? desc,
    List<
      Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills
    >?
    skills,
    String? $__typename,
  });
  TRes skills(
    Iterable<
      Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills
    >
    Function(
      Iterable<
        CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills<
          Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score<
  TRes
>
    implements
        CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score<
          TRes
        > {
  _CopyWithImpl$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score(
    this._instance,
    this._then,
  );

  final Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score
  _instance;

  final TRes Function(
    Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? desc = _undefined,
    Object? skills = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score(
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      desc: desc == _undefined || desc == null
          ? _instance.desc
          : (desc as List<String>),
      skills: skills == _undefined || skills == null
          ? _instance.skills
          : (skills
                as List<
                  Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills
                >),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes skills(
    Iterable<
      Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills
    >
    Function(
      Iterable<
        CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills<
          Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills
        >
      >,
    )
    _fn,
  ) => call(
    skills: _fn(
      _instance.skills.map(
        (e) =>
            CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills(
              e,
              (i) => i,
            ),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score<
  TRes
>
    implements
        CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score<
          TRes
        > {
  _CopyWithStubImpl$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score(
    this._res,
  );

  TRes _res;

  call({
    String? name,
    List<String>? desc,
    List<
      Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills
    >?
    skills,
    String? $__typename,
  }) => _res;

  skills(_fn) => _res;
}

class Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills {
  Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills({
    required this.name,
    required this.desc,
    this.$__typename = 'Skill',
  });

  factory Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$name = json['name'];
    final l$desc = json['desc'];
    final l$$__typename = json['__typename'];
    return Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills(
      name: (l$name as String),
      desc: (l$desc as List<dynamic>).map((e) => (e as String)).toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final List<String> desc;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$desc = desc;
    _resultData['desc'] = l$desc.map((e) => e).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$desc = desc;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      Object.hashAll(l$desc.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$desc = desc;
    final lOther$desc = other.desc;
    if (l$desc.length != lOther$desc.length) {
      return false;
    }
    for (int i = 0; i < l$desc.length; i++) {
      final l$desc$entry = l$desc[i];
      final lOther$desc$entry = lOther$desc[i];
      if (l$desc$entry != lOther$desc$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills
    on
        Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills {
  CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills<
    Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills
  >
  get copyWith =>
      CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills<
  TRes
> {
  factory CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills(
    Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills
    instance,
    TRes Function(
      Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills,
    )
    then,
  ) = _CopyWithImpl$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills;

  factory CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills;

  TRes call({String? name, List<String>? desc, String? $__typename});
}

class _CopyWithImpl$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills<
  TRes
>
    implements
        CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills<
          TRes
        > {
  _CopyWithImpl$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills(
    this._instance,
    this._then,
  );

  final Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills
  _instance;

  final TRes Function(
    Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? desc = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills(
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      desc: desc == _undefined || desc == null
          ? _instance.desc
          : (desc as List<String>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills<
  TRes
>
    implements
        CopyWith$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills<
          TRes
        > {
  _CopyWithStubImpl$Query$Classes$classes$spellcasting$spellcasting_ability$skills$ability_score$skills(
    this._res,
  );

  TRes _res;

  call({String? name, List<String>? desc, String? $__typename}) => _res;
}
