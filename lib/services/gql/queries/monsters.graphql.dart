import '../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Query$Monsters {
  factory Variables$Query$Monsters(Input$MonsterOrder graphQL, {Input$MonsterOrder? order}) =>
      Variables$Query$Monsters._({if (order != null) r'order': order});

  Variables$Query$Monsters._(this._$data);

  factory Variables$Query$Monsters.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('order')) {
      final l$order = data['order'];
      result$data['order'] = l$order == null
          ? null
          : Input$MonsterOrder.fromJson((l$order as Map<String, dynamic>));
    }
    return Variables$Query$Monsters._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$MonsterOrder? get order => (_$data['order'] as Input$MonsterOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('order')) {
      final l$order = order;
      result$data['order'] = l$order?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Query$Monsters<Variables$Query$Monsters> get copyWith =>
      CopyWith$Variables$Query$Monsters(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$Monsters ||
        runtimeType != other.runtimeType) {
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

abstract class CopyWith$Variables$Query$Monsters<TRes> {
  factory CopyWith$Variables$Query$Monsters(
    Variables$Query$Monsters instance,
    TRes Function(Variables$Query$Monsters) then,
  ) = _CopyWithImpl$Variables$Query$Monsters;

  factory CopyWith$Variables$Query$Monsters.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Monsters;

  TRes call({Input$MonsterOrder? order});
}

class _CopyWithImpl$Variables$Query$Monsters<TRes>
    implements CopyWith$Variables$Query$Monsters<TRes> {
  _CopyWithImpl$Variables$Query$Monsters(this._instance, this._then);

  final Variables$Query$Monsters _instance;

  final TRes Function(Variables$Query$Monsters) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? order = _undefined}) => _then(
    Variables$Query$Monsters._({
      ..._instance._$data,
      if (order != _undefined) 'order': (order as Input$MonsterOrder?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$Monsters<TRes>
    implements CopyWith$Variables$Query$Monsters<TRes> {
  _CopyWithStubImpl$Variables$Query$Monsters(this._res);

  TRes _res;

  call({Input$MonsterOrder? order}) => _res;
}

class Query$Monsters {
  Query$Monsters({required this.monsters, this.$__typename = 'Query'});

  factory Query$Monsters.fromJson(Map<String, dynamic> json) {
    final l$monsters = json['monsters'];
    final l$$__typename = json['__typename'];
    return Query$Monsters(
      monsters: (l$monsters as List<dynamic>)
          .map(
            (e) =>
                Query$Monsters$monsters.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$Monsters$monsters> monsters;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$monsters = monsters;
    _resultData['monsters'] = l$monsters.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$monsters = monsters;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$monsters.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Monsters || runtimeType != other.runtimeType) {
      return false;
    }
    final l$monsters = monsters;
    final lOther$monsters = other.monsters;
    if (l$monsters.length != lOther$monsters.length) {
      return false;
    }
    for (int i = 0; i < l$monsters.length; i++) {
      final l$monsters$entry = l$monsters[i];
      final lOther$monsters$entry = lOther$monsters[i];
      if (l$monsters$entry != lOther$monsters$entry) {
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

extension UtilityExtension$Query$Monsters on Query$Monsters {
  CopyWith$Query$Monsters<Query$Monsters> get copyWith =>
      CopyWith$Query$Monsters(this, (i) => i);
}

abstract class CopyWith$Query$Monsters<TRes> {
  factory CopyWith$Query$Monsters(
    Query$Monsters instance,
    TRes Function(Query$Monsters) then,
  ) = _CopyWithImpl$Query$Monsters;

  factory CopyWith$Query$Monsters.stub(TRes res) =
      _CopyWithStubImpl$Query$Monsters;

  TRes call({List<Query$Monsters$monsters>? monsters, String? $__typename});
  TRes monsters(
    Iterable<Query$Monsters$monsters> Function(
      Iterable<CopyWith$Query$Monsters$monsters<Query$Monsters$monsters>>,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$Monsters<TRes>
    implements CopyWith$Query$Monsters<TRes> {
  _CopyWithImpl$Query$Monsters(this._instance, this._then);

  final Query$Monsters _instance;

  final TRes Function(Query$Monsters) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? monsters = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Monsters(
      monsters: monsters == _undefined || monsters == null
          ? _instance.monsters
          : (monsters as List<Query$Monsters$monsters>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes monsters(
    Iterable<Query$Monsters$monsters> Function(
      Iterable<CopyWith$Query$Monsters$monsters<Query$Monsters$monsters>>,
    )
    _fn,
  ) => call(
    monsters: _fn(
      _instance.monsters.map(
        (e) => CopyWith$Query$Monsters$monsters(e, (i) => i),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$Monsters<TRes>
    implements CopyWith$Query$Monsters<TRes> {
  _CopyWithStubImpl$Query$Monsters(this._res);

  TRes _res;

  call({List<Query$Monsters$monsters>? monsters, String? $__typename}) => _res;

  monsters(_fn) => _res;
}

const documentNodeQueryMonsters = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Monsters'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'order')),
          type: NamedTypeNode(
            name: NameNode(value: 'MonsterOrder'),
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
            name: NameNode(value: 'monsters'),
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
                  name: NameNode(value: 'image'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'size'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'type'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'hit_points'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'hit_points_roll'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'senses'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'blindsight'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'darkvision'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'passive_perception'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'tremorsense'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'truesight'),
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
                  name: NameNode(value: 'damage_immunities'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'damage_resistances'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'damage_vulnerabilities'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'hit_dice'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'speed'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'burrow'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'climb'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'fly'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'hover'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'swim'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'walk'),
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
                  name: NameNode(value: 'armor_class'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      InlineFragmentNode(
                        typeCondition: TypeConditionNode(
                          on: NamedTypeNode(
                            name: NameNode(value: 'ArmorClassNatural'),
                            isNonNull: false,
                          ),
                        ),
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'type'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'value'),
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
                      InlineFragmentNode(
                        typeCondition: TypeConditionNode(
                          on: NamedTypeNode(
                            name: NameNode(value: 'ArmorClassDex'),
                            isNonNull: false,
                          ),
                        ),
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'type'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'value'),
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
                  name: NameNode(value: 'charisma'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'constitution'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'dexterity'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'intelligence'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'strength'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'wisdom'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'challenge_rating'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'xp'),
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
  ],
);

class Query$Monsters$monsters {
  Query$Monsters$monsters({
    required this.name,
    this.image,
    required this.size,
    required this.type,
    required this.hit_points,
    required this.hit_points_roll,
    required this.senses,
    required this.damage_immunities,
    required this.damage_resistances,
    required this.damage_vulnerabilities,
    required this.hit_dice,
    required this.speed,
    required this.armor_class,
    required this.charisma,
    required this.constitution,
    required this.dexterity,
    required this.intelligence,
    required this.strength,
    required this.wisdom,
    required this.challenge_rating,
    required this.xp,
    this.$__typename = 'Monster',
  });

  factory Query$Monsters$monsters.fromJson(Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$size = json['size'];
    final l$type = json['type'];
    final l$hit_points = json['hit_points'];
    final l$hit_points_roll = json['hit_points_roll'];
    final l$senses = json['senses'];
    final l$damage_immunities = json['damage_immunities'];
    final l$damage_resistances = json['damage_resistances'];
    final l$damage_vulnerabilities = json['damage_vulnerabilities'];
    final l$hit_dice = json['hit_dice'];
    final l$speed = json['speed'];
    final l$armor_class = json['armor_class'];
    final l$charisma = json['charisma'];
    final l$constitution = json['constitution'];
    final l$dexterity = json['dexterity'];
    final l$intelligence = json['intelligence'];
    final l$strength = json['strength'];
    final l$wisdom = json['wisdom'];
    final l$challenge_rating = json['challenge_rating'];
    final l$xp = json['xp'];
    final l$$__typename = json['__typename'];
    return Query$Monsters$monsters(
      name: (l$name as String),
      image: (l$image as String?),
      size: (l$size as String),
      type: (l$type as String),
      hit_points: (l$hit_points as int),
      hit_points_roll: (l$hit_points_roll as String),
      senses: Query$Monsters$monsters$senses.fromJson(
        (l$senses as Map<String, dynamic>),
      ),
      damage_immunities: (l$damage_immunities as List<dynamic>)
          .map((e) => (e as String))
          .toList(),
      damage_resistances: (l$damage_resistances as List<dynamic>)
          .map((e) => (e as String))
          .toList(),
      damage_vulnerabilities: (l$damage_vulnerabilities as List<dynamic>)
          .map((e) => (e as String))
          .toList(),
      hit_dice: (l$hit_dice as String),
      speed: Query$Monsters$monsters$speed.fromJson(
        (l$speed as Map<String, dynamic>),
      ),
      armor_class: (l$armor_class as List<dynamic>)
          .map(
            (e) => Query$Monsters$monsters$armor_class.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      charisma: (l$charisma as int),
      constitution: (l$constitution as int),
      dexterity: (l$dexterity as int),
      intelligence: (l$intelligence as int),
      strength: (l$strength as int),
      wisdom: (l$wisdom as int),
      challenge_rating: (l$challenge_rating as num).toDouble(),
      xp: (l$xp as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final String? image;

  final String size;

  final String type;

  final int hit_points;

  final String hit_points_roll;

  final Query$Monsters$monsters$senses senses;

  final List<String> damage_immunities;

  final List<String> damage_resistances;

  final List<String> damage_vulnerabilities;

  final String hit_dice;

  final Query$Monsters$monsters$speed speed;

  final List<Query$Monsters$monsters$armor_class> armor_class;

  final int charisma;

  final int constitution;

  final int dexterity;

  final int intelligence;

  final int strength;

  final int wisdom;

  final double challenge_rating;

  final int xp;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$size = size;
    _resultData['size'] = l$size;
    final l$type = type;
    _resultData['type'] = l$type;
    final l$hit_points = hit_points;
    _resultData['hit_points'] = l$hit_points;
    final l$hit_points_roll = hit_points_roll;
    _resultData['hit_points_roll'] = l$hit_points_roll;
    final l$senses = senses;
    _resultData['senses'] = l$senses.toJson();
    final l$damage_immunities = damage_immunities;
    _resultData['damage_immunities'] = l$damage_immunities
        .map((e) => e)
        .toList();
    final l$damage_resistances = damage_resistances;
    _resultData['damage_resistances'] = l$damage_resistances
        .map((e) => e)
        .toList();
    final l$damage_vulnerabilities = damage_vulnerabilities;
    _resultData['damage_vulnerabilities'] = l$damage_vulnerabilities
        .map((e) => e)
        .toList();
    final l$hit_dice = hit_dice;
    _resultData['hit_dice'] = l$hit_dice;
    final l$speed = speed;
    _resultData['speed'] = l$speed.toJson();
    final l$armor_class = armor_class;
    _resultData['armor_class'] = l$armor_class.map((e) => e.toJson()).toList();
    final l$charisma = charisma;
    _resultData['charisma'] = l$charisma;
    final l$constitution = constitution;
    _resultData['constitution'] = l$constitution;
    final l$dexterity = dexterity;
    _resultData['dexterity'] = l$dexterity;
    final l$intelligence = intelligence;
    _resultData['intelligence'] = l$intelligence;
    final l$strength = strength;
    _resultData['strength'] = l$strength;
    final l$wisdom = wisdom;
    _resultData['wisdom'] = l$wisdom;
    final l$challenge_rating = challenge_rating;
    _resultData['challenge_rating'] = l$challenge_rating;
    final l$xp = xp;
    _resultData['xp'] = l$xp;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$image = image;
    final l$size = size;
    final l$type = type;
    final l$hit_points = hit_points;
    final l$hit_points_roll = hit_points_roll;
    final l$senses = senses;
    final l$damage_immunities = damage_immunities;
    final l$damage_resistances = damage_resistances;
    final l$damage_vulnerabilities = damage_vulnerabilities;
    final l$hit_dice = hit_dice;
    final l$speed = speed;
    final l$armor_class = armor_class;
    final l$charisma = charisma;
    final l$constitution = constitution;
    final l$dexterity = dexterity;
    final l$intelligence = intelligence;
    final l$strength = strength;
    final l$wisdom = wisdom;
    final l$challenge_rating = challenge_rating;
    final l$xp = xp;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$image,
      l$size,
      l$type,
      l$hit_points,
      l$hit_points_roll,
      l$senses,
      Object.hashAll(l$damage_immunities.map((v) => v)),
      Object.hashAll(l$damage_resistances.map((v) => v)),
      Object.hashAll(l$damage_vulnerabilities.map((v) => v)),
      l$hit_dice,
      l$speed,
      Object.hashAll(l$armor_class.map((v) => v)),
      l$charisma,
      l$constitution,
      l$dexterity,
      l$intelligence,
      l$strength,
      l$wisdom,
      l$challenge_rating,
      l$xp,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Monsters$monsters || runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$size = size;
    final lOther$size = other.size;
    if (l$size != lOther$size) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$hit_points = hit_points;
    final lOther$hit_points = other.hit_points;
    if (l$hit_points != lOther$hit_points) {
      return false;
    }
    final l$hit_points_roll = hit_points_roll;
    final lOther$hit_points_roll = other.hit_points_roll;
    if (l$hit_points_roll != lOther$hit_points_roll) {
      return false;
    }
    final l$senses = senses;
    final lOther$senses = other.senses;
    if (l$senses != lOther$senses) {
      return false;
    }
    final l$damage_immunities = damage_immunities;
    final lOther$damage_immunities = other.damage_immunities;
    if (l$damage_immunities.length != lOther$damage_immunities.length) {
      return false;
    }
    for (int i = 0; i < l$damage_immunities.length; i++) {
      final l$damage_immunities$entry = l$damage_immunities[i];
      final lOther$damage_immunities$entry = lOther$damage_immunities[i];
      if (l$damage_immunities$entry != lOther$damage_immunities$entry) {
        return false;
      }
    }
    final l$damage_resistances = damage_resistances;
    final lOther$damage_resistances = other.damage_resistances;
    if (l$damage_resistances.length != lOther$damage_resistances.length) {
      return false;
    }
    for (int i = 0; i < l$damage_resistances.length; i++) {
      final l$damage_resistances$entry = l$damage_resistances[i];
      final lOther$damage_resistances$entry = lOther$damage_resistances[i];
      if (l$damage_resistances$entry != lOther$damage_resistances$entry) {
        return false;
      }
    }
    final l$damage_vulnerabilities = damage_vulnerabilities;
    final lOther$damage_vulnerabilities = other.damage_vulnerabilities;
    if (l$damage_vulnerabilities.length !=
        lOther$damage_vulnerabilities.length) {
      return false;
    }
    for (int i = 0; i < l$damage_vulnerabilities.length; i++) {
      final l$damage_vulnerabilities$entry = l$damage_vulnerabilities[i];
      final lOther$damage_vulnerabilities$entry =
          lOther$damage_vulnerabilities[i];
      if (l$damage_vulnerabilities$entry !=
          lOther$damage_vulnerabilities$entry) {
        return false;
      }
    }
    final l$hit_dice = hit_dice;
    final lOther$hit_dice = other.hit_dice;
    if (l$hit_dice != lOther$hit_dice) {
      return false;
    }
    final l$speed = speed;
    final lOther$speed = other.speed;
    if (l$speed != lOther$speed) {
      return false;
    }
    final l$armor_class = armor_class;
    final lOther$armor_class = other.armor_class;
    if (l$armor_class.length != lOther$armor_class.length) {
      return false;
    }
    for (int i = 0; i < l$armor_class.length; i++) {
      final l$armor_class$entry = l$armor_class[i];
      final lOther$armor_class$entry = lOther$armor_class[i];
      if (l$armor_class$entry != lOther$armor_class$entry) {
        return false;
      }
    }
    final l$charisma = charisma;
    final lOther$charisma = other.charisma;
    if (l$charisma != lOther$charisma) {
      return false;
    }
    final l$constitution = constitution;
    final lOther$constitution = other.constitution;
    if (l$constitution != lOther$constitution) {
      return false;
    }
    final l$dexterity = dexterity;
    final lOther$dexterity = other.dexterity;
    if (l$dexterity != lOther$dexterity) {
      return false;
    }
    final l$intelligence = intelligence;
    final lOther$intelligence = other.intelligence;
    if (l$intelligence != lOther$intelligence) {
      return false;
    }
    final l$strength = strength;
    final lOther$strength = other.strength;
    if (l$strength != lOther$strength) {
      return false;
    }
    final l$wisdom = wisdom;
    final lOther$wisdom = other.wisdom;
    if (l$wisdom != lOther$wisdom) {
      return false;
    }
    final l$challenge_rating = challenge_rating;
    final lOther$challenge_rating = other.challenge_rating;
    if (l$challenge_rating != lOther$challenge_rating) {
      return false;
    }
    final l$xp = xp;
    final lOther$xp = other.xp;
    if (l$xp != lOther$xp) {
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

extension UtilityExtension$Query$Monsters$monsters on Query$Monsters$monsters {
  CopyWith$Query$Monsters$monsters<Query$Monsters$monsters> get copyWith =>
      CopyWith$Query$Monsters$monsters(this, (i) => i);
}

abstract class CopyWith$Query$Monsters$monsters<TRes> {
  factory CopyWith$Query$Monsters$monsters(
    Query$Monsters$monsters instance,
    TRes Function(Query$Monsters$monsters) then,
  ) = _CopyWithImpl$Query$Monsters$monsters;

  factory CopyWith$Query$Monsters$monsters.stub(TRes res) =
      _CopyWithStubImpl$Query$Monsters$monsters;

  TRes call({
    String? name,
    String? image,
    String? size,
    String? type,
    int? hit_points,
    String? hit_points_roll,
    Query$Monsters$monsters$senses? senses,
    List<String>? damage_immunities,
    List<String>? damage_resistances,
    List<String>? damage_vulnerabilities,
    String? hit_dice,
    Query$Monsters$monsters$speed? speed,
    List<Query$Monsters$monsters$armor_class>? armor_class,
    int? charisma,
    int? constitution,
    int? dexterity,
    int? intelligence,
    int? strength,
    int? wisdom,
    double? challenge_rating,
    int? xp,
    String? $__typename,
  });
  CopyWith$Query$Monsters$monsters$senses<TRes> get senses;
  CopyWith$Query$Monsters$monsters$speed<TRes> get speed;
  TRes armor_class(
    Iterable<Query$Monsters$monsters$armor_class> Function(
      Iterable<
        CopyWith$Query$Monsters$monsters$armor_class<
          Query$Monsters$monsters$armor_class
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$Monsters$monsters<TRes>
    implements CopyWith$Query$Monsters$monsters<TRes> {
  _CopyWithImpl$Query$Monsters$monsters(this._instance, this._then);

  final Query$Monsters$monsters _instance;

  final TRes Function(Query$Monsters$monsters) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? size = _undefined,
    Object? type = _undefined,
    Object? hit_points = _undefined,
    Object? hit_points_roll = _undefined,
    Object? senses = _undefined,
    Object? damage_immunities = _undefined,
    Object? damage_resistances = _undefined,
    Object? damage_vulnerabilities = _undefined,
    Object? hit_dice = _undefined,
    Object? speed = _undefined,
    Object? armor_class = _undefined,
    Object? charisma = _undefined,
    Object? constitution = _undefined,
    Object? dexterity = _undefined,
    Object? intelligence = _undefined,
    Object? strength = _undefined,
    Object? wisdom = _undefined,
    Object? challenge_rating = _undefined,
    Object? xp = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Monsters$monsters(
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      image: image == _undefined ? _instance.image : (image as String?),
      size: size == _undefined || size == null
          ? _instance.size
          : (size as String),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as String),
      hit_points: hit_points == _undefined || hit_points == null
          ? _instance.hit_points
          : (hit_points as int),
      hit_points_roll: hit_points_roll == _undefined || hit_points_roll == null
          ? _instance.hit_points_roll
          : (hit_points_roll as String),
      senses: senses == _undefined || senses == null
          ? _instance.senses
          : (senses as Query$Monsters$monsters$senses),
      damage_immunities:
          damage_immunities == _undefined || damage_immunities == null
          ? _instance.damage_immunities
          : (damage_immunities as List<String>),
      damage_resistances:
          damage_resistances == _undefined || damage_resistances == null
          ? _instance.damage_resistances
          : (damage_resistances as List<String>),
      damage_vulnerabilities:
          damage_vulnerabilities == _undefined || damage_vulnerabilities == null
          ? _instance.damage_vulnerabilities
          : (damage_vulnerabilities as List<String>),
      hit_dice: hit_dice == _undefined || hit_dice == null
          ? _instance.hit_dice
          : (hit_dice as String),
      speed: speed == _undefined || speed == null
          ? _instance.speed
          : (speed as Query$Monsters$monsters$speed),
      armor_class: armor_class == _undefined || armor_class == null
          ? _instance.armor_class
          : (armor_class as List<Query$Monsters$monsters$armor_class>),
      charisma: charisma == _undefined || charisma == null
          ? _instance.charisma
          : (charisma as int),
      constitution: constitution == _undefined || constitution == null
          ? _instance.constitution
          : (constitution as int),
      dexterity: dexterity == _undefined || dexterity == null
          ? _instance.dexterity
          : (dexterity as int),
      intelligence: intelligence == _undefined || intelligence == null
          ? _instance.intelligence
          : (intelligence as int),
      strength: strength == _undefined || strength == null
          ? _instance.strength
          : (strength as int),
      wisdom: wisdom == _undefined || wisdom == null
          ? _instance.wisdom
          : (wisdom as int),
      challenge_rating:
          challenge_rating == _undefined || challenge_rating == null
          ? _instance.challenge_rating
          : (challenge_rating as double),
      xp: xp == _undefined || xp == null ? _instance.xp : (xp as int),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$Monsters$monsters$senses<TRes> get senses {
    final local$senses = _instance.senses;
    return CopyWith$Query$Monsters$monsters$senses(
      local$senses,
      (e) => call(senses: e),
    );
  }

  CopyWith$Query$Monsters$monsters$speed<TRes> get speed {
    final local$speed = _instance.speed;
    return CopyWith$Query$Monsters$monsters$speed(
      local$speed,
      (e) => call(speed: e),
    );
  }

  TRes armor_class(
    Iterable<Query$Monsters$monsters$armor_class> Function(
      Iterable<
        CopyWith$Query$Monsters$monsters$armor_class<
          Query$Monsters$monsters$armor_class
        >
      >,
    )
    _fn,
  ) => call(
    armor_class: _fn(
      _instance.armor_class.map(
        (e) => CopyWith$Query$Monsters$monsters$armor_class(e, (i) => i),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$Monsters$monsters<TRes>
    implements CopyWith$Query$Monsters$monsters<TRes> {
  _CopyWithStubImpl$Query$Monsters$monsters(this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? size,
    String? type,
    int? hit_points,
    String? hit_points_roll,
    Query$Monsters$monsters$senses? senses,
    List<String>? damage_immunities,
    List<String>? damage_resistances,
    List<String>? damage_vulnerabilities,
    String? hit_dice,
    Query$Monsters$monsters$speed? speed,
    List<Query$Monsters$monsters$armor_class>? armor_class,
    int? charisma,
    int? constitution,
    int? dexterity,
    int? intelligence,
    int? strength,
    int? wisdom,
    double? challenge_rating,
    int? xp,
    String? $__typename,
  }) => _res;

  CopyWith$Query$Monsters$monsters$senses<TRes> get senses =>
      CopyWith$Query$Monsters$monsters$senses.stub(_res);

  CopyWith$Query$Monsters$monsters$speed<TRes> get speed =>
      CopyWith$Query$Monsters$monsters$speed.stub(_res);

  armor_class(_fn) => _res;
}

class Query$Monsters$monsters$senses {
  Query$Monsters$monsters$senses({
    this.blindsight,
    this.darkvision,
    required this.passive_perception,
    this.tremorsense,
    this.truesight,
    this.$__typename = 'Sense',
  });

  factory Query$Monsters$monsters$senses.fromJson(Map<String, dynamic> json) {
    final l$blindsight = json['blindsight'];
    final l$darkvision = json['darkvision'];
    final l$passive_perception = json['passive_perception'];
    final l$tremorsense = json['tremorsense'];
    final l$truesight = json['truesight'];
    final l$$__typename = json['__typename'];
    return Query$Monsters$monsters$senses(
      blindsight: (l$blindsight as String?),
      darkvision: (l$darkvision as String?),
      passive_perception: (l$passive_perception as int),
      tremorsense: (l$tremorsense as String?),
      truesight: (l$truesight as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? blindsight;

  final String? darkvision;

  final int passive_perception;

  final String? tremorsense;

  final String? truesight;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$blindsight = blindsight;
    _resultData['blindsight'] = l$blindsight;
    final l$darkvision = darkvision;
    _resultData['darkvision'] = l$darkvision;
    final l$passive_perception = passive_perception;
    _resultData['passive_perception'] = l$passive_perception;
    final l$tremorsense = tremorsense;
    _resultData['tremorsense'] = l$tremorsense;
    final l$truesight = truesight;
    _resultData['truesight'] = l$truesight;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$blindsight = blindsight;
    final l$darkvision = darkvision;
    final l$passive_perception = passive_perception;
    final l$tremorsense = tremorsense;
    final l$truesight = truesight;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$blindsight,
      l$darkvision,
      l$passive_perception,
      l$tremorsense,
      l$truesight,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Monsters$monsters$senses ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$blindsight = blindsight;
    final lOther$blindsight = other.blindsight;
    if (l$blindsight != lOther$blindsight) {
      return false;
    }
    final l$darkvision = darkvision;
    final lOther$darkvision = other.darkvision;
    if (l$darkvision != lOther$darkvision) {
      return false;
    }
    final l$passive_perception = passive_perception;
    final lOther$passive_perception = other.passive_perception;
    if (l$passive_perception != lOther$passive_perception) {
      return false;
    }
    final l$tremorsense = tremorsense;
    final lOther$tremorsense = other.tremorsense;
    if (l$tremorsense != lOther$tremorsense) {
      return false;
    }
    final l$truesight = truesight;
    final lOther$truesight = other.truesight;
    if (l$truesight != lOther$truesight) {
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

extension UtilityExtension$Query$Monsters$monsters$senses
    on Query$Monsters$monsters$senses {
  CopyWith$Query$Monsters$monsters$senses<Query$Monsters$monsters$senses>
  get copyWith => CopyWith$Query$Monsters$monsters$senses(this, (i) => i);
}

abstract class CopyWith$Query$Monsters$monsters$senses<TRes> {
  factory CopyWith$Query$Monsters$monsters$senses(
    Query$Monsters$monsters$senses instance,
    TRes Function(Query$Monsters$monsters$senses) then,
  ) = _CopyWithImpl$Query$Monsters$monsters$senses;

  factory CopyWith$Query$Monsters$monsters$senses.stub(TRes res) =
      _CopyWithStubImpl$Query$Monsters$monsters$senses;

  TRes call({
    String? blindsight,
    String? darkvision,
    int? passive_perception,
    String? tremorsense,
    String? truesight,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Monsters$monsters$senses<TRes>
    implements CopyWith$Query$Monsters$monsters$senses<TRes> {
  _CopyWithImpl$Query$Monsters$monsters$senses(this._instance, this._then);

  final Query$Monsters$monsters$senses _instance;

  final TRes Function(Query$Monsters$monsters$senses) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? blindsight = _undefined,
    Object? darkvision = _undefined,
    Object? passive_perception = _undefined,
    Object? tremorsense = _undefined,
    Object? truesight = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Monsters$monsters$senses(
      blindsight: blindsight == _undefined
          ? _instance.blindsight
          : (blindsight as String?),
      darkvision: darkvision == _undefined
          ? _instance.darkvision
          : (darkvision as String?),
      passive_perception:
          passive_perception == _undefined || passive_perception == null
          ? _instance.passive_perception
          : (passive_perception as int),
      tremorsense: tremorsense == _undefined
          ? _instance.tremorsense
          : (tremorsense as String?),
      truesight: truesight == _undefined
          ? _instance.truesight
          : (truesight as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Monsters$monsters$senses<TRes>
    implements CopyWith$Query$Monsters$monsters$senses<TRes> {
  _CopyWithStubImpl$Query$Monsters$monsters$senses(this._res);

  TRes _res;

  call({
    String? blindsight,
    String? darkvision,
    int? passive_perception,
    String? tremorsense,
    String? truesight,
    String? $__typename,
  }) => _res;
}

class Query$Monsters$monsters$speed {
  Query$Monsters$monsters$speed({
    this.burrow,
    this.climb,
    this.fly,
    this.hover,
    this.swim,
    this.walk,
    this.$__typename = 'MonsterSpeed',
  });

  factory Query$Monsters$monsters$speed.fromJson(Map<String, dynamic> json) {
    final l$burrow = json['burrow'];
    final l$climb = json['climb'];
    final l$fly = json['fly'];
    final l$hover = json['hover'];
    final l$swim = json['swim'];
    final l$walk = json['walk'];
    final l$$__typename = json['__typename'];
    return Query$Monsters$monsters$speed(
      burrow: (l$burrow as String?),
      climb: (l$climb as String?),
      fly: (l$fly as String?),
      hover: (l$hover as bool?),
      swim: (l$swim as String?),
      walk: (l$walk as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? burrow;

  final String? climb;

  final String? fly;

  final bool? hover;

  final String? swim;

  final String? walk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$burrow = burrow;
    _resultData['burrow'] = l$burrow;
    final l$climb = climb;
    _resultData['climb'] = l$climb;
    final l$fly = fly;
    _resultData['fly'] = l$fly;
    final l$hover = hover;
    _resultData['hover'] = l$hover;
    final l$swim = swim;
    _resultData['swim'] = l$swim;
    final l$walk = walk;
    _resultData['walk'] = l$walk;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$burrow = burrow;
    final l$climb = climb;
    final l$fly = fly;
    final l$hover = hover;
    final l$swim = swim;
    final l$walk = walk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$burrow,
      l$climb,
      l$fly,
      l$hover,
      l$swim,
      l$walk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Monsters$monsters$speed ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$burrow = burrow;
    final lOther$burrow = other.burrow;
    if (l$burrow != lOther$burrow) {
      return false;
    }
    final l$climb = climb;
    final lOther$climb = other.climb;
    if (l$climb != lOther$climb) {
      return false;
    }
    final l$fly = fly;
    final lOther$fly = other.fly;
    if (l$fly != lOther$fly) {
      return false;
    }
    final l$hover = hover;
    final lOther$hover = other.hover;
    if (l$hover != lOther$hover) {
      return false;
    }
    final l$swim = swim;
    final lOther$swim = other.swim;
    if (l$swim != lOther$swim) {
      return false;
    }
    final l$walk = walk;
    final lOther$walk = other.walk;
    if (l$walk != lOther$walk) {
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

extension UtilityExtension$Query$Monsters$monsters$speed
    on Query$Monsters$monsters$speed {
  CopyWith$Query$Monsters$monsters$speed<Query$Monsters$monsters$speed>
  get copyWith => CopyWith$Query$Monsters$monsters$speed(this, (i) => i);
}

abstract class CopyWith$Query$Monsters$monsters$speed<TRes> {
  factory CopyWith$Query$Monsters$monsters$speed(
    Query$Monsters$monsters$speed instance,
    TRes Function(Query$Monsters$monsters$speed) then,
  ) = _CopyWithImpl$Query$Monsters$monsters$speed;

  factory CopyWith$Query$Monsters$monsters$speed.stub(TRes res) =
      _CopyWithStubImpl$Query$Monsters$monsters$speed;

  TRes call({
    String? burrow,
    String? climb,
    String? fly,
    bool? hover,
    String? swim,
    String? walk,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Monsters$monsters$speed<TRes>
    implements CopyWith$Query$Monsters$monsters$speed<TRes> {
  _CopyWithImpl$Query$Monsters$monsters$speed(this._instance, this._then);

  final Query$Monsters$monsters$speed _instance;

  final TRes Function(Query$Monsters$monsters$speed) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? burrow = _undefined,
    Object? climb = _undefined,
    Object? fly = _undefined,
    Object? hover = _undefined,
    Object? swim = _undefined,
    Object? walk = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Monsters$monsters$speed(
      burrow: burrow == _undefined ? _instance.burrow : (burrow as String?),
      climb: climb == _undefined ? _instance.climb : (climb as String?),
      fly: fly == _undefined ? _instance.fly : (fly as String?),
      hover: hover == _undefined ? _instance.hover : (hover as bool?),
      swim: swim == _undefined ? _instance.swim : (swim as String?),
      walk: walk == _undefined ? _instance.walk : (walk as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Monsters$monsters$speed<TRes>
    implements CopyWith$Query$Monsters$monsters$speed<TRes> {
  _CopyWithStubImpl$Query$Monsters$monsters$speed(this._res);

  TRes _res;

  call({
    String? burrow,
    String? climb,
    String? fly,
    bool? hover,
    String? swim,
    String? walk,
    String? $__typename,
  }) => _res;
}

class Query$Monsters$monsters$armor_class {
  Query$Monsters$monsters$armor_class({required this.$__typename});

  factory Query$Monsters$monsters$armor_class.fromJson(
    Map<String, dynamic> json,
  ) {
    switch (json["__typename"] as String) {
      case "ArmorClassNatural":
        return Query$Monsters$monsters$armor_class$$ArmorClassNatural.fromJson(
          json,
        );

      case "ArmorClassDex":
        return Query$Monsters$monsters$armor_class$$ArmorClassDex.fromJson(
          json,
        );

      case "ArmorClassArmor":
        return Query$Monsters$monsters$armor_class$$ArmorClassArmor.fromJson(
          json,
        );

      case "ArmorClassSpell":
        return Query$Monsters$monsters$armor_class$$ArmorClassSpell.fromJson(
          json,
        );

      case "ArmorClassCondition":
        return Query$Monsters$monsters$armor_class$$ArmorClassCondition.fromJson(
          json,
        );

      default:
        final l$$__typename = json['__typename'];
        return Query$Monsters$monsters$armor_class(
          $__typename: (l$$__typename as String),
        );
    }
  }

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    return Object.hashAll([l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Monsters$monsters$armor_class ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$Monsters$monsters$armor_class
    on Query$Monsters$monsters$armor_class {
  CopyWith$Query$Monsters$monsters$armor_class<
    Query$Monsters$monsters$armor_class
  >
  get copyWith => CopyWith$Query$Monsters$monsters$armor_class(this, (i) => i);

  _T when<_T>({
    required _T Function(Query$Monsters$monsters$armor_class$$ArmorClassNatural)
    armorClassNatural,
    required _T Function(Query$Monsters$monsters$armor_class$$ArmorClassDex)
    armorClassDex,
    required _T Function(Query$Monsters$monsters$armor_class$$ArmorClassArmor)
    armorClassArmor,
    required _T Function(Query$Monsters$monsters$armor_class$$ArmorClassSpell)
    armorClassSpell,
    required _T Function(
      Query$Monsters$monsters$armor_class$$ArmorClassCondition,
    )
    armorClassCondition,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "ArmorClassNatural":
        return armorClassNatural(
          this as Query$Monsters$monsters$armor_class$$ArmorClassNatural,
        );

      case "ArmorClassDex":
        return armorClassDex(
          this as Query$Monsters$monsters$armor_class$$ArmorClassDex,
        );

      case "ArmorClassArmor":
        return armorClassArmor(
          this as Query$Monsters$monsters$armor_class$$ArmorClassArmor,
        );

      case "ArmorClassSpell":
        return armorClassSpell(
          this as Query$Monsters$monsters$armor_class$$ArmorClassSpell,
        );

      case "ArmorClassCondition":
        return armorClassCondition(
          this as Query$Monsters$monsters$armor_class$$ArmorClassCondition,
        );

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(Query$Monsters$monsters$armor_class$$ArmorClassNatural)?
    armorClassNatural,
    _T Function(Query$Monsters$monsters$armor_class$$ArmorClassDex)?
    armorClassDex,
    _T Function(Query$Monsters$monsters$armor_class$$ArmorClassArmor)?
    armorClassArmor,
    _T Function(Query$Monsters$monsters$armor_class$$ArmorClassSpell)?
    armorClassSpell,
    _T Function(Query$Monsters$monsters$armor_class$$ArmorClassCondition)?
    armorClassCondition,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "ArmorClassNatural":
        if (armorClassNatural != null) {
          return armorClassNatural(
            this as Query$Monsters$monsters$armor_class$$ArmorClassNatural,
          );
        } else {
          return orElse();
        }

      case "ArmorClassDex":
        if (armorClassDex != null) {
          return armorClassDex(
            this as Query$Monsters$monsters$armor_class$$ArmorClassDex,
          );
        } else {
          return orElse();
        }

      case "ArmorClassArmor":
        if (armorClassArmor != null) {
          return armorClassArmor(
            this as Query$Monsters$monsters$armor_class$$ArmorClassArmor,
          );
        } else {
          return orElse();
        }

      case "ArmorClassSpell":
        if (armorClassSpell != null) {
          return armorClassSpell(
            this as Query$Monsters$monsters$armor_class$$ArmorClassSpell,
          );
        } else {
          return orElse();
        }

      case "ArmorClassCondition":
        if (armorClassCondition != null) {
          return armorClassCondition(
            this as Query$Monsters$monsters$armor_class$$ArmorClassCondition,
          );
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Query$Monsters$monsters$armor_class<TRes> {
  factory CopyWith$Query$Monsters$monsters$armor_class(
    Query$Monsters$monsters$armor_class instance,
    TRes Function(Query$Monsters$monsters$armor_class) then,
  ) = _CopyWithImpl$Query$Monsters$monsters$armor_class;

  factory CopyWith$Query$Monsters$monsters$armor_class.stub(TRes res) =
      _CopyWithStubImpl$Query$Monsters$monsters$armor_class;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$Monsters$monsters$armor_class<TRes>
    implements CopyWith$Query$Monsters$monsters$armor_class<TRes> {
  _CopyWithImpl$Query$Monsters$monsters$armor_class(this._instance, this._then);

  final Query$Monsters$monsters$armor_class _instance;

  final TRes Function(Query$Monsters$monsters$armor_class) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
    Query$Monsters$monsters$armor_class(
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Monsters$monsters$armor_class<TRes>
    implements CopyWith$Query$Monsters$monsters$armor_class<TRes> {
  _CopyWithStubImpl$Query$Monsters$monsters$armor_class(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$Monsters$monsters$armor_class$$ArmorClassNatural
    implements Query$Monsters$monsters$armor_class {
  Query$Monsters$monsters$armor_class$$ArmorClassNatural({
    required this.type,
    required this.value,
    this.desc,
    this.$__typename = 'ArmorClassNatural',
  });

  factory Query$Monsters$monsters$armor_class$$ArmorClassNatural.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$type = json['type'];
    final l$value = json['value'];
    final l$desc = json['desc'];
    final l$$__typename = json['__typename'];
    return Query$Monsters$monsters$armor_class$$ArmorClassNatural(
      type: (l$type as String),
      value: (l$value as int),
      desc: (l$desc as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String type;

  final int value;

  final String? desc;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$type = type;
    _resultData['type'] = l$type;
    final l$value = value;
    _resultData['value'] = l$value;
    final l$desc = desc;
    _resultData['desc'] = l$desc;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$value = value;
    final l$desc = desc;
    final l$$__typename = $__typename;
    return Object.hashAll([l$type, l$value, l$desc, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Monsters$monsters$armor_class$$ArmorClassNatural ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
      return false;
    }
    final l$desc = desc;
    final lOther$desc = other.desc;
    if (l$desc != lOther$desc) {
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

extension UtilityExtension$Query$Monsters$monsters$armor_class$$ArmorClassNatural
    on Query$Monsters$monsters$armor_class$$ArmorClassNatural {
  CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassNatural<
    Query$Monsters$monsters$armor_class$$ArmorClassNatural
  >
  get copyWith =>
      CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassNatural(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassNatural<
  TRes
> {
  factory CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassNatural(
    Query$Monsters$monsters$armor_class$$ArmorClassNatural instance,
    TRes Function(Query$Monsters$monsters$armor_class$$ArmorClassNatural) then,
  ) = _CopyWithImpl$Query$Monsters$monsters$armor_class$$ArmorClassNatural;

  factory CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassNatural.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$Monsters$monsters$armor_class$$ArmorClassNatural;

  TRes call({String? type, int? value, String? desc, String? $__typename});
}

class _CopyWithImpl$Query$Monsters$monsters$armor_class$$ArmorClassNatural<TRes>
    implements
        CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassNatural<TRes> {
  _CopyWithImpl$Query$Monsters$monsters$armor_class$$ArmorClassNatural(
    this._instance,
    this._then,
  );

  final Query$Monsters$monsters$armor_class$$ArmorClassNatural _instance;

  final TRes Function(Query$Monsters$monsters$armor_class$$ArmorClassNatural)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? value = _undefined,
    Object? desc = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Monsters$monsters$armor_class$$ArmorClassNatural(
      type: type == _undefined || type == null
          ? _instance.type
          : (type as String),
      value: value == _undefined || value == null
          ? _instance.value
          : (value as int),
      desc: desc == _undefined ? _instance.desc : (desc as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Monsters$monsters$armor_class$$ArmorClassNatural<
  TRes
>
    implements
        CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassNatural<TRes> {
  _CopyWithStubImpl$Query$Monsters$monsters$armor_class$$ArmorClassNatural(
    this._res,
  );

  TRes _res;

  call({String? type, int? value, String? desc, String? $__typename}) => _res;
}

class Query$Monsters$monsters$armor_class$$ArmorClassDex
    implements Query$Monsters$monsters$armor_class {
  Query$Monsters$monsters$armor_class$$ArmorClassDex({
    required this.type,
    required this.value,
    this.desc,
    this.$__typename = 'ArmorClassDex',
  });

  factory Query$Monsters$monsters$armor_class$$ArmorClassDex.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$type = json['type'];
    final l$value = json['value'];
    final l$desc = json['desc'];
    final l$$__typename = json['__typename'];
    return Query$Monsters$monsters$armor_class$$ArmorClassDex(
      type: (l$type as String),
      value: (l$value as int),
      desc: (l$desc as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String type;

  final int value;

  final String? desc;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$type = type;
    _resultData['type'] = l$type;
    final l$value = value;
    _resultData['value'] = l$value;
    final l$desc = desc;
    _resultData['desc'] = l$desc;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$value = value;
    final l$desc = desc;
    final l$$__typename = $__typename;
    return Object.hashAll([l$type, l$value, l$desc, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Monsters$monsters$armor_class$$ArmorClassDex ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
      return false;
    }
    final l$desc = desc;
    final lOther$desc = other.desc;
    if (l$desc != lOther$desc) {
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

extension UtilityExtension$Query$Monsters$monsters$armor_class$$ArmorClassDex
    on Query$Monsters$monsters$armor_class$$ArmorClassDex {
  CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassDex<
    Query$Monsters$monsters$armor_class$$ArmorClassDex
  >
  get copyWith => CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassDex(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassDex<
  TRes
> {
  factory CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassDex(
    Query$Monsters$monsters$armor_class$$ArmorClassDex instance,
    TRes Function(Query$Monsters$monsters$armor_class$$ArmorClassDex) then,
  ) = _CopyWithImpl$Query$Monsters$monsters$armor_class$$ArmorClassDex;

  factory CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassDex.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$Monsters$monsters$armor_class$$ArmorClassDex;

  TRes call({String? type, int? value, String? desc, String? $__typename});
}

class _CopyWithImpl$Query$Monsters$monsters$armor_class$$ArmorClassDex<TRes>
    implements
        CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassDex<TRes> {
  _CopyWithImpl$Query$Monsters$monsters$armor_class$$ArmorClassDex(
    this._instance,
    this._then,
  );

  final Query$Monsters$monsters$armor_class$$ArmorClassDex _instance;

  final TRes Function(Query$Monsters$monsters$armor_class$$ArmorClassDex) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? value = _undefined,
    Object? desc = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$Monsters$monsters$armor_class$$ArmorClassDex(
      type: type == _undefined || type == null
          ? _instance.type
          : (type as String),
      value: value == _undefined || value == null
          ? _instance.value
          : (value as int),
      desc: desc == _undefined ? _instance.desc : (desc as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Monsters$monsters$armor_class$$ArmorClassDex<TRes>
    implements
        CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassDex<TRes> {
  _CopyWithStubImpl$Query$Monsters$monsters$armor_class$$ArmorClassDex(
    this._res,
  );

  TRes _res;

  call({String? type, int? value, String? desc, String? $__typename}) => _res;
}

class Query$Monsters$monsters$armor_class$$ArmorClassArmor
    implements Query$Monsters$monsters$armor_class {
  Query$Monsters$monsters$armor_class$$ArmorClassArmor({
    this.$__typename = 'ArmorClassArmor',
  });

  factory Query$Monsters$monsters$armor_class$$ArmorClassArmor.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$$__typename = json['__typename'];
    return Query$Monsters$monsters$armor_class$$ArmorClassArmor(
      $__typename: (l$$__typename as String),
    );
  }

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    return Object.hashAll([l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Monsters$monsters$armor_class$$ArmorClassArmor ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$Monsters$monsters$armor_class$$ArmorClassArmor
    on Query$Monsters$monsters$armor_class$$ArmorClassArmor {
  CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassArmor<
    Query$Monsters$monsters$armor_class$$ArmorClassArmor
  >
  get copyWith => CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassArmor(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassArmor<
  TRes
> {
  factory CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassArmor(
    Query$Monsters$monsters$armor_class$$ArmorClassArmor instance,
    TRes Function(Query$Monsters$monsters$armor_class$$ArmorClassArmor) then,
  ) = _CopyWithImpl$Query$Monsters$monsters$armor_class$$ArmorClassArmor;

  factory CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassArmor.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$Monsters$monsters$armor_class$$ArmorClassArmor;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$Monsters$monsters$armor_class$$ArmorClassArmor<TRes>
    implements
        CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassArmor<TRes> {
  _CopyWithImpl$Query$Monsters$monsters$armor_class$$ArmorClassArmor(
    this._instance,
    this._then,
  );

  final Query$Monsters$monsters$armor_class$$ArmorClassArmor _instance;

  final TRes Function(Query$Monsters$monsters$armor_class$$ArmorClassArmor)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
    Query$Monsters$monsters$armor_class$$ArmorClassArmor(
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Monsters$monsters$armor_class$$ArmorClassArmor<
  TRes
>
    implements
        CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassArmor<TRes> {
  _CopyWithStubImpl$Query$Monsters$monsters$armor_class$$ArmorClassArmor(
    this._res,
  );

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$Monsters$monsters$armor_class$$ArmorClassSpell
    implements Query$Monsters$monsters$armor_class {
  Query$Monsters$monsters$armor_class$$ArmorClassSpell({
    this.$__typename = 'ArmorClassSpell',
  });

  factory Query$Monsters$monsters$armor_class$$ArmorClassSpell.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$$__typename = json['__typename'];
    return Query$Monsters$monsters$armor_class$$ArmorClassSpell(
      $__typename: (l$$__typename as String),
    );
  }

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    return Object.hashAll([l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Monsters$monsters$armor_class$$ArmorClassSpell ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$Monsters$monsters$armor_class$$ArmorClassSpell
    on Query$Monsters$monsters$armor_class$$ArmorClassSpell {
  CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassSpell<
    Query$Monsters$monsters$armor_class$$ArmorClassSpell
  >
  get copyWith => CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassSpell(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassSpell<
  TRes
> {
  factory CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassSpell(
    Query$Monsters$monsters$armor_class$$ArmorClassSpell instance,
    TRes Function(Query$Monsters$monsters$armor_class$$ArmorClassSpell) then,
  ) = _CopyWithImpl$Query$Monsters$monsters$armor_class$$ArmorClassSpell;

  factory CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassSpell.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$Monsters$monsters$armor_class$$ArmorClassSpell;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$Monsters$monsters$armor_class$$ArmorClassSpell<TRes>
    implements
        CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassSpell<TRes> {
  _CopyWithImpl$Query$Monsters$monsters$armor_class$$ArmorClassSpell(
    this._instance,
    this._then,
  );

  final Query$Monsters$monsters$armor_class$$ArmorClassSpell _instance;

  final TRes Function(Query$Monsters$monsters$armor_class$$ArmorClassSpell)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
    Query$Monsters$monsters$armor_class$$ArmorClassSpell(
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Monsters$monsters$armor_class$$ArmorClassSpell<
  TRes
>
    implements
        CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassSpell<TRes> {
  _CopyWithStubImpl$Query$Monsters$monsters$armor_class$$ArmorClassSpell(
    this._res,
  );

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$Monsters$monsters$armor_class$$ArmorClassCondition
    implements Query$Monsters$monsters$armor_class {
  Query$Monsters$monsters$armor_class$$ArmorClassCondition({
    this.$__typename = 'ArmorClassCondition',
  });

  factory Query$Monsters$monsters$armor_class$$ArmorClassCondition.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$$__typename = json['__typename'];
    return Query$Monsters$monsters$armor_class$$ArmorClassCondition(
      $__typename: (l$$__typename as String),
    );
  }

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    return Object.hashAll([l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$Monsters$monsters$armor_class$$ArmorClassCondition ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$Monsters$monsters$armor_class$$ArmorClassCondition
    on Query$Monsters$monsters$armor_class$$ArmorClassCondition {
  CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassCondition<
    Query$Monsters$monsters$armor_class$$ArmorClassCondition
  >
  get copyWith =>
      CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassCondition(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassCondition<
  TRes
> {
  factory CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassCondition(
    Query$Monsters$monsters$armor_class$$ArmorClassCondition instance,
    TRes Function(Query$Monsters$monsters$armor_class$$ArmorClassCondition)
    then,
  ) = _CopyWithImpl$Query$Monsters$monsters$armor_class$$ArmorClassCondition;

  factory CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassCondition.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$Monsters$monsters$armor_class$$ArmorClassCondition;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$Monsters$monsters$armor_class$$ArmorClassCondition<
  TRes
>
    implements
        CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassCondition<
          TRes
        > {
  _CopyWithImpl$Query$Monsters$monsters$armor_class$$ArmorClassCondition(
    this._instance,
    this._then,
  );

  final Query$Monsters$monsters$armor_class$$ArmorClassCondition _instance;

  final TRes Function(Query$Monsters$monsters$armor_class$$ArmorClassCondition)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
    Query$Monsters$monsters$armor_class$$ArmorClassCondition(
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$Monsters$monsters$armor_class$$ArmorClassCondition<
  TRes
>
    implements
        CopyWith$Query$Monsters$monsters$armor_class$$ArmorClassCondition<
          TRes
        > {
  _CopyWithStubImpl$Query$Monsters$monsters$armor_class$$ArmorClassCondition(
    this._res,
  );

  TRes _res;

  call({String? $__typename}) => _res;
}
