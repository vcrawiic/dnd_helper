import '../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Query$Monsters {
  factory Variables$Query$Monsters(Input$MonsterOrder graphQL, {
    Input$MonsterOrder? order,
    int? limit,
    int? skip,
  }) => Variables$Query$Monsters._({
    if (order != null) r'order': order,
    if (limit != null) r'limit': limit,
    if (skip != null) r'skip': skip,
  });

  Variables$Query$Monsters._(this._$data);

  factory Variables$Query$Monsters.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('order')) {
      final l$order = data['order'];
      result$data['order'] = l$order == null
          ? null
          : Input$MonsterOrder.fromJson((l$order as Map<String, dynamic>));
    }
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    if (data.containsKey('skip')) {
      final l$skip = data['skip'];
      result$data['skip'] = (l$skip as int?);
    }
    return Variables$Query$Monsters._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$MonsterOrder? get order => (_$data['order'] as Input$MonsterOrder?);

  int? get limit => (_$data['limit'] as int?);

  int? get skip => (_$data['skip'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('order')) {
      final l$order = order;
      result$data['order'] = l$order?.toJson();
    }
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    if (_$data.containsKey('skip')) {
      final l$skip = skip;
      result$data['skip'] = l$skip;
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
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (_$data.containsKey('limit') != other._$data.containsKey('limit')) {
      return false;
    }
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$skip = skip;
    final lOther$skip = other.skip;
    if (_$data.containsKey('skip') != other._$data.containsKey('skip')) {
      return false;
    }
    if (l$skip != lOther$skip) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$order = order;
    final l$limit = limit;
    final l$skip = skip;
    return Object.hashAll([
      _$data.containsKey('order') ? l$order : const {},
      _$data.containsKey('limit') ? l$limit : const {},
      _$data.containsKey('skip') ? l$skip : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$Monsters<TRes> {
  factory CopyWith$Variables$Query$Monsters(
    Variables$Query$Monsters instance,
    TRes Function(Variables$Query$Monsters) then,
  ) = _CopyWithImpl$Variables$Query$Monsters;

  factory CopyWith$Variables$Query$Monsters.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Monsters;

  TRes call({Input$MonsterOrder? order, int? limit, int? skip});
}

class _CopyWithImpl$Variables$Query$Monsters<TRes>
    implements CopyWith$Variables$Query$Monsters<TRes> {
  _CopyWithImpl$Variables$Query$Monsters(this._instance, this._then);

  final Variables$Query$Monsters _instance;

  final TRes Function(Variables$Query$Monsters) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? order = _undefined,
    Object? limit = _undefined,
    Object? skip = _undefined,
  }) => _then(
    Variables$Query$Monsters._({
      ..._instance._$data,
      if (order != _undefined) 'order': (order as Input$MonsterOrder?),
      if (limit != _undefined) 'limit': (limit as int?),
      if (skip != _undefined) 'skip': (skip as int?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$Monsters<TRes>
    implements CopyWith$Variables$Query$Monsters<TRes> {
  _CopyWithStubImpl$Variables$Query$Monsters(this._res);

  final TRes _res;

  @override
  call({Input$MonsterOrder? order, int? limit, int? skip}) => _res;
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
    final resultData = <String, dynamic>{};
    final l$monsters = monsters;
    resultData['monsters'] = l$monsters.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
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
    fn,
  );
}

class _CopyWithImpl$Query$Monsters<TRes>
    implements CopyWith$Query$Monsters<TRes> {
  _CopyWithImpl$Query$Monsters(this._instance, this._then);

  final Query$Monsters _instance;

  final TRes Function(Query$Monsters) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
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

  @override
  TRes monsters(
    Iterable<Query$Monsters$monsters> Function(
      Iterable<CopyWith$Query$Monsters$monsters<Query$Monsters$monsters>>,
    )
    fn,
  ) => call(
    monsters: fn(
      _instance.monsters.map(
        (e) => CopyWith$Query$Monsters$monsters(e, (i) => i),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$Monsters<TRes>
    implements CopyWith$Query$Monsters<TRes> {
  _CopyWithStubImpl$Query$Monsters(this._res);

  final TRes _res;

  @override
  call({List<Query$Monsters$monsters>? monsters, String? $__typename}) => _res;

  @override
  monsters(fn) => _res;
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
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'limit')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'skip')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
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
              ArgumentNode(
                name: NameNode(value: 'limit'),
                value: VariableNode(name: NameNode(value: 'limit')),
              ),
              ArgumentNode(
                name: NameNode(value: 'skip'),
                value: VariableNode(name: NameNode(value: 'skip')),
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
    final l$hitPoints = json['hit_points'];
    final l$hitPointsRoll = json['hit_points_roll'];
    final l$senses = json['senses'];
    final l$damageImmunities = json['damage_immunities'];
    final l$damageResistances = json['damage_resistances'];
    final l$damageVulnerabilities = json['damage_vulnerabilities'];
    final l$hitDice = json['hit_dice'];
    final l$speed = json['speed'];
    final l$armorClass = json['armor_class'];
    final l$charisma = json['charisma'];
    final l$constitution = json['constitution'];
    final l$dexterity = json['dexterity'];
    final l$intelligence = json['intelligence'];
    final l$strength = json['strength'];
    final l$wisdom = json['wisdom'];
    final l$challengeRating = json['challenge_rating'];
    final l$xp = json['xp'];
    final l$$__typename = json['__typename'];
    return Query$Monsters$monsters(
      name: (l$name as String),
      image: (l$image as String?),
      size: (l$size as String),
      type: (l$type as String),
      hit_points: (l$hitPoints as int),
      hit_points_roll: (l$hitPointsRoll as String),
      senses: Query$Monsters$monsters$senses.fromJson(
        (l$senses as Map<String, dynamic>),
      ),
      damage_immunities: (l$damageImmunities as List<dynamic>)
          .map((e) => (e as String))
          .toList(),
      damage_resistances: (l$damageResistances as List<dynamic>)
          .map((e) => (e as String))
          .toList(),
      damage_vulnerabilities: (l$damageVulnerabilities as List<dynamic>)
          .map((e) => (e as String))
          .toList(),
      hit_dice: (l$hitDice as String),
      speed: Query$Monsters$monsters$speed.fromJson(
        (l$speed as Map<String, dynamic>),
      ),
      armor_class: (l$armorClass as List<dynamic>)
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
      challenge_rating: (l$challengeRating as num).toDouble(),
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
    final resultData = <String, dynamic>{};
    final l$name = name;
    resultData['name'] = l$name;
    final l$image = image;
    resultData['image'] = l$image;
    final l$size = size;
    resultData['size'] = l$size;
    final l$type = type;
    resultData['type'] = l$type;
    final l$hitPoints = hit_points;
    resultData['hit_points'] = l$hitPoints;
    final l$hitPointsRoll = hit_points_roll;
    resultData['hit_points_roll'] = l$hitPointsRoll;
    final l$senses = senses;
    resultData['senses'] = l$senses.toJson();
    final l$damageImmunities = damage_immunities;
    resultData['damage_immunities'] = l$damageImmunities
        .map((e) => e)
        .toList();
    final l$damageResistances = damage_resistances;
    resultData['damage_resistances'] = l$damageResistances
        .map((e) => e)
        .toList();
    final l$damageVulnerabilities = damage_vulnerabilities;
    resultData['damage_vulnerabilities'] = l$damageVulnerabilities
        .map((e) => e)
        .toList();
    final l$hitDice = hit_dice;
    resultData['hit_dice'] = l$hitDice;
    final l$speed = speed;
    resultData['speed'] = l$speed.toJson();
    final l$armorClass = armor_class;
    resultData['armor_class'] = l$armorClass.map((e) => e.toJson()).toList();
    final l$charisma = charisma;
    resultData['charisma'] = l$charisma;
    final l$constitution = constitution;
    resultData['constitution'] = l$constitution;
    final l$dexterity = dexterity;
    resultData['dexterity'] = l$dexterity;
    final l$intelligence = intelligence;
    resultData['intelligence'] = l$intelligence;
    final l$strength = strength;
    resultData['strength'] = l$strength;
    final l$wisdom = wisdom;
    resultData['wisdom'] = l$wisdom;
    final l$challengeRating = challenge_rating;
    resultData['challenge_rating'] = l$challengeRating;
    final l$xp = xp;
    resultData['xp'] = l$xp;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$image = image;
    final l$size = size;
    final l$type = type;
    final l$hitPoints = hit_points;
    final l$hitPointsRoll = hit_points_roll;
    final l$senses = senses;
    final l$damageImmunities = damage_immunities;
    final l$damageResistances = damage_resistances;
    final l$damageVulnerabilities = damage_vulnerabilities;
    final l$hitDice = hit_dice;
    final l$speed = speed;
    final l$armorClass = armor_class;
    final l$charisma = charisma;
    final l$constitution = constitution;
    final l$dexterity = dexterity;
    final l$intelligence = intelligence;
    final l$strength = strength;
    final l$wisdom = wisdom;
    final l$challengeRating = challenge_rating;
    final l$xp = xp;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$image,
      l$size,
      l$type,
      l$hitPoints,
      l$hitPointsRoll,
      l$senses,
      Object.hashAll(l$damageImmunities.map((v) => v)),
      Object.hashAll(l$damageResistances.map((v) => v)),
      Object.hashAll(l$damageVulnerabilities.map((v) => v)),
      l$hitDice,
      l$speed,
      Object.hashAll(l$armorClass.map((v) => v)),
      l$charisma,
      l$constitution,
      l$dexterity,
      l$intelligence,
      l$strength,
      l$wisdom,
      l$challengeRating,
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
    final l$hitPoints = hit_points;
    final lother$hitPoints = other.hit_points;
    if (l$hitPoints != lother$hitPoints) {
      return false;
    }
    final l$hitPointsRoll = hit_points_roll;
    final lother$hitPointsRoll = other.hit_points_roll;
    if (l$hitPointsRoll != lother$hitPointsRoll) {
      return false;
    }
    final l$senses = senses;
    final lOther$senses = other.senses;
    if (l$senses != lOther$senses) {
      return false;
    }
    final l$damageImmunities = damage_immunities;
    final lother$damageImmunities = other.damage_immunities;
    if (l$damageImmunities.length != lother$damageImmunities.length) {
      return false;
    }
    for (int i = 0; i < l$damageImmunities.length; i++) {
      final l$damageImmunities$entry = l$damageImmunities[i];
      final lother$damageImmunities$entry = lother$damageImmunities[i];
      if (l$damageImmunities$entry != lother$damageImmunities$entry) {
        return false;
      }
    }
    final l$damageResistances = damage_resistances;
    final lother$damageResistances = other.damage_resistances;
    if (l$damageResistances.length != lother$damageResistances.length) {
      return false;
    }
    for (int i = 0; i < l$damageResistances.length; i++) {
      final l$damageResistances$entry = l$damageResistances[i];
      final lother$damageResistances$entry = lother$damageResistances[i];
      if (l$damageResistances$entry != lother$damageResistances$entry) {
        return false;
      }
    }
    final l$damageVulnerabilities = damage_vulnerabilities;
    final lother$damageVulnerabilities = other.damage_vulnerabilities;
    if (l$damageVulnerabilities.length !=
        lother$damageVulnerabilities.length) {
      return false;
    }
    for (int i = 0; i < l$damageVulnerabilities.length; i++) {
      final l$damageVulnerabilities$entry = l$damageVulnerabilities[i];
      final lother$damageVulnerabilities$entry =
          lother$damageVulnerabilities[i];
      if (l$damageVulnerabilities$entry !=
          lother$damageVulnerabilities$entry) {
        return false;
      }
    }
    final l$hitDice = hit_dice;
    final lother$hitDice = other.hit_dice;
    if (l$hitDice != lother$hitDice) {
      return false;
    }
    final l$speed = speed;
    final lOther$speed = other.speed;
    if (l$speed != lOther$speed) {
      return false;
    }
    final l$armorClass = armor_class;
    final lother$armorClass = other.armor_class;
    if (l$armorClass.length != lother$armorClass.length) {
      return false;
    }
    for (int i = 0; i < l$armorClass.length; i++) {
      final l$armorClass$entry = l$armorClass[i];
      final lother$armorClass$entry = lother$armorClass[i];
      if (l$armorClass$entry != lother$armorClass$entry) {
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
    final l$challengeRating = challenge_rating;
    final lother$challengeRating = other.challenge_rating;
    if (l$challengeRating != lother$challengeRating) {
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
    fn,
  );
}

class _CopyWithImpl$Query$Monsters$monsters<TRes>
    implements CopyWith$Query$Monsters$monsters<TRes> {
  _CopyWithImpl$Query$Monsters$monsters(this._instance, this._then);

  final Query$Monsters$monsters _instance;

  final TRes Function(Query$Monsters$monsters) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
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

  @override
  CopyWith$Query$Monsters$monsters$senses<TRes> get senses {
    final local$senses = _instance.senses;
    return CopyWith$Query$Monsters$monsters$senses(
      local$senses,
      (e) => call(senses: e),
    );
  }

  @override
  CopyWith$Query$Monsters$monsters$speed<TRes> get speed {
    final local$speed = _instance.speed;
    return CopyWith$Query$Monsters$monsters$speed(
      local$speed,
      (e) => call(speed: e),
    );
  }

  @override
  TRes armor_class(
    Iterable<Query$Monsters$monsters$armor_class> Function(
      Iterable<
        CopyWith$Query$Monsters$monsters$armor_class<
          Query$Monsters$monsters$armor_class
        >
      >,
    )
    fn,
  ) => call(
    armor_class: fn(
      _instance.armor_class.map(
        (e) => CopyWith$Query$Monsters$monsters$armor_class(e, (i) => i),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$Monsters$monsters<TRes>
    implements CopyWith$Query$Monsters$monsters<TRes> {
  _CopyWithStubImpl$Query$Monsters$monsters(this._res);

  final TRes _res;

  @override
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

  @override
  CopyWith$Query$Monsters$monsters$senses<TRes> get senses =>
      CopyWith$Query$Monsters$monsters$senses.stub(_res);

  @override
  CopyWith$Query$Monsters$monsters$speed<TRes> get speed =>
      CopyWith$Query$Monsters$monsters$speed.stub(_res);

  @override
  armor_class(fn) => _res;
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
    final l$passivePerception = json['passive_perception'];
    final l$tremorsense = json['tremorsense'];
    final l$truesight = json['truesight'];
    final l$$__typename = json['__typename'];
    return Query$Monsters$monsters$senses(
      blindsight: (l$blindsight as String?),
      darkvision: (l$darkvision as String?),
      passive_perception: (l$passivePerception as int),
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
    final resultData = <String, dynamic>{};
    final l$blindsight = blindsight;
    resultData['blindsight'] = l$blindsight;
    final l$darkvision = darkvision;
    resultData['darkvision'] = l$darkvision;
    final l$passivePerception = passive_perception;
    resultData['passive_perception'] = l$passivePerception;
    final l$tremorsense = tremorsense;
    resultData['tremorsense'] = l$tremorsense;
    final l$truesight = truesight;
    resultData['truesight'] = l$truesight;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$blindsight = blindsight;
    final l$darkvision = darkvision;
    final l$passivePerception = passive_perception;
    final l$tremorsense = tremorsense;
    final l$truesight = truesight;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$blindsight,
      l$darkvision,
      l$passivePerception,
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
    final l$passivePerception = passive_perception;
    final lother$passivePerception = other.passive_perception;
    if (l$passivePerception != lother$passivePerception) {
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

  @override
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

  final TRes _res;

  @override
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
    final resultData = <String, dynamic>{};
    final l$burrow = burrow;
    resultData['burrow'] = l$burrow;
    final l$climb = climb;
    resultData['climb'] = l$climb;
    final l$fly = fly;
    resultData['fly'] = l$fly;
    final l$hover = hover;
    resultData['hover'] = l$hover;
    final l$swim = swim;
    resultData['swim'] = l$swim;
    final l$walk = walk;
    resultData['walk'] = l$walk;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
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

  @override
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

  final TRes _res;

  @override
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
    final resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
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

  @override
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

  final TRes _res;

  @override
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

  @override
  final String $__typename;

  @override
  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$type = type;
    resultData['type'] = l$type;
    final l$value = value;
    resultData['value'] = l$value;
    final l$desc = desc;
    resultData['desc'] = l$desc;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
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

  @override
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

  final TRes _res;

  @override
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

  @override
  final String $__typename;

  @override
  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$type = type;
    resultData['type'] = l$type;
    final l$value = value;
    resultData['value'] = l$value;
    final l$desc = desc;
    resultData['desc'] = l$desc;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
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

  @override
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

  final TRes _res;

  @override
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

  @override
  final String $__typename;

  @override
  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
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

  @override
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

  final TRes _res;

  @override
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

  @override
  final String $__typename;

  @override
  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
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

  @override
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

  final TRes _res;

  @override
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

  @override
  final String $__typename;

  @override
  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
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

  @override
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

  final TRes _res;

  @override
  call({String? $__typename}) => _res;
}
