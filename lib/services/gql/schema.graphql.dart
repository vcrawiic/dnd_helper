// ignore_for_file: non_constant_identifier_names, annotate_overrides, prefer_final_fields, camel_case_types

class Input$AbilityScoreOrder {
  factory Input$AbilityScoreOrder({
    required Enum$AbilityScoreOrderField by,
    required Enum$OrderByDirection direction,
    Input$AbilityScoreOrder? then_by,
  }) => Input$AbilityScoreOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$AbilityScoreOrder._(this._$data);

  factory Input$AbilityScoreOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$AbilityScoreOrderField((l$by as String));
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$AbilityScoreOrder.fromJson(
              (l$then_by as Map<String, dynamic>),
            );
    }
    return Input$AbilityScoreOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$AbilityScoreOrderField get by =>
      (_$data['by'] as Enum$AbilityScoreOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$AbilityScoreOrder? get then_by =>
      (_$data['then_by'] as Input$AbilityScoreOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$AbilityScoreOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$AbilityScoreOrder<Input$AbilityScoreOrder> get copyWith =>
      CopyWith$Input$AbilityScoreOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$AbilityScoreOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$AbilityScoreOrder<TRes> {
  factory CopyWith$Input$AbilityScoreOrder(
    Input$AbilityScoreOrder instance,
    TRes Function(Input$AbilityScoreOrder) then,
  ) = _CopyWithImpl$Input$AbilityScoreOrder;

  factory CopyWith$Input$AbilityScoreOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$AbilityScoreOrder;

  TRes call({
    Enum$AbilityScoreOrderField? by,
    Enum$OrderByDirection? direction,
    Input$AbilityScoreOrder? then_by,
  });
  CopyWith$Input$AbilityScoreOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$AbilityScoreOrder<TRes>
    implements CopyWith$Input$AbilityScoreOrder<TRes> {
  _CopyWithImpl$Input$AbilityScoreOrder(this._instance, this._then);

  final Input$AbilityScoreOrder _instance;

  final TRes Function(Input$AbilityScoreOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$AbilityScoreOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null)
        'by': (by as Enum$AbilityScoreOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined)
        'then_by': (then_by as Input$AbilityScoreOrder?),
    }),
  );

  CopyWith$Input$AbilityScoreOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$AbilityScoreOrder.stub(_then(_instance))
        : CopyWith$Input$AbilityScoreOrder(
            local$then_by,
            (e) => call(then_by: e),
          );
  }
}

class _CopyWithStubImpl$Input$AbilityScoreOrder<TRes>
    implements CopyWith$Input$AbilityScoreOrder<TRes> {
  _CopyWithStubImpl$Input$AbilityScoreOrder(this._res);

  TRes _res;

  call({
    Enum$AbilityScoreOrderField? by,
    Enum$OrderByDirection? direction,
    Input$AbilityScoreOrder? then_by,
  }) => _res;

  CopyWith$Input$AbilityScoreOrder<TRes> get then_by =>
      CopyWith$Input$AbilityScoreOrder.stub(_res);
}

class Input$AlignmentOrder {
  factory Input$AlignmentOrder({
    required Enum$AlignmentOrderField by,
    required Enum$OrderByDirection direction,
    Input$AlignmentOrder? then_by,
  }) => Input$AlignmentOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$AlignmentOrder._(this._$data);

  factory Input$AlignmentOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$AlignmentOrderField((l$by as String));
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$AlignmentOrder.fromJson((l$then_by as Map<String, dynamic>));
    }
    return Input$AlignmentOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$AlignmentOrderField get by => (_$data['by'] as Enum$AlignmentOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$AlignmentOrder? get then_by =>
      (_$data['then_by'] as Input$AlignmentOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$AlignmentOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$AlignmentOrder<Input$AlignmentOrder> get copyWith =>
      CopyWith$Input$AlignmentOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$AlignmentOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$AlignmentOrder<TRes> {
  factory CopyWith$Input$AlignmentOrder(
    Input$AlignmentOrder instance,
    TRes Function(Input$AlignmentOrder) then,
  ) = _CopyWithImpl$Input$AlignmentOrder;

  factory CopyWith$Input$AlignmentOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$AlignmentOrder;

  TRes call({
    Enum$AlignmentOrderField? by,
    Enum$OrderByDirection? direction,
    Input$AlignmentOrder? then_by,
  });
  CopyWith$Input$AlignmentOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$AlignmentOrder<TRes>
    implements CopyWith$Input$AlignmentOrder<TRes> {
  _CopyWithImpl$Input$AlignmentOrder(this._instance, this._then);

  final Input$AlignmentOrder _instance;

  final TRes Function(Input$AlignmentOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$AlignmentOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null)
        'by': (by as Enum$AlignmentOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined) 'then_by': (then_by as Input$AlignmentOrder?),
    }),
  );

  CopyWith$Input$AlignmentOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$AlignmentOrder.stub(_then(_instance))
        : CopyWith$Input$AlignmentOrder(local$then_by, (e) => call(then_by: e));
  }
}

class _CopyWithStubImpl$Input$AlignmentOrder<TRes>
    implements CopyWith$Input$AlignmentOrder<TRes> {
  _CopyWithStubImpl$Input$AlignmentOrder(this._res);

  TRes _res;

  call({
    Enum$AlignmentOrderField? by,
    Enum$OrderByDirection? direction,
    Input$AlignmentOrder? then_by,
  }) => _res;

  CopyWith$Input$AlignmentOrder<TRes> get then_by =>
      CopyWith$Input$AlignmentOrder.stub(_res);
}

class Input$BackgroundOrder {
  factory Input$BackgroundOrder({
    required Enum$BackgroundOrderField by,
    required Enum$OrderByDirection direction,
    Input$BackgroundOrder? then_by,
  }) => Input$BackgroundOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$BackgroundOrder._(this._$data);

  factory Input$BackgroundOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$BackgroundOrderField((l$by as String));
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$BackgroundOrder.fromJson((l$then_by as Map<String, dynamic>));
    }
    return Input$BackgroundOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$BackgroundOrderField get by =>
      (_$data['by'] as Enum$BackgroundOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$BackgroundOrder? get then_by =>
      (_$data['then_by'] as Input$BackgroundOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$BackgroundOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$BackgroundOrder<Input$BackgroundOrder> get copyWith =>
      CopyWith$Input$BackgroundOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$BackgroundOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$BackgroundOrder<TRes> {
  factory CopyWith$Input$BackgroundOrder(
    Input$BackgroundOrder instance,
    TRes Function(Input$BackgroundOrder) then,
  ) = _CopyWithImpl$Input$BackgroundOrder;

  factory CopyWith$Input$BackgroundOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$BackgroundOrder;

  TRes call({
    Enum$BackgroundOrderField? by,
    Enum$OrderByDirection? direction,
    Input$BackgroundOrder? then_by,
  });
  CopyWith$Input$BackgroundOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$BackgroundOrder<TRes>
    implements CopyWith$Input$BackgroundOrder<TRes> {
  _CopyWithImpl$Input$BackgroundOrder(this._instance, this._then);

  final Input$BackgroundOrder _instance;

  final TRes Function(Input$BackgroundOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$BackgroundOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null)
        'by': (by as Enum$BackgroundOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined) 'then_by': (then_by as Input$BackgroundOrder?),
    }),
  );

  CopyWith$Input$BackgroundOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$BackgroundOrder.stub(_then(_instance))
        : CopyWith$Input$BackgroundOrder(
            local$then_by,
            (e) => call(then_by: e),
          );
  }
}

class _CopyWithStubImpl$Input$BackgroundOrder<TRes>
    implements CopyWith$Input$BackgroundOrder<TRes> {
  _CopyWithStubImpl$Input$BackgroundOrder(this._res);

  TRes _res;

  call({
    Enum$BackgroundOrderField? by,
    Enum$OrderByDirection? direction,
    Input$BackgroundOrder? then_by,
  }) => _res;

  CopyWith$Input$BackgroundOrder<TRes> get then_by =>
      CopyWith$Input$BackgroundOrder.stub(_res);
}

class Input$NumberFilterInput {
  factory Input$NumberFilterInput({
    int? eq,
    List<int>? $in,
    List<int>? nin,
    Input$NumberRangeFilterInput? range,
  }) => Input$NumberFilterInput._({
    if (eq != null) r'eq': eq,
    if ($in != null) r'in': $in,
    if (nin != null) r'nin': nin,
    if (range != null) r'range': range,
  });

  Input$NumberFilterInput._(this._$data);

  factory Input$NumberFilterInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as int?);
    }
    if (data.containsKey('in')) {
      final l$$in = data['in'];
      result$data['in'] = (l$$in as List<dynamic>?)
          ?.map((e) => (e as int))
          .toList();
    }
    if (data.containsKey('nin')) {
      final l$nin = data['nin'];
      result$data['nin'] = (l$nin as List<dynamic>?)
          ?.map((e) => (e as int))
          .toList();
    }
    if (data.containsKey('range')) {
      final l$range = data['range'];
      result$data['range'] = l$range == null
          ? null
          : Input$NumberRangeFilterInput.fromJson(
              (l$range as Map<String, dynamic>),
            );
    }
    return Input$NumberFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get eq => (_$data['eq'] as int?);

  List<int>? get $in => (_$data['in'] as List<int>?);

  List<int>? get nin => (_$data['nin'] as List<int>?);

  Input$NumberRangeFilterInput? get range =>
      (_$data['range'] as Input$NumberRangeFilterInput?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq;
    }
    if (_$data.containsKey('in')) {
      final l$$in = $in;
      result$data['in'] = l$$in?.map((e) => e).toList();
    }
    if (_$data.containsKey('nin')) {
      final l$nin = nin;
      result$data['nin'] = l$nin?.map((e) => e).toList();
    }
    if (_$data.containsKey('range')) {
      final l$range = range;
      result$data['range'] = l$range?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$NumberFilterInput<Input$NumberFilterInput> get copyWith =>
      CopyWith$Input$NumberFilterInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$NumberFilterInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != lOther$eq) {
      return false;
    }
    final l$$in = $in;
    final lOther$$in = other.$in;
    if (_$data.containsKey('in') != other._$data.containsKey('in')) {
      return false;
    }
    if (l$$in != null && lOther$$in != null) {
      if (l$$in.length != lOther$$in.length) {
        return false;
      }
      for (int i = 0; i < l$$in.length; i++) {
        final l$$in$entry = l$$in[i];
        final lOther$$in$entry = lOther$$in[i];
        if (l$$in$entry != lOther$$in$entry) {
          return false;
        }
      }
    } else if (l$$in != lOther$$in) {
      return false;
    }
    final l$nin = nin;
    final lOther$nin = other.nin;
    if (_$data.containsKey('nin') != other._$data.containsKey('nin')) {
      return false;
    }
    if (l$nin != null && lOther$nin != null) {
      if (l$nin.length != lOther$nin.length) {
        return false;
      }
      for (int i = 0; i < l$nin.length; i++) {
        final l$nin$entry = l$nin[i];
        final lOther$nin$entry = lOther$nin[i];
        if (l$nin$entry != lOther$nin$entry) {
          return false;
        }
      }
    } else if (l$nin != lOther$nin) {
      return false;
    }
    final l$range = range;
    final lOther$range = other.range;
    if (_$data.containsKey('range') != other._$data.containsKey('range')) {
      return false;
    }
    if (l$range != lOther$range) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$eq = eq;
    final l$$in = $in;
    final l$nin = nin;
    final l$range = range;
    return Object.hashAll([
      _$data.containsKey('eq') ? l$eq : const {},
      _$data.containsKey('in')
          ? l$$in == null
                ? null
                : Object.hashAll(l$$in.map((v) => v))
          : const {},
      _$data.containsKey('nin')
          ? l$nin == null
                ? null
                : Object.hashAll(l$nin.map((v) => v))
          : const {},
      _$data.containsKey('range') ? l$range : const {},
    ]);
  }
}

abstract class CopyWith$Input$NumberFilterInput<TRes> {
  factory CopyWith$Input$NumberFilterInput(
    Input$NumberFilterInput instance,
    TRes Function(Input$NumberFilterInput) then,
  ) = _CopyWithImpl$Input$NumberFilterInput;

  factory CopyWith$Input$NumberFilterInput.stub(TRes res) =
      _CopyWithStubImpl$Input$NumberFilterInput;

  TRes call({
    int? eq,
    List<int>? $in,
    List<int>? nin,
    Input$NumberRangeFilterInput? range,
  });
  CopyWith$Input$NumberRangeFilterInput<TRes> get range;
}

class _CopyWithImpl$Input$NumberFilterInput<TRes>
    implements CopyWith$Input$NumberFilterInput<TRes> {
  _CopyWithImpl$Input$NumberFilterInput(this._instance, this._then);

  final Input$NumberFilterInput _instance;

  final TRes Function(Input$NumberFilterInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? eq = _undefined,
    Object? $in = _undefined,
    Object? nin = _undefined,
    Object? range = _undefined,
  }) => _then(
    Input$NumberFilterInput._({
      ..._instance._$data,
      if (eq != _undefined) 'eq': (eq as int?),
      if ($in != _undefined) 'in': ($in as List<int>?),
      if (nin != _undefined) 'nin': (nin as List<int>?),
      if (range != _undefined)
        'range': (range as Input$NumberRangeFilterInput?),
    }),
  );

  CopyWith$Input$NumberRangeFilterInput<TRes> get range {
    final local$range = _instance.range;
    return local$range == null
        ? CopyWith$Input$NumberRangeFilterInput.stub(_then(_instance))
        : CopyWith$Input$NumberRangeFilterInput(
            local$range,
            (e) => call(range: e),
          );
  }
}

class _CopyWithStubImpl$Input$NumberFilterInput<TRes>
    implements CopyWith$Input$NumberFilterInput<TRes> {
  _CopyWithStubImpl$Input$NumberFilterInput(this._res);

  TRes _res;

  call({
    int? eq,
    List<int>? $in,
    List<int>? nin,
    Input$NumberRangeFilterInput? range,
  }) => _res;

  CopyWith$Input$NumberRangeFilterInput<TRes> get range =>
      CopyWith$Input$NumberRangeFilterInput.stub(_res);
}

class Input$NumberRangeFilterInput {
  factory Input$NumberRangeFilterInput({
    int? lt,
    int? lte,
    int? gt,
    int? gte,
  }) => Input$NumberRangeFilterInput._({
    if (lt != null) r'lt': lt,
    if (lte != null) r'lte': lte,
    if (gt != null) r'gt': gt,
    if (gte != null) r'gte': gte,
  });

  Input$NumberRangeFilterInput._(this._$data);

  factory Input$NumberRangeFilterInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('lt')) {
      final l$lt = data['lt'];
      result$data['lt'] = (l$lt as int?);
    }
    if (data.containsKey('lte')) {
      final l$lte = data['lte'];
      result$data['lte'] = (l$lte as int?);
    }
    if (data.containsKey('gt')) {
      final l$gt = data['gt'];
      result$data['gt'] = (l$gt as int?);
    }
    if (data.containsKey('gte')) {
      final l$gte = data['gte'];
      result$data['gte'] = (l$gte as int?);
    }
    return Input$NumberRangeFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get lt => (_$data['lt'] as int?);

  int? get lte => (_$data['lte'] as int?);

  int? get gt => (_$data['gt'] as int?);

  int? get gte => (_$data['gte'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('lt')) {
      final l$lt = lt;
      result$data['lt'] = l$lt;
    }
    if (_$data.containsKey('lte')) {
      final l$lte = lte;
      result$data['lte'] = l$lte;
    }
    if (_$data.containsKey('gt')) {
      final l$gt = gt;
      result$data['gt'] = l$gt;
    }
    if (_$data.containsKey('gte')) {
      final l$gte = gte;
      result$data['gte'] = l$gte;
    }
    return result$data;
  }

  CopyWith$Input$NumberRangeFilterInput<Input$NumberRangeFilterInput>
  get copyWith => CopyWith$Input$NumberRangeFilterInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$NumberRangeFilterInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$lt = lt;
    final lOther$lt = other.lt;
    if (_$data.containsKey('lt') != other._$data.containsKey('lt')) {
      return false;
    }
    if (l$lt != lOther$lt) {
      return false;
    }
    final l$lte = lte;
    final lOther$lte = other.lte;
    if (_$data.containsKey('lte') != other._$data.containsKey('lte')) {
      return false;
    }
    if (l$lte != lOther$lte) {
      return false;
    }
    final l$gt = gt;
    final lOther$gt = other.gt;
    if (_$data.containsKey('gt') != other._$data.containsKey('gt')) {
      return false;
    }
    if (l$gt != lOther$gt) {
      return false;
    }
    final l$gte = gte;
    final lOther$gte = other.gte;
    if (_$data.containsKey('gte') != other._$data.containsKey('gte')) {
      return false;
    }
    if (l$gte != lOther$gte) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$lt = lt;
    final l$lte = lte;
    final l$gt = gt;
    final l$gte = gte;
    return Object.hashAll([
      _$data.containsKey('lt') ? l$lt : const {},
      _$data.containsKey('lte') ? l$lte : const {},
      _$data.containsKey('gt') ? l$gt : const {},
      _$data.containsKey('gte') ? l$gte : const {},
    ]);
  }
}

abstract class CopyWith$Input$NumberRangeFilterInput<TRes> {
  factory CopyWith$Input$NumberRangeFilterInput(
    Input$NumberRangeFilterInput instance,
    TRes Function(Input$NumberRangeFilterInput) then,
  ) = _CopyWithImpl$Input$NumberRangeFilterInput;

  factory CopyWith$Input$NumberRangeFilterInput.stub(TRes res) =
      _CopyWithStubImpl$Input$NumberRangeFilterInput;

  TRes call({int? lt, int? lte, int? gt, int? gte});
}

class _CopyWithImpl$Input$NumberRangeFilterInput<TRes>
    implements CopyWith$Input$NumberRangeFilterInput<TRes> {
  _CopyWithImpl$Input$NumberRangeFilterInput(this._instance, this._then);

  final Input$NumberRangeFilterInput _instance;

  final TRes Function(Input$NumberRangeFilterInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? lt = _undefined,
    Object? lte = _undefined,
    Object? gt = _undefined,
    Object? gte = _undefined,
  }) => _then(
    Input$NumberRangeFilterInput._({
      ..._instance._$data,
      if (lt != _undefined) 'lt': (lt as int?),
      if (lte != _undefined) 'lte': (lte as int?),
      if (gt != _undefined) 'gt': (gt as int?),
      if (gte != _undefined) 'gte': (gte as int?),
    }),
  );
}

class _CopyWithStubImpl$Input$NumberRangeFilterInput<TRes>
    implements CopyWith$Input$NumberRangeFilterInput<TRes> {
  _CopyWithStubImpl$Input$NumberRangeFilterInput(this._res);

  TRes _res;

  call({int? lt, int? lte, int? gt, int? gte}) => _res;
}

class Input$ClassOrder {
  factory Input$ClassOrder({
    required Enum$ClassOrderField by,
    required Enum$OrderByDirection direction,
    Input$ClassOrder? then_by,
  }) => Input$ClassOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$ClassOrder._(this._$data);

  factory Input$ClassOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$ClassOrderField((l$by as String));
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$ClassOrder.fromJson((l$then_by as Map<String, dynamic>));
    }
    return Input$ClassOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$ClassOrderField get by => (_$data['by'] as Enum$ClassOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$ClassOrder? get then_by => (_$data['then_by'] as Input$ClassOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$ClassOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$ClassOrder<Input$ClassOrder> get copyWith =>
      CopyWith$Input$ClassOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$ClassOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$ClassOrder<TRes> {
  factory CopyWith$Input$ClassOrder(
    Input$ClassOrder instance,
    TRes Function(Input$ClassOrder) then,
  ) = _CopyWithImpl$Input$ClassOrder;

  factory CopyWith$Input$ClassOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$ClassOrder;

  TRes call({
    Enum$ClassOrderField? by,
    Enum$OrderByDirection? direction,
    Input$ClassOrder? then_by,
  });
  CopyWith$Input$ClassOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$ClassOrder<TRes>
    implements CopyWith$Input$ClassOrder<TRes> {
  _CopyWithImpl$Input$ClassOrder(this._instance, this._then);

  final Input$ClassOrder _instance;

  final TRes Function(Input$ClassOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$ClassOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null) 'by': (by as Enum$ClassOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined) 'then_by': (then_by as Input$ClassOrder?),
    }),
  );

  CopyWith$Input$ClassOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$ClassOrder.stub(_then(_instance))
        : CopyWith$Input$ClassOrder(local$then_by, (e) => call(then_by: e));
  }
}

class _CopyWithStubImpl$Input$ClassOrder<TRes>
    implements CopyWith$Input$ClassOrder<TRes> {
  _CopyWithStubImpl$Input$ClassOrder(this._res);

  TRes _res;

  call({
    Enum$ClassOrderField? by,
    Enum$OrderByDirection? direction,
    Input$ClassOrder? then_by,
  }) => _res;

  CopyWith$Input$ClassOrder<TRes> get then_by =>
      CopyWith$Input$ClassOrder.stub(_res);
}

class Input$ConditionOrder {
  factory Input$ConditionOrder({
    required Enum$ConditionOrderField by,
    required Enum$OrderByDirection direction,
    Input$ConditionOrder? then_by,
  }) => Input$ConditionOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$ConditionOrder._(this._$data);

  factory Input$ConditionOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$ConditionOrderField((l$by as String));
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$ConditionOrder.fromJson((l$then_by as Map<String, dynamic>));
    }
    return Input$ConditionOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$ConditionOrderField get by => (_$data['by'] as Enum$ConditionOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$ConditionOrder? get then_by =>
      (_$data['then_by'] as Input$ConditionOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$ConditionOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$ConditionOrder<Input$ConditionOrder> get copyWith =>
      CopyWith$Input$ConditionOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$ConditionOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$ConditionOrder<TRes> {
  factory CopyWith$Input$ConditionOrder(
    Input$ConditionOrder instance,
    TRes Function(Input$ConditionOrder) then,
  ) = _CopyWithImpl$Input$ConditionOrder;

  factory CopyWith$Input$ConditionOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$ConditionOrder;

  TRes call({
    Enum$ConditionOrderField? by,
    Enum$OrderByDirection? direction,
    Input$ConditionOrder? then_by,
  });
  CopyWith$Input$ConditionOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$ConditionOrder<TRes>
    implements CopyWith$Input$ConditionOrder<TRes> {
  _CopyWithImpl$Input$ConditionOrder(this._instance, this._then);

  final Input$ConditionOrder _instance;

  final TRes Function(Input$ConditionOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$ConditionOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null)
        'by': (by as Enum$ConditionOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined) 'then_by': (then_by as Input$ConditionOrder?),
    }),
  );

  CopyWith$Input$ConditionOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$ConditionOrder.stub(_then(_instance))
        : CopyWith$Input$ConditionOrder(local$then_by, (e) => call(then_by: e));
  }
}

class _CopyWithStubImpl$Input$ConditionOrder<TRes>
    implements CopyWith$Input$ConditionOrder<TRes> {
  _CopyWithStubImpl$Input$ConditionOrder(this._res);

  TRes _res;

  call({
    Enum$ConditionOrderField? by,
    Enum$OrderByDirection? direction,
    Input$ConditionOrder? then_by,
  }) => _res;

  CopyWith$Input$ConditionOrder<TRes> get then_by =>
      CopyWith$Input$ConditionOrder.stub(_res);
}

class Input$DamageTypeOrder {
  factory Input$DamageTypeOrder({
    required Enum$DamageTypeOrderField by,
    required Enum$OrderByDirection direction,
    Input$DamageTypeOrder? then_by,
  }) => Input$DamageTypeOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$DamageTypeOrder._(this._$data);

  factory Input$DamageTypeOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$DamageTypeOrderField((l$by as String));
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$DamageTypeOrder.fromJson((l$then_by as Map<String, dynamic>));
    }
    return Input$DamageTypeOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$DamageTypeOrderField get by =>
      (_$data['by'] as Enum$DamageTypeOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$DamageTypeOrder? get then_by =>
      (_$data['then_by'] as Input$DamageTypeOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$DamageTypeOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$DamageTypeOrder<Input$DamageTypeOrder> get copyWith =>
      CopyWith$Input$DamageTypeOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$DamageTypeOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$DamageTypeOrder<TRes> {
  factory CopyWith$Input$DamageTypeOrder(
    Input$DamageTypeOrder instance,
    TRes Function(Input$DamageTypeOrder) then,
  ) = _CopyWithImpl$Input$DamageTypeOrder;

  factory CopyWith$Input$DamageTypeOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$DamageTypeOrder;

  TRes call({
    Enum$DamageTypeOrderField? by,
    Enum$OrderByDirection? direction,
    Input$DamageTypeOrder? then_by,
  });
  CopyWith$Input$DamageTypeOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$DamageTypeOrder<TRes>
    implements CopyWith$Input$DamageTypeOrder<TRes> {
  _CopyWithImpl$Input$DamageTypeOrder(this._instance, this._then);

  final Input$DamageTypeOrder _instance;

  final TRes Function(Input$DamageTypeOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$DamageTypeOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null)
        'by': (by as Enum$DamageTypeOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined) 'then_by': (then_by as Input$DamageTypeOrder?),
    }),
  );

  CopyWith$Input$DamageTypeOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$DamageTypeOrder.stub(_then(_instance))
        : CopyWith$Input$DamageTypeOrder(
            local$then_by,
            (e) => call(then_by: e),
          );
  }
}

class _CopyWithStubImpl$Input$DamageTypeOrder<TRes>
    implements CopyWith$Input$DamageTypeOrder<TRes> {
  _CopyWithStubImpl$Input$DamageTypeOrder(this._res);

  TRes _res;

  call({
    Enum$DamageTypeOrderField? by,
    Enum$OrderByDirection? direction,
    Input$DamageTypeOrder? then_by,
  }) => _res;

  CopyWith$Input$DamageTypeOrder<TRes> get then_by =>
      CopyWith$Input$DamageTypeOrder.stub(_res);
}

class Input$EquipmentOrder {
  factory Input$EquipmentOrder({
    required Enum$EquipmentOrderField by,
    required Enum$OrderByDirection direction,
    Input$EquipmentOrder? then_by,
  }) => Input$EquipmentOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$EquipmentOrder._(this._$data);

  factory Input$EquipmentOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$EquipmentOrderField((l$by as String));
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$EquipmentOrder.fromJson((l$then_by as Map<String, dynamic>));
    }
    return Input$EquipmentOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$EquipmentOrderField get by => (_$data['by'] as Enum$EquipmentOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$EquipmentOrder? get then_by =>
      (_$data['then_by'] as Input$EquipmentOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$EquipmentOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$EquipmentOrder<Input$EquipmentOrder> get copyWith =>
      CopyWith$Input$EquipmentOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$EquipmentOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$EquipmentOrder<TRes> {
  factory CopyWith$Input$EquipmentOrder(
    Input$EquipmentOrder instance,
    TRes Function(Input$EquipmentOrder) then,
  ) = _CopyWithImpl$Input$EquipmentOrder;

  factory CopyWith$Input$EquipmentOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$EquipmentOrder;

  TRes call({
    Enum$EquipmentOrderField? by,
    Enum$OrderByDirection? direction,
    Input$EquipmentOrder? then_by,
  });
  CopyWith$Input$EquipmentOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$EquipmentOrder<TRes>
    implements CopyWith$Input$EquipmentOrder<TRes> {
  _CopyWithImpl$Input$EquipmentOrder(this._instance, this._then);

  final Input$EquipmentOrder _instance;

  final TRes Function(Input$EquipmentOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$EquipmentOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null)
        'by': (by as Enum$EquipmentOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined) 'then_by': (then_by as Input$EquipmentOrder?),
    }),
  );

  CopyWith$Input$EquipmentOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$EquipmentOrder.stub(_then(_instance))
        : CopyWith$Input$EquipmentOrder(local$then_by, (e) => call(then_by: e));
  }
}

class _CopyWithStubImpl$Input$EquipmentOrder<TRes>
    implements CopyWith$Input$EquipmentOrder<TRes> {
  _CopyWithStubImpl$Input$EquipmentOrder(this._res);

  TRes _res;

  call({
    Enum$EquipmentOrderField? by,
    Enum$OrderByDirection? direction,
    Input$EquipmentOrder? then_by,
  }) => _res;

  CopyWith$Input$EquipmentOrder<TRes> get then_by =>
      CopyWith$Input$EquipmentOrder.stub(_res);
}

class Input$EquipmentCategoryOrder {
  factory Input$EquipmentCategoryOrder({
    required Enum$EquipmentCategoryOrderField by,
    required Enum$OrderByDirection direction,
    Input$EquipmentCategoryOrder? then_by,
  }) => Input$EquipmentCategoryOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$EquipmentCategoryOrder._(this._$data);

  factory Input$EquipmentCategoryOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$EquipmentCategoryOrderField(
      (l$by as String),
    );
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$EquipmentCategoryOrder.fromJson(
              (l$then_by as Map<String, dynamic>),
            );
    }
    return Input$EquipmentCategoryOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$EquipmentCategoryOrderField get by =>
      (_$data['by'] as Enum$EquipmentCategoryOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$EquipmentCategoryOrder? get then_by =>
      (_$data['then_by'] as Input$EquipmentCategoryOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$EquipmentCategoryOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$EquipmentCategoryOrder<Input$EquipmentCategoryOrder>
  get copyWith => CopyWith$Input$EquipmentCategoryOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$EquipmentCategoryOrder ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$EquipmentCategoryOrder<TRes> {
  factory CopyWith$Input$EquipmentCategoryOrder(
    Input$EquipmentCategoryOrder instance,
    TRes Function(Input$EquipmentCategoryOrder) then,
  ) = _CopyWithImpl$Input$EquipmentCategoryOrder;

  factory CopyWith$Input$EquipmentCategoryOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$EquipmentCategoryOrder;

  TRes call({
    Enum$EquipmentCategoryOrderField? by,
    Enum$OrderByDirection? direction,
    Input$EquipmentCategoryOrder? then_by,
  });
  CopyWith$Input$EquipmentCategoryOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$EquipmentCategoryOrder<TRes>
    implements CopyWith$Input$EquipmentCategoryOrder<TRes> {
  _CopyWithImpl$Input$EquipmentCategoryOrder(this._instance, this._then);

  final Input$EquipmentCategoryOrder _instance;

  final TRes Function(Input$EquipmentCategoryOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$EquipmentCategoryOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null)
        'by': (by as Enum$EquipmentCategoryOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined)
        'then_by': (then_by as Input$EquipmentCategoryOrder?),
    }),
  );

  CopyWith$Input$EquipmentCategoryOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$EquipmentCategoryOrder.stub(_then(_instance))
        : CopyWith$Input$EquipmentCategoryOrder(
            local$then_by,
            (e) => call(then_by: e),
          );
  }
}

class _CopyWithStubImpl$Input$EquipmentCategoryOrder<TRes>
    implements CopyWith$Input$EquipmentCategoryOrder<TRes> {
  _CopyWithStubImpl$Input$EquipmentCategoryOrder(this._res);

  TRes _res;

  call({
    Enum$EquipmentCategoryOrderField? by,
    Enum$OrderByDirection? direction,
    Input$EquipmentCategoryOrder? then_by,
  }) => _res;

  CopyWith$Input$EquipmentCategoryOrder<TRes> get then_by =>
      CopyWith$Input$EquipmentCategoryOrder.stub(_res);
}

class Input$FeatOrder {
  factory Input$FeatOrder({
    required Enum$FeatOrderField by,
    required Enum$OrderByDirection direction,
    Input$FeatOrder? then_by,
  }) => Input$FeatOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$FeatOrder._(this._$data);

  factory Input$FeatOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$FeatOrderField((l$by as String));
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$FeatOrder.fromJson((l$then_by as Map<String, dynamic>));
    }
    return Input$FeatOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$FeatOrderField get by => (_$data['by'] as Enum$FeatOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$FeatOrder? get then_by => (_$data['then_by'] as Input$FeatOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$FeatOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$FeatOrder<Input$FeatOrder> get copyWith =>
      CopyWith$Input$FeatOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$FeatOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$FeatOrder<TRes> {
  factory CopyWith$Input$FeatOrder(
    Input$FeatOrder instance,
    TRes Function(Input$FeatOrder) then,
  ) = _CopyWithImpl$Input$FeatOrder;

  factory CopyWith$Input$FeatOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$FeatOrder;

  TRes call({
    Enum$FeatOrderField? by,
    Enum$OrderByDirection? direction,
    Input$FeatOrder? then_by,
  });
  CopyWith$Input$FeatOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$FeatOrder<TRes>
    implements CopyWith$Input$FeatOrder<TRes> {
  _CopyWithImpl$Input$FeatOrder(this._instance, this._then);

  final Input$FeatOrder _instance;

  final TRes Function(Input$FeatOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$FeatOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null) 'by': (by as Enum$FeatOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined) 'then_by': (then_by as Input$FeatOrder?),
    }),
  );

  CopyWith$Input$FeatOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$FeatOrder.stub(_then(_instance))
        : CopyWith$Input$FeatOrder(local$then_by, (e) => call(then_by: e));
  }
}

class _CopyWithStubImpl$Input$FeatOrder<TRes>
    implements CopyWith$Input$FeatOrder<TRes> {
  _CopyWithStubImpl$Input$FeatOrder(this._res);

  TRes _res;

  call({
    Enum$FeatOrderField? by,
    Enum$OrderByDirection? direction,
    Input$FeatOrder? then_by,
  }) => _res;

  CopyWith$Input$FeatOrder<TRes> get then_by =>
      CopyWith$Input$FeatOrder.stub(_res);
}

class Input$FeatureOrder {
  factory Input$FeatureOrder({
    required Enum$FeatureOrderField by,
    required Enum$OrderByDirection direction,
    Input$FeatureOrder? then_by,
  }) => Input$FeatureOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$FeatureOrder._(this._$data);

  factory Input$FeatureOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$FeatureOrderField((l$by as String));
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$FeatureOrder.fromJson((l$then_by as Map<String, dynamic>));
    }
    return Input$FeatureOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$FeatureOrderField get by => (_$data['by'] as Enum$FeatureOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$FeatureOrder? get then_by => (_$data['then_by'] as Input$FeatureOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$FeatureOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$FeatureOrder<Input$FeatureOrder> get copyWith =>
      CopyWith$Input$FeatureOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$FeatureOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$FeatureOrder<TRes> {
  factory CopyWith$Input$FeatureOrder(
    Input$FeatureOrder instance,
    TRes Function(Input$FeatureOrder) then,
  ) = _CopyWithImpl$Input$FeatureOrder;

  factory CopyWith$Input$FeatureOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$FeatureOrder;

  TRes call({
    Enum$FeatureOrderField? by,
    Enum$OrderByDirection? direction,
    Input$FeatureOrder? then_by,
  });
  CopyWith$Input$FeatureOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$FeatureOrder<TRes>
    implements CopyWith$Input$FeatureOrder<TRes> {
  _CopyWithImpl$Input$FeatureOrder(this._instance, this._then);

  final Input$FeatureOrder _instance;

  final TRes Function(Input$FeatureOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$FeatureOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null) 'by': (by as Enum$FeatureOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined) 'then_by': (then_by as Input$FeatureOrder?),
    }),
  );

  CopyWith$Input$FeatureOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$FeatureOrder.stub(_then(_instance))
        : CopyWith$Input$FeatureOrder(local$then_by, (e) => call(then_by: e));
  }
}

class _CopyWithStubImpl$Input$FeatureOrder<TRes>
    implements CopyWith$Input$FeatureOrder<TRes> {
  _CopyWithStubImpl$Input$FeatureOrder(this._res);

  TRes _res;

  call({
    Enum$FeatureOrderField? by,
    Enum$OrderByDirection? direction,
    Input$FeatureOrder? then_by,
  }) => _res;

  CopyWith$Input$FeatureOrder<TRes> get then_by =>
      CopyWith$Input$FeatureOrder.stub(_res);
}

class Input$LanguageOrder {
  factory Input$LanguageOrder({
    required Enum$LanguageOrderField by,
    required Enum$OrderByDirection direction,
    Input$LanguageOrder? then_by,
  }) => Input$LanguageOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$LanguageOrder._(this._$data);

  factory Input$LanguageOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$LanguageOrderField((l$by as String));
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$LanguageOrder.fromJson((l$then_by as Map<String, dynamic>));
    }
    return Input$LanguageOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$LanguageOrderField get by => (_$data['by'] as Enum$LanguageOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$LanguageOrder? get then_by =>
      (_$data['then_by'] as Input$LanguageOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$LanguageOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$LanguageOrder<Input$LanguageOrder> get copyWith =>
      CopyWith$Input$LanguageOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$LanguageOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$LanguageOrder<TRes> {
  factory CopyWith$Input$LanguageOrder(
    Input$LanguageOrder instance,
    TRes Function(Input$LanguageOrder) then,
  ) = _CopyWithImpl$Input$LanguageOrder;

  factory CopyWith$Input$LanguageOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$LanguageOrder;

  TRes call({
    Enum$LanguageOrderField? by,
    Enum$OrderByDirection? direction,
    Input$LanguageOrder? then_by,
  });
  CopyWith$Input$LanguageOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$LanguageOrder<TRes>
    implements CopyWith$Input$LanguageOrder<TRes> {
  _CopyWithImpl$Input$LanguageOrder(this._instance, this._then);

  final Input$LanguageOrder _instance;

  final TRes Function(Input$LanguageOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$LanguageOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null) 'by': (by as Enum$LanguageOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined) 'then_by': (then_by as Input$LanguageOrder?),
    }),
  );

  CopyWith$Input$LanguageOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$LanguageOrder.stub(_then(_instance))
        : CopyWith$Input$LanguageOrder(local$then_by, (e) => call(then_by: e));
  }
}

class _CopyWithStubImpl$Input$LanguageOrder<TRes>
    implements CopyWith$Input$LanguageOrder<TRes> {
  _CopyWithStubImpl$Input$LanguageOrder(this._res);

  TRes _res;

  call({
    Enum$LanguageOrderField? by,
    Enum$OrderByDirection? direction,
    Input$LanguageOrder? then_by,
  }) => _res;

  CopyWith$Input$LanguageOrder<TRes> get then_by =>
      CopyWith$Input$LanguageOrder.stub(_res);
}

class Input$LevelOrder {
  factory Input$LevelOrder({
    required Enum$LevelOrderField by,
    required Enum$OrderByDirection direction,
    Input$LevelOrder? then_by,
  }) => Input$LevelOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$LevelOrder._(this._$data);

  factory Input$LevelOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$LevelOrderField((l$by as String));
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$LevelOrder.fromJson((l$then_by as Map<String, dynamic>));
    }
    return Input$LevelOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$LevelOrderField get by => (_$data['by'] as Enum$LevelOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$LevelOrder? get then_by => (_$data['then_by'] as Input$LevelOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$LevelOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$LevelOrder<Input$LevelOrder> get copyWith =>
      CopyWith$Input$LevelOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$LevelOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$LevelOrder<TRes> {
  factory CopyWith$Input$LevelOrder(
    Input$LevelOrder instance,
    TRes Function(Input$LevelOrder) then,
  ) = _CopyWithImpl$Input$LevelOrder;

  factory CopyWith$Input$LevelOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$LevelOrder;

  TRes call({
    Enum$LevelOrderField? by,
    Enum$OrderByDirection? direction,
    Input$LevelOrder? then_by,
  });
  CopyWith$Input$LevelOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$LevelOrder<TRes>
    implements CopyWith$Input$LevelOrder<TRes> {
  _CopyWithImpl$Input$LevelOrder(this._instance, this._then);

  final Input$LevelOrder _instance;

  final TRes Function(Input$LevelOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$LevelOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null) 'by': (by as Enum$LevelOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined) 'then_by': (then_by as Input$LevelOrder?),
    }),
  );

  CopyWith$Input$LevelOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$LevelOrder.stub(_then(_instance))
        : CopyWith$Input$LevelOrder(local$then_by, (e) => call(then_by: e));
  }
}

class _CopyWithStubImpl$Input$LevelOrder<TRes>
    implements CopyWith$Input$LevelOrder<TRes> {
  _CopyWithStubImpl$Input$LevelOrder(this._res);

  TRes _res;

  call({
    Enum$LevelOrderField? by,
    Enum$OrderByDirection? direction,
    Input$LevelOrder? then_by,
  }) => _res;

  CopyWith$Input$LevelOrder<TRes> get then_by =>
      CopyWith$Input$LevelOrder.stub(_res);
}

class Input$MagicItemOrder {
  factory Input$MagicItemOrder({
    required Enum$MagicItemOrderField by,
    required Enum$OrderByDirection direction,
    Input$MagicItemOrder? then_by,
  }) => Input$MagicItemOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$MagicItemOrder._(this._$data);

  factory Input$MagicItemOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$MagicItemOrderField((l$by as String));
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$MagicItemOrder.fromJson((l$then_by as Map<String, dynamic>));
    }
    return Input$MagicItemOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$MagicItemOrderField get by => (_$data['by'] as Enum$MagicItemOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$MagicItemOrder? get then_by =>
      (_$data['then_by'] as Input$MagicItemOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$MagicItemOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$MagicItemOrder<Input$MagicItemOrder> get copyWith =>
      CopyWith$Input$MagicItemOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$MagicItemOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$MagicItemOrder<TRes> {
  factory CopyWith$Input$MagicItemOrder(
    Input$MagicItemOrder instance,
    TRes Function(Input$MagicItemOrder) then,
  ) = _CopyWithImpl$Input$MagicItemOrder;

  factory CopyWith$Input$MagicItemOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$MagicItemOrder;

  TRes call({
    Enum$MagicItemOrderField? by,
    Enum$OrderByDirection? direction,
    Input$MagicItemOrder? then_by,
  });
  CopyWith$Input$MagicItemOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$MagicItemOrder<TRes>
    implements CopyWith$Input$MagicItemOrder<TRes> {
  _CopyWithImpl$Input$MagicItemOrder(this._instance, this._then);

  final Input$MagicItemOrder _instance;

  final TRes Function(Input$MagicItemOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$MagicItemOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null)
        'by': (by as Enum$MagicItemOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined) 'then_by': (then_by as Input$MagicItemOrder?),
    }),
  );

  CopyWith$Input$MagicItemOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$MagicItemOrder.stub(_then(_instance))
        : CopyWith$Input$MagicItemOrder(local$then_by, (e) => call(then_by: e));
  }
}

class _CopyWithStubImpl$Input$MagicItemOrder<TRes>
    implements CopyWith$Input$MagicItemOrder<TRes> {
  _CopyWithStubImpl$Input$MagicItemOrder(this._res);

  TRes _res;

  call({
    Enum$MagicItemOrderField? by,
    Enum$OrderByDirection? direction,
    Input$MagicItemOrder? then_by,
  }) => _res;

  CopyWith$Input$MagicItemOrder<TRes> get then_by =>
      CopyWith$Input$MagicItemOrder.stub(_res);
}

class Input$MagicSchoolOrder {
  factory Input$MagicSchoolOrder({
    required Enum$MagicSchoolOrderField by,
    required Enum$OrderByDirection direction,
    Input$MagicSchoolOrder? then_by,
  }) => Input$MagicSchoolOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$MagicSchoolOrder._(this._$data);

  factory Input$MagicSchoolOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$MagicSchoolOrderField((l$by as String));
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$MagicSchoolOrder.fromJson(
              (l$then_by as Map<String, dynamic>),
            );
    }
    return Input$MagicSchoolOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$MagicSchoolOrderField get by =>
      (_$data['by'] as Enum$MagicSchoolOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$MagicSchoolOrder? get then_by =>
      (_$data['then_by'] as Input$MagicSchoolOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$MagicSchoolOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$MagicSchoolOrder<Input$MagicSchoolOrder> get copyWith =>
      CopyWith$Input$MagicSchoolOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$MagicSchoolOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$MagicSchoolOrder<TRes> {
  factory CopyWith$Input$MagicSchoolOrder(
    Input$MagicSchoolOrder instance,
    TRes Function(Input$MagicSchoolOrder) then,
  ) = _CopyWithImpl$Input$MagicSchoolOrder;

  factory CopyWith$Input$MagicSchoolOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$MagicSchoolOrder;

  TRes call({
    Enum$MagicSchoolOrderField? by,
    Enum$OrderByDirection? direction,
    Input$MagicSchoolOrder? then_by,
  });
  CopyWith$Input$MagicSchoolOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$MagicSchoolOrder<TRes>
    implements CopyWith$Input$MagicSchoolOrder<TRes> {
  _CopyWithImpl$Input$MagicSchoolOrder(this._instance, this._then);

  final Input$MagicSchoolOrder _instance;

  final TRes Function(Input$MagicSchoolOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$MagicSchoolOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null)
        'by': (by as Enum$MagicSchoolOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined)
        'then_by': (then_by as Input$MagicSchoolOrder?),
    }),
  );

  CopyWith$Input$MagicSchoolOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$MagicSchoolOrder.stub(_then(_instance))
        : CopyWith$Input$MagicSchoolOrder(
            local$then_by,
            (e) => call(then_by: e),
          );
  }
}

class _CopyWithStubImpl$Input$MagicSchoolOrder<TRes>
    implements CopyWith$Input$MagicSchoolOrder<TRes> {
  _CopyWithStubImpl$Input$MagicSchoolOrder(this._res);

  TRes _res;

  call({
    Enum$MagicSchoolOrderField? by,
    Enum$OrderByDirection? direction,
    Input$MagicSchoolOrder? then_by,
  }) => _res;

  CopyWith$Input$MagicSchoolOrder<TRes> get then_by =>
      CopyWith$Input$MagicSchoolOrder.stub(_res);
}

class Input$MonsterOrder {
  factory Input$MonsterOrder({
    required Enum$MonsterOrderField by,
    required Enum$OrderByDirection direction,
    Input$MonsterOrder? then_by,
  }) => Input$MonsterOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$MonsterOrder._(this._$data);

  factory Input$MonsterOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$MonsterOrderField((l$by as String));
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$MonsterOrder.fromJson((l$then_by as Map<String, dynamic>));
    }
    return Input$MonsterOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$MonsterOrderField get by => (_$data['by'] as Enum$MonsterOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$MonsterOrder? get then_by => (_$data['then_by'] as Input$MonsterOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$MonsterOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$MonsterOrder<Input$MonsterOrder> get copyWith =>
      CopyWith$Input$MonsterOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$MonsterOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$MonsterOrder<TRes> {
  factory CopyWith$Input$MonsterOrder(
    Input$MonsterOrder instance,
    TRes Function(Input$MonsterOrder) then,
  ) = _CopyWithImpl$Input$MonsterOrder;

  factory CopyWith$Input$MonsterOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$MonsterOrder;

  TRes call({
    Enum$MonsterOrderField? by,
    Enum$OrderByDirection? direction,
    Input$MonsterOrder? then_by,
  });
  CopyWith$Input$MonsterOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$MonsterOrder<TRes>
    implements CopyWith$Input$MonsterOrder<TRes> {
  _CopyWithImpl$Input$MonsterOrder(this._instance, this._then);

  final Input$MonsterOrder _instance;

  final TRes Function(Input$MonsterOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$MonsterOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null) 'by': (by as Enum$MonsterOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined) 'then_by': (then_by as Input$MonsterOrder?),
    }),
  );

  CopyWith$Input$MonsterOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$MonsterOrder.stub(_then(_instance))
        : CopyWith$Input$MonsterOrder(local$then_by, (e) => call(then_by: e));
  }
}

class _CopyWithStubImpl$Input$MonsterOrder<TRes>
    implements CopyWith$Input$MonsterOrder<TRes> {
  _CopyWithStubImpl$Input$MonsterOrder(this._res);

  TRes _res;

  call({
    Enum$MonsterOrderField? by,
    Enum$OrderByDirection? direction,
    Input$MonsterOrder? then_by,
  }) => _res;

  CopyWith$Input$MonsterOrder<TRes> get then_by =>
      CopyWith$Input$MonsterOrder.stub(_res);
}

class Input$ProficiencyOrder {
  factory Input$ProficiencyOrder({
    required Enum$ProficiencyOrderField by,
    required Enum$OrderByDirection direction,
    Input$ProficiencyOrder? then_by,
  }) => Input$ProficiencyOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$ProficiencyOrder._(this._$data);

  factory Input$ProficiencyOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$ProficiencyOrderField((l$by as String));
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$ProficiencyOrder.fromJson(
              (l$then_by as Map<String, dynamic>),
            );
    }
    return Input$ProficiencyOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$ProficiencyOrderField get by =>
      (_$data['by'] as Enum$ProficiencyOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$ProficiencyOrder? get then_by =>
      (_$data['then_by'] as Input$ProficiencyOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$ProficiencyOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$ProficiencyOrder<Input$ProficiencyOrder> get copyWith =>
      CopyWith$Input$ProficiencyOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$ProficiencyOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$ProficiencyOrder<TRes> {
  factory CopyWith$Input$ProficiencyOrder(
    Input$ProficiencyOrder instance,
    TRes Function(Input$ProficiencyOrder) then,
  ) = _CopyWithImpl$Input$ProficiencyOrder;

  factory CopyWith$Input$ProficiencyOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$ProficiencyOrder;

  TRes call({
    Enum$ProficiencyOrderField? by,
    Enum$OrderByDirection? direction,
    Input$ProficiencyOrder? then_by,
  });
  CopyWith$Input$ProficiencyOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$ProficiencyOrder<TRes>
    implements CopyWith$Input$ProficiencyOrder<TRes> {
  _CopyWithImpl$Input$ProficiencyOrder(this._instance, this._then);

  final Input$ProficiencyOrder _instance;

  final TRes Function(Input$ProficiencyOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$ProficiencyOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null)
        'by': (by as Enum$ProficiencyOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined)
        'then_by': (then_by as Input$ProficiencyOrder?),
    }),
  );

  CopyWith$Input$ProficiencyOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$ProficiencyOrder.stub(_then(_instance))
        : CopyWith$Input$ProficiencyOrder(
            local$then_by,
            (e) => call(then_by: e),
          );
  }
}

class _CopyWithStubImpl$Input$ProficiencyOrder<TRes>
    implements CopyWith$Input$ProficiencyOrder<TRes> {
  _CopyWithStubImpl$Input$ProficiencyOrder(this._res);

  TRes _res;

  call({
    Enum$ProficiencyOrderField? by,
    Enum$OrderByDirection? direction,
    Input$ProficiencyOrder? then_by,
  }) => _res;

  CopyWith$Input$ProficiencyOrder<TRes> get then_by =>
      CopyWith$Input$ProficiencyOrder.stub(_res);
}

class Input$RaceOrder {
  factory Input$RaceOrder({
    required Enum$RaceOrderField by,
    required Enum$OrderByDirection direction,
    Input$RaceOrder? then_by,
  }) => Input$RaceOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$RaceOrder._(this._$data);

  factory Input$RaceOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$RaceOrderField((l$by as String));
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$RaceOrder.fromJson((l$then_by as Map<String, dynamic>));
    }
    return Input$RaceOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$RaceOrderField get by => (_$data['by'] as Enum$RaceOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$RaceOrder? get then_by => (_$data['then_by'] as Input$RaceOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$RaceOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$RaceOrder<Input$RaceOrder> get copyWith =>
      CopyWith$Input$RaceOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$RaceOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$RaceOrder<TRes> {
  factory CopyWith$Input$RaceOrder(
    Input$RaceOrder instance,
    TRes Function(Input$RaceOrder) then,
  ) = _CopyWithImpl$Input$RaceOrder;

  factory CopyWith$Input$RaceOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$RaceOrder;

  TRes call({
    Enum$RaceOrderField? by,
    Enum$OrderByDirection? direction,
    Input$RaceOrder? then_by,
  });
  CopyWith$Input$RaceOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$RaceOrder<TRes>
    implements CopyWith$Input$RaceOrder<TRes> {
  _CopyWithImpl$Input$RaceOrder(this._instance, this._then);

  final Input$RaceOrder _instance;

  final TRes Function(Input$RaceOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$RaceOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null) 'by': (by as Enum$RaceOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined) 'then_by': (then_by as Input$RaceOrder?),
    }),
  );

  CopyWith$Input$RaceOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$RaceOrder.stub(_then(_instance))
        : CopyWith$Input$RaceOrder(local$then_by, (e) => call(then_by: e));
  }
}

class _CopyWithStubImpl$Input$RaceOrder<TRes>
    implements CopyWith$Input$RaceOrder<TRes> {
  _CopyWithStubImpl$Input$RaceOrder(this._res);

  TRes _res;

  call({
    Enum$RaceOrderField? by,
    Enum$OrderByDirection? direction,
    Input$RaceOrder? then_by,
  }) => _res;

  CopyWith$Input$RaceOrder<TRes> get then_by =>
      CopyWith$Input$RaceOrder.stub(_res);
}

class Input$RuleOrder {
  factory Input$RuleOrder({
    required Enum$RuleOrderField by,
    required Enum$OrderByDirection direction,
    Input$RuleOrder? then_by,
  }) => Input$RuleOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$RuleOrder._(this._$data);

  factory Input$RuleOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$RuleOrderField((l$by as String));
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$RuleOrder.fromJson((l$then_by as Map<String, dynamic>));
    }
    return Input$RuleOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$RuleOrderField get by => (_$data['by'] as Enum$RuleOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$RuleOrder? get then_by => (_$data['then_by'] as Input$RuleOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$RuleOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$RuleOrder<Input$RuleOrder> get copyWith =>
      CopyWith$Input$RuleOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$RuleOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$RuleOrder<TRes> {
  factory CopyWith$Input$RuleOrder(
    Input$RuleOrder instance,
    TRes Function(Input$RuleOrder) then,
  ) = _CopyWithImpl$Input$RuleOrder;

  factory CopyWith$Input$RuleOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$RuleOrder;

  TRes call({
    Enum$RuleOrderField? by,
    Enum$OrderByDirection? direction,
    Input$RuleOrder? then_by,
  });
  CopyWith$Input$RuleOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$RuleOrder<TRes>
    implements CopyWith$Input$RuleOrder<TRes> {
  _CopyWithImpl$Input$RuleOrder(this._instance, this._then);

  final Input$RuleOrder _instance;

  final TRes Function(Input$RuleOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$RuleOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null) 'by': (by as Enum$RuleOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined) 'then_by': (then_by as Input$RuleOrder?),
    }),
  );

  CopyWith$Input$RuleOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$RuleOrder.stub(_then(_instance))
        : CopyWith$Input$RuleOrder(local$then_by, (e) => call(then_by: e));
  }
}

class _CopyWithStubImpl$Input$RuleOrder<TRes>
    implements CopyWith$Input$RuleOrder<TRes> {
  _CopyWithStubImpl$Input$RuleOrder(this._res);

  TRes _res;

  call({
    Enum$RuleOrderField? by,
    Enum$OrderByDirection? direction,
    Input$RuleOrder? then_by,
  }) => _res;

  CopyWith$Input$RuleOrder<TRes> get then_by =>
      CopyWith$Input$RuleOrder.stub(_res);
}

class Input$RuleSectionOrder {
  factory Input$RuleSectionOrder({
    required Enum$RuleSectionOrderField by,
    required Enum$OrderByDirection direction,
    Input$RuleSectionOrder? then_by,
  }) => Input$RuleSectionOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$RuleSectionOrder._(this._$data);

  factory Input$RuleSectionOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$RuleSectionOrderField((l$by as String));
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$RuleSectionOrder.fromJson(
              (l$then_by as Map<String, dynamic>),
            );
    }
    return Input$RuleSectionOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$RuleSectionOrderField get by =>
      (_$data['by'] as Enum$RuleSectionOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$RuleSectionOrder? get then_by =>
      (_$data['then_by'] as Input$RuleSectionOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$RuleSectionOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$RuleSectionOrder<Input$RuleSectionOrder> get copyWith =>
      CopyWith$Input$RuleSectionOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$RuleSectionOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$RuleSectionOrder<TRes> {
  factory CopyWith$Input$RuleSectionOrder(
    Input$RuleSectionOrder instance,
    TRes Function(Input$RuleSectionOrder) then,
  ) = _CopyWithImpl$Input$RuleSectionOrder;

  factory CopyWith$Input$RuleSectionOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$RuleSectionOrder;

  TRes call({
    Enum$RuleSectionOrderField? by,
    Enum$OrderByDirection? direction,
    Input$RuleSectionOrder? then_by,
  });
  CopyWith$Input$RuleSectionOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$RuleSectionOrder<TRes>
    implements CopyWith$Input$RuleSectionOrder<TRes> {
  _CopyWithImpl$Input$RuleSectionOrder(this._instance, this._then);

  final Input$RuleSectionOrder _instance;

  final TRes Function(Input$RuleSectionOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$RuleSectionOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null)
        'by': (by as Enum$RuleSectionOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined)
        'then_by': (then_by as Input$RuleSectionOrder?),
    }),
  );

  CopyWith$Input$RuleSectionOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$RuleSectionOrder.stub(_then(_instance))
        : CopyWith$Input$RuleSectionOrder(
            local$then_by,
            (e) => call(then_by: e),
          );
  }
}

class _CopyWithStubImpl$Input$RuleSectionOrder<TRes>
    implements CopyWith$Input$RuleSectionOrder<TRes> {
  _CopyWithStubImpl$Input$RuleSectionOrder(this._res);

  TRes _res;

  call({
    Enum$RuleSectionOrderField? by,
    Enum$OrderByDirection? direction,
    Input$RuleSectionOrder? then_by,
  }) => _res;

  CopyWith$Input$RuleSectionOrder<TRes> get then_by =>
      CopyWith$Input$RuleSectionOrder.stub(_res);
}

class Input$SkillOrder {
  factory Input$SkillOrder({
    required Enum$SkillOrderField by,
    required Enum$OrderByDirection direction,
    Input$SkillOrder? then_by,
  }) => Input$SkillOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$SkillOrder._(this._$data);

  factory Input$SkillOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$SkillOrderField((l$by as String));
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$SkillOrder.fromJson((l$then_by as Map<String, dynamic>));
    }
    return Input$SkillOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$SkillOrderField get by => (_$data['by'] as Enum$SkillOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$SkillOrder? get then_by => (_$data['then_by'] as Input$SkillOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$SkillOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$SkillOrder<Input$SkillOrder> get copyWith =>
      CopyWith$Input$SkillOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$SkillOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$SkillOrder<TRes> {
  factory CopyWith$Input$SkillOrder(
    Input$SkillOrder instance,
    TRes Function(Input$SkillOrder) then,
  ) = _CopyWithImpl$Input$SkillOrder;

  factory CopyWith$Input$SkillOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$SkillOrder;

  TRes call({
    Enum$SkillOrderField? by,
    Enum$OrderByDirection? direction,
    Input$SkillOrder? then_by,
  });
  CopyWith$Input$SkillOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$SkillOrder<TRes>
    implements CopyWith$Input$SkillOrder<TRes> {
  _CopyWithImpl$Input$SkillOrder(this._instance, this._then);

  final Input$SkillOrder _instance;

  final TRes Function(Input$SkillOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$SkillOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null) 'by': (by as Enum$SkillOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined) 'then_by': (then_by as Input$SkillOrder?),
    }),
  );

  CopyWith$Input$SkillOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$SkillOrder.stub(_then(_instance))
        : CopyWith$Input$SkillOrder(local$then_by, (e) => call(then_by: e));
  }
}

class _CopyWithStubImpl$Input$SkillOrder<TRes>
    implements CopyWith$Input$SkillOrder<TRes> {
  _CopyWithStubImpl$Input$SkillOrder(this._res);

  TRes _res;

  call({
    Enum$SkillOrderField? by,
    Enum$OrderByDirection? direction,
    Input$SkillOrder? then_by,
  }) => _res;

  CopyWith$Input$SkillOrder<TRes> get then_by =>
      CopyWith$Input$SkillOrder.stub(_res);
}

class Input$AreaOfEffectFilterInput {
  factory Input$AreaOfEffectFilterInput({
    List<String>? type,
    Input$NumberFilterInput? size,
  }) => Input$AreaOfEffectFilterInput._({
    if (type != null) r'type': type,
    if (size != null) r'size': size,
  });

  Input$AreaOfEffectFilterInput._(this._$data);

  factory Input$AreaOfEffectFilterInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('type')) {
      final l$type = data['type'];
      result$data['type'] = (l$type as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('size')) {
      final l$size = data['size'];
      result$data['size'] = l$size == null
          ? null
          : Input$NumberFilterInput.fromJson((l$size as Map<String, dynamic>));
    }
    return Input$AreaOfEffectFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String>? get type => (_$data['type'] as List<String>?);

  Input$NumberFilterInput? get size =>
      (_$data['size'] as Input$NumberFilterInput?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('type')) {
      final l$type = type;
      result$data['type'] = l$type?.map((e) => e).toList();
    }
    if (_$data.containsKey('size')) {
      final l$size = size;
      result$data['size'] = l$size?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$AreaOfEffectFilterInput<Input$AreaOfEffectFilterInput>
  get copyWith => CopyWith$Input$AreaOfEffectFilterInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$AreaOfEffectFilterInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (_$data.containsKey('type') != other._$data.containsKey('type')) {
      return false;
    }
    if (l$type != null && lOther$type != null) {
      if (l$type.length != lOther$type.length) {
        return false;
      }
      for (int i = 0; i < l$type.length; i++) {
        final l$type$entry = l$type[i];
        final lOther$type$entry = lOther$type[i];
        if (l$type$entry != lOther$type$entry) {
          return false;
        }
      }
    } else if (l$type != lOther$type) {
      return false;
    }
    final l$size = size;
    final lOther$size = other.size;
    if (_$data.containsKey('size') != other._$data.containsKey('size')) {
      return false;
    }
    if (l$size != lOther$size) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$size = size;
    return Object.hashAll([
      _$data.containsKey('type')
          ? l$type == null
                ? null
                : Object.hashAll(l$type.map((v) => v))
          : const {},
      _$data.containsKey('size') ? l$size : const {},
    ]);
  }
}

abstract class CopyWith$Input$AreaOfEffectFilterInput<TRes> {
  factory CopyWith$Input$AreaOfEffectFilterInput(
    Input$AreaOfEffectFilterInput instance,
    TRes Function(Input$AreaOfEffectFilterInput) then,
  ) = _CopyWithImpl$Input$AreaOfEffectFilterInput;

  factory CopyWith$Input$AreaOfEffectFilterInput.stub(TRes res) =
      _CopyWithStubImpl$Input$AreaOfEffectFilterInput;

  TRes call({List<String>? type, Input$NumberFilterInput? size});
  CopyWith$Input$NumberFilterInput<TRes> get size;
}

class _CopyWithImpl$Input$AreaOfEffectFilterInput<TRes>
    implements CopyWith$Input$AreaOfEffectFilterInput<TRes> {
  _CopyWithImpl$Input$AreaOfEffectFilterInput(this._instance, this._then);

  final Input$AreaOfEffectFilterInput _instance;

  final TRes Function(Input$AreaOfEffectFilterInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? type = _undefined, Object? size = _undefined}) => _then(
    Input$AreaOfEffectFilterInput._({
      ..._instance._$data,
      if (type != _undefined) 'type': (type as List<String>?),
      if (size != _undefined) 'size': (size as Input$NumberFilterInput?),
    }),
  );

  CopyWith$Input$NumberFilterInput<TRes> get size {
    final local$size = _instance.size;
    return local$size == null
        ? CopyWith$Input$NumberFilterInput.stub(_then(_instance))
        : CopyWith$Input$NumberFilterInput(local$size, (e) => call(size: e));
  }
}

class _CopyWithStubImpl$Input$AreaOfEffectFilterInput<TRes>
    implements CopyWith$Input$AreaOfEffectFilterInput<TRes> {
  _CopyWithStubImpl$Input$AreaOfEffectFilterInput(this._res);

  TRes _res;

  call({List<String>? type, Input$NumberFilterInput? size}) => _res;

  CopyWith$Input$NumberFilterInput<TRes> get size =>
      CopyWith$Input$NumberFilterInput.stub(_res);
}

class Input$SpellOrder {
  factory Input$SpellOrder({
    required Enum$SpellOrderField by,
    required Enum$OrderByDirection direction,
    Input$SpellOrder? then_by,
  }) => Input$SpellOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$SpellOrder._(this._$data);

  factory Input$SpellOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$SpellOrderField((l$by as String));
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$SpellOrder.fromJson((l$then_by as Map<String, dynamic>));
    }
    return Input$SpellOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$SpellOrderField get by => (_$data['by'] as Enum$SpellOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$SpellOrder? get then_by => (_$data['then_by'] as Input$SpellOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$SpellOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$SpellOrder<Input$SpellOrder> get copyWith =>
      CopyWith$Input$SpellOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$SpellOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$SpellOrder<TRes> {
  factory CopyWith$Input$SpellOrder(
    Input$SpellOrder instance,
    TRes Function(Input$SpellOrder) then,
  ) = _CopyWithImpl$Input$SpellOrder;

  factory CopyWith$Input$SpellOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$SpellOrder;

  TRes call({
    Enum$SpellOrderField? by,
    Enum$OrderByDirection? direction,
    Input$SpellOrder? then_by,
  });
  CopyWith$Input$SpellOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$SpellOrder<TRes>
    implements CopyWith$Input$SpellOrder<TRes> {
  _CopyWithImpl$Input$SpellOrder(this._instance, this._then);

  final Input$SpellOrder _instance;

  final TRes Function(Input$SpellOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$SpellOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null) 'by': (by as Enum$SpellOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined) 'then_by': (then_by as Input$SpellOrder?),
    }),
  );

  CopyWith$Input$SpellOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$SpellOrder.stub(_then(_instance))
        : CopyWith$Input$SpellOrder(local$then_by, (e) => call(then_by: e));
  }
}

class _CopyWithStubImpl$Input$SpellOrder<TRes>
    implements CopyWith$Input$SpellOrder<TRes> {
  _CopyWithStubImpl$Input$SpellOrder(this._res);

  TRes _res;

  call({
    Enum$SpellOrderField? by,
    Enum$OrderByDirection? direction,
    Input$SpellOrder? then_by,
  }) => _res;

  CopyWith$Input$SpellOrder<TRes> get then_by =>
      CopyWith$Input$SpellOrder.stub(_res);
}

class Input$SubclassOrder {
  factory Input$SubclassOrder({
    required Enum$SubclassOrderField by,
    required Enum$OrderByDirection direction,
    Input$SubclassOrder? then_by,
  }) => Input$SubclassOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$SubclassOrder._(this._$data);

  factory Input$SubclassOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$SubclassOrderField((l$by as String));
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$SubclassOrder.fromJson((l$then_by as Map<String, dynamic>));
    }
    return Input$SubclassOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$SubclassOrderField get by => (_$data['by'] as Enum$SubclassOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$SubclassOrder? get then_by =>
      (_$data['then_by'] as Input$SubclassOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$SubclassOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$SubclassOrder<Input$SubclassOrder> get copyWith =>
      CopyWith$Input$SubclassOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$SubclassOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$SubclassOrder<TRes> {
  factory CopyWith$Input$SubclassOrder(
    Input$SubclassOrder instance,
    TRes Function(Input$SubclassOrder) then,
  ) = _CopyWithImpl$Input$SubclassOrder;

  factory CopyWith$Input$SubclassOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$SubclassOrder;

  TRes call({
    Enum$SubclassOrderField? by,
    Enum$OrderByDirection? direction,
    Input$SubclassOrder? then_by,
  });
  CopyWith$Input$SubclassOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$SubclassOrder<TRes>
    implements CopyWith$Input$SubclassOrder<TRes> {
  _CopyWithImpl$Input$SubclassOrder(this._instance, this._then);

  final Input$SubclassOrder _instance;

  final TRes Function(Input$SubclassOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$SubclassOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null) 'by': (by as Enum$SubclassOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined) 'then_by': (then_by as Input$SubclassOrder?),
    }),
  );

  CopyWith$Input$SubclassOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$SubclassOrder.stub(_then(_instance))
        : CopyWith$Input$SubclassOrder(local$then_by, (e) => call(then_by: e));
  }
}

class _CopyWithStubImpl$Input$SubclassOrder<TRes>
    implements CopyWith$Input$SubclassOrder<TRes> {
  _CopyWithStubImpl$Input$SubclassOrder(this._res);

  TRes _res;

  call({
    Enum$SubclassOrderField? by,
    Enum$OrderByDirection? direction,
    Input$SubclassOrder? then_by,
  }) => _res;

  CopyWith$Input$SubclassOrder<TRes> get then_by =>
      CopyWith$Input$SubclassOrder.stub(_res);
}

class Input$SubraceOrder {
  factory Input$SubraceOrder({
    required Enum$SubraceOrderField by,
    required Enum$OrderByDirection direction,
    Input$SubraceOrder? then_by,
  }) => Input$SubraceOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$SubraceOrder._(this._$data);

  factory Input$SubraceOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$SubraceOrderField((l$by as String));
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$SubraceOrder.fromJson((l$then_by as Map<String, dynamic>));
    }
    return Input$SubraceOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$SubraceOrderField get by => (_$data['by'] as Enum$SubraceOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$SubraceOrder? get then_by => (_$data['then_by'] as Input$SubraceOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$SubraceOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$SubraceOrder<Input$SubraceOrder> get copyWith =>
      CopyWith$Input$SubraceOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$SubraceOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$SubraceOrder<TRes> {
  factory CopyWith$Input$SubraceOrder(
    Input$SubraceOrder instance,
    TRes Function(Input$SubraceOrder) then,
  ) = _CopyWithImpl$Input$SubraceOrder;

  factory CopyWith$Input$SubraceOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$SubraceOrder;

  TRes call({
    Enum$SubraceOrderField? by,
    Enum$OrderByDirection? direction,
    Input$SubraceOrder? then_by,
  });
  CopyWith$Input$SubraceOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$SubraceOrder<TRes>
    implements CopyWith$Input$SubraceOrder<TRes> {
  _CopyWithImpl$Input$SubraceOrder(this._instance, this._then);

  final Input$SubraceOrder _instance;

  final TRes Function(Input$SubraceOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$SubraceOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null) 'by': (by as Enum$SubraceOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined) 'then_by': (then_by as Input$SubraceOrder?),
    }),
  );

  CopyWith$Input$SubraceOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$SubraceOrder.stub(_then(_instance))
        : CopyWith$Input$SubraceOrder(local$then_by, (e) => call(then_by: e));
  }
}

class _CopyWithStubImpl$Input$SubraceOrder<TRes>
    implements CopyWith$Input$SubraceOrder<TRes> {
  _CopyWithStubImpl$Input$SubraceOrder(this._res);

  TRes _res;

  call({
    Enum$SubraceOrderField? by,
    Enum$OrderByDirection? direction,
    Input$SubraceOrder? then_by,
  }) => _res;

  CopyWith$Input$SubraceOrder<TRes> get then_by =>
      CopyWith$Input$SubraceOrder.stub(_res);
}

class Input$TraitOrder {
  factory Input$TraitOrder({
    required Enum$TraitOrderField by,
    required Enum$OrderByDirection direction,
    Input$TraitOrder? then_by,
  }) => Input$TraitOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$TraitOrder._(this._$data);

  factory Input$TraitOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$TraitOrderField((l$by as String));
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$TraitOrder.fromJson((l$then_by as Map<String, dynamic>));
    }
    return Input$TraitOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$TraitOrderField get by => (_$data['by'] as Enum$TraitOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$TraitOrder? get then_by => (_$data['then_by'] as Input$TraitOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$TraitOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$TraitOrder<Input$TraitOrder> get copyWith =>
      CopyWith$Input$TraitOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$TraitOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$TraitOrder<TRes> {
  factory CopyWith$Input$TraitOrder(
    Input$TraitOrder instance,
    TRes Function(Input$TraitOrder) then,
  ) = _CopyWithImpl$Input$TraitOrder;

  factory CopyWith$Input$TraitOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$TraitOrder;

  TRes call({
    Enum$TraitOrderField? by,
    Enum$OrderByDirection? direction,
    Input$TraitOrder? then_by,
  });
  CopyWith$Input$TraitOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$TraitOrder<TRes>
    implements CopyWith$Input$TraitOrder<TRes> {
  _CopyWithImpl$Input$TraitOrder(this._instance, this._then);

  final Input$TraitOrder _instance;

  final TRes Function(Input$TraitOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$TraitOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null) 'by': (by as Enum$TraitOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined) 'then_by': (then_by as Input$TraitOrder?),
    }),
  );

  CopyWith$Input$TraitOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$TraitOrder.stub(_then(_instance))
        : CopyWith$Input$TraitOrder(local$then_by, (e) => call(then_by: e));
  }
}

class _CopyWithStubImpl$Input$TraitOrder<TRes>
    implements CopyWith$Input$TraitOrder<TRes> {
  _CopyWithStubImpl$Input$TraitOrder(this._res);

  TRes _res;

  call({
    Enum$TraitOrderField? by,
    Enum$OrderByDirection? direction,
    Input$TraitOrder? then_by,
  }) => _res;

  CopyWith$Input$TraitOrder<TRes> get then_by =>
      CopyWith$Input$TraitOrder.stub(_res);
}

class Input$WeaponPropertyOrder {
  factory Input$WeaponPropertyOrder({
    required Enum$WeaponPropertyOrderField by,
    required Enum$OrderByDirection direction,
    Input$WeaponPropertyOrder? then_by,
  }) => Input$WeaponPropertyOrder._({
    r'by': by,
    r'direction': direction,
    if (then_by != null) r'then_by': then_by,
  });

  Input$WeaponPropertyOrder._(this._$data);

  factory Input$WeaponPropertyOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$by = data['by'];
    result$data['by'] = fromJson$Enum$WeaponPropertyOrderField(
      (l$by as String),
    );
    final l$direction = data['direction'];
    result$data['direction'] = fromJson$Enum$OrderByDirection(
      (l$direction as String),
    );
    if (data.containsKey('then_by')) {
      final l$then_by = data['then_by'];
      result$data['then_by'] = l$then_by == null
          ? null
          : Input$WeaponPropertyOrder.fromJson(
              (l$then_by as Map<String, dynamic>),
            );
    }
    return Input$WeaponPropertyOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$WeaponPropertyOrderField get by =>
      (_$data['by'] as Enum$WeaponPropertyOrderField);

  Enum$OrderByDirection get direction =>
      (_$data['direction'] as Enum$OrderByDirection);

  Input$WeaponPropertyOrder? get then_by =>
      (_$data['then_by'] as Input$WeaponPropertyOrder?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$by = by;
    result$data['by'] = toJson$Enum$WeaponPropertyOrderField(l$by);
    final l$direction = direction;
    result$data['direction'] = toJson$Enum$OrderByDirection(l$direction);
    if (_$data.containsKey('then_by')) {
      final l$then_by = then_by;
      result$data['then_by'] = l$then_by?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$WeaponPropertyOrder<Input$WeaponPropertyOrder> get copyWith =>
      CopyWith$Input$WeaponPropertyOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$WeaponPropertyOrder ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$by = by;
    final lOther$by = other.by;
    if (l$by != lOther$by) {
      return false;
    }
    final l$direction = direction;
    final lOther$direction = other.direction;
    if (l$direction != lOther$direction) {
      return false;
    }
    final l$then_by = then_by;
    final lOther$then_by = other.then_by;
    if (_$data.containsKey('then_by') != other._$data.containsKey('then_by')) {
      return false;
    }
    if (l$then_by != lOther$then_by) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$by = by;
    final l$direction = direction;
    final l$then_by = then_by;
    return Object.hashAll([
      l$by,
      l$direction,
      _$data.containsKey('then_by') ? l$then_by : const {},
    ]);
  }
}

abstract class CopyWith$Input$WeaponPropertyOrder<TRes> {
  factory CopyWith$Input$WeaponPropertyOrder(
    Input$WeaponPropertyOrder instance,
    TRes Function(Input$WeaponPropertyOrder) then,
  ) = _CopyWithImpl$Input$WeaponPropertyOrder;

  factory CopyWith$Input$WeaponPropertyOrder.stub(TRes res) =
      _CopyWithStubImpl$Input$WeaponPropertyOrder;

  TRes call({
    Enum$WeaponPropertyOrderField? by,
    Enum$OrderByDirection? direction,
    Input$WeaponPropertyOrder? then_by,
  });
  CopyWith$Input$WeaponPropertyOrder<TRes> get then_by;
}

class _CopyWithImpl$Input$WeaponPropertyOrder<TRes>
    implements CopyWith$Input$WeaponPropertyOrder<TRes> {
  _CopyWithImpl$Input$WeaponPropertyOrder(this._instance, this._then);

  final Input$WeaponPropertyOrder _instance;

  final TRes Function(Input$WeaponPropertyOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? by = _undefined,
    Object? direction = _undefined,
    Object? then_by = _undefined,
  }) => _then(
    Input$WeaponPropertyOrder._({
      ..._instance._$data,
      if (by != _undefined && by != null)
        'by': (by as Enum$WeaponPropertyOrderField),
      if (direction != _undefined && direction != null)
        'direction': (direction as Enum$OrderByDirection),
      if (then_by != _undefined)
        'then_by': (then_by as Input$WeaponPropertyOrder?),
    }),
  );

  CopyWith$Input$WeaponPropertyOrder<TRes> get then_by {
    final local$then_by = _instance.then_by;
    return local$then_by == null
        ? CopyWith$Input$WeaponPropertyOrder.stub(_then(_instance))
        : CopyWith$Input$WeaponPropertyOrder(
            local$then_by,
            (e) => call(then_by: e),
          );
  }
}

class _CopyWithStubImpl$Input$WeaponPropertyOrder<TRes>
    implements CopyWith$Input$WeaponPropertyOrder<TRes> {
  _CopyWithStubImpl$Input$WeaponPropertyOrder(this._res);

  TRes _res;

  call({
    Enum$WeaponPropertyOrderField? by,
    Enum$OrderByDirection? direction,
    Input$WeaponPropertyOrder? then_by,
  }) => _res;

  CopyWith$Input$WeaponPropertyOrder<TRes> get then_by =>
      CopyWith$Input$WeaponPropertyOrder.stub(_res);
}

enum Enum$AbilityScoreOrderField {
  NAME,
  FULL_NAME,
  $unknown;

  factory Enum$AbilityScoreOrderField.fromJson(String value) =>
      fromJson$Enum$AbilityScoreOrderField(value);

  String toJson() => toJson$Enum$AbilityScoreOrderField(this);
}

String toJson$Enum$AbilityScoreOrderField(Enum$AbilityScoreOrderField e) {
  switch (e) {
    case Enum$AbilityScoreOrderField.NAME:
      return r'NAME';
    case Enum$AbilityScoreOrderField.FULL_NAME:
      return r'FULL_NAME';
    case Enum$AbilityScoreOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$AbilityScoreOrderField fromJson$Enum$AbilityScoreOrderField(String value) {
  switch (value) {
    case r'NAME':
      return Enum$AbilityScoreOrderField.NAME;
    case r'FULL_NAME':
      return Enum$AbilityScoreOrderField.FULL_NAME;
    default:
      return Enum$AbilityScoreOrderField.$unknown;
  }
}

enum Enum$OrderByDirection {
  ASC,
  DESC,
  $unknown;

  factory Enum$OrderByDirection.fromJson(String value) =>
      fromJson$Enum$OrderByDirection(value);

  String toJson() => toJson$Enum$OrderByDirection(this);
}

String toJson$Enum$OrderByDirection(Enum$OrderByDirection e) {
  switch (e) {
    case Enum$OrderByDirection.ASC:
      return r'ASC';
    case Enum$OrderByDirection.DESC:
      return r'DESC';
    case Enum$OrderByDirection.$unknown:
      return r'$unknown';
  }
}

Enum$OrderByDirection fromJson$Enum$OrderByDirection(String value) {
  switch (value) {
    case r'ASC':
      return Enum$OrderByDirection.ASC;
    case r'DESC':
      return Enum$OrderByDirection.DESC;
    default:
      return Enum$OrderByDirection.$unknown;
  }
}

enum Enum$AlignmentOrderField {
  NAME,
  $unknown;

  factory Enum$AlignmentOrderField.fromJson(String value) =>
      fromJson$Enum$AlignmentOrderField(value);

  String toJson() => toJson$Enum$AlignmentOrderField(this);
}

String toJson$Enum$AlignmentOrderField(Enum$AlignmentOrderField e) {
  switch (e) {
    case Enum$AlignmentOrderField.NAME:
      return r'NAME';
    case Enum$AlignmentOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$AlignmentOrderField fromJson$Enum$AlignmentOrderField(String value) {
  switch (value) {
    case r'NAME':
      return Enum$AlignmentOrderField.NAME;
    default:
      return Enum$AlignmentOrderField.$unknown;
  }
}

enum Enum$BackgroundOrderField {
  NAME,
  $unknown;

  factory Enum$BackgroundOrderField.fromJson(String value) =>
      fromJson$Enum$BackgroundOrderField(value);

  String toJson() => toJson$Enum$BackgroundOrderField(this);
}

String toJson$Enum$BackgroundOrderField(Enum$BackgroundOrderField e) {
  switch (e) {
    case Enum$BackgroundOrderField.NAME:
      return r'NAME';
    case Enum$BackgroundOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$BackgroundOrderField fromJson$Enum$BackgroundOrderField(String value) {
  switch (value) {
    case r'NAME':
      return Enum$BackgroundOrderField.NAME;
    default:
      return Enum$BackgroundOrderField.$unknown;
  }
}

enum Enum$ClassOrderField {
  NAME,
  HIT_DIE,
  $unknown;

  factory Enum$ClassOrderField.fromJson(String value) =>
      fromJson$Enum$ClassOrderField(value);

  String toJson() => toJson$Enum$ClassOrderField(this);
}

String toJson$Enum$ClassOrderField(Enum$ClassOrderField e) {
  switch (e) {
    case Enum$ClassOrderField.NAME:
      return r'NAME';
    case Enum$ClassOrderField.HIT_DIE:
      return r'HIT_DIE';
    case Enum$ClassOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$ClassOrderField fromJson$Enum$ClassOrderField(String value) {
  switch (value) {
    case r'NAME':
      return Enum$ClassOrderField.NAME;
    case r'HIT_DIE':
      return Enum$ClassOrderField.HIT_DIE;
    default:
      return Enum$ClassOrderField.$unknown;
  }
}

enum Enum$ConditionOrderField {
  NAME,
  $unknown;

  factory Enum$ConditionOrderField.fromJson(String value) =>
      fromJson$Enum$ConditionOrderField(value);

  String toJson() => toJson$Enum$ConditionOrderField(this);
}

String toJson$Enum$ConditionOrderField(Enum$ConditionOrderField e) {
  switch (e) {
    case Enum$ConditionOrderField.NAME:
      return r'NAME';
    case Enum$ConditionOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$ConditionOrderField fromJson$Enum$ConditionOrderField(String value) {
  switch (value) {
    case r'NAME':
      return Enum$ConditionOrderField.NAME;
    default:
      return Enum$ConditionOrderField.$unknown;
  }
}

enum Enum$DamageTypeOrderField {
  NAME,
  $unknown;

  factory Enum$DamageTypeOrderField.fromJson(String value) =>
      fromJson$Enum$DamageTypeOrderField(value);

  String toJson() => toJson$Enum$DamageTypeOrderField(this);
}

String toJson$Enum$DamageTypeOrderField(Enum$DamageTypeOrderField e) {
  switch (e) {
    case Enum$DamageTypeOrderField.NAME:
      return r'NAME';
    case Enum$DamageTypeOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$DamageTypeOrderField fromJson$Enum$DamageTypeOrderField(String value) {
  switch (value) {
    case r'NAME':
      return Enum$DamageTypeOrderField.NAME;
    default:
      return Enum$DamageTypeOrderField.$unknown;
  }
}

enum Enum$EquipmentOrderField {
  NAME,
  WEIGHT,
  COST_QUANTITY,
  $unknown;

  factory Enum$EquipmentOrderField.fromJson(String value) =>
      fromJson$Enum$EquipmentOrderField(value);

  String toJson() => toJson$Enum$EquipmentOrderField(this);
}

String toJson$Enum$EquipmentOrderField(Enum$EquipmentOrderField e) {
  switch (e) {
    case Enum$EquipmentOrderField.NAME:
      return r'NAME';
    case Enum$EquipmentOrderField.WEIGHT:
      return r'WEIGHT';
    case Enum$EquipmentOrderField.COST_QUANTITY:
      return r'COST_QUANTITY';
    case Enum$EquipmentOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$EquipmentOrderField fromJson$Enum$EquipmentOrderField(String value) {
  switch (value) {
    case r'NAME':
      return Enum$EquipmentOrderField.NAME;
    case r'WEIGHT':
      return Enum$EquipmentOrderField.WEIGHT;
    case r'COST_QUANTITY':
      return Enum$EquipmentOrderField.COST_QUANTITY;
    default:
      return Enum$EquipmentOrderField.$unknown;
  }
}

enum Enum$EquipmentCategoryOrderField {
  NAME,
  $unknown;

  factory Enum$EquipmentCategoryOrderField.fromJson(String value) =>
      fromJson$Enum$EquipmentCategoryOrderField(value);

  String toJson() => toJson$Enum$EquipmentCategoryOrderField(this);
}

String toJson$Enum$EquipmentCategoryOrderField(
  Enum$EquipmentCategoryOrderField e,
) {
  switch (e) {
    case Enum$EquipmentCategoryOrderField.NAME:
      return r'NAME';
    case Enum$EquipmentCategoryOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$EquipmentCategoryOrderField fromJson$Enum$EquipmentCategoryOrderField(
  String value,
) {
  switch (value) {
    case r'NAME':
      return Enum$EquipmentCategoryOrderField.NAME;
    default:
      return Enum$EquipmentCategoryOrderField.$unknown;
  }
}

enum Enum$FeatOrderField {
  NAME,
  $unknown;

  factory Enum$FeatOrderField.fromJson(String value) =>
      fromJson$Enum$FeatOrderField(value);

  String toJson() => toJson$Enum$FeatOrderField(this);
}

String toJson$Enum$FeatOrderField(Enum$FeatOrderField e) {
  switch (e) {
    case Enum$FeatOrderField.NAME:
      return r'NAME';
    case Enum$FeatOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$FeatOrderField fromJson$Enum$FeatOrderField(String value) {
  switch (value) {
    case r'NAME':
      return Enum$FeatOrderField.NAME;
    default:
      return Enum$FeatOrderField.$unknown;
  }
}

enum Enum$FeatureOrderField {
  NAME,
  LEVEL,
  CLASS,
  SUBCLASS,
  $unknown;

  factory Enum$FeatureOrderField.fromJson(String value) =>
      fromJson$Enum$FeatureOrderField(value);

  String toJson() => toJson$Enum$FeatureOrderField(this);
}

String toJson$Enum$FeatureOrderField(Enum$FeatureOrderField e) {
  switch (e) {
    case Enum$FeatureOrderField.NAME:
      return r'NAME';
    case Enum$FeatureOrderField.LEVEL:
      return r'LEVEL';
    case Enum$FeatureOrderField.CLASS:
      return r'CLASS';
    case Enum$FeatureOrderField.SUBCLASS:
      return r'SUBCLASS';
    case Enum$FeatureOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$FeatureOrderField fromJson$Enum$FeatureOrderField(String value) {
  switch (value) {
    case r'NAME':
      return Enum$FeatureOrderField.NAME;
    case r'LEVEL':
      return Enum$FeatureOrderField.LEVEL;
    case r'CLASS':
      return Enum$FeatureOrderField.CLASS;
    case r'SUBCLASS':
      return Enum$FeatureOrderField.SUBCLASS;
    default:
      return Enum$FeatureOrderField.$unknown;
  }
}

enum Enum$LanguageOrderField {
  NAME,
  TYPE,
  SCRIPT,
  $unknown;

  factory Enum$LanguageOrderField.fromJson(String value) =>
      fromJson$Enum$LanguageOrderField(value);

  String toJson() => toJson$Enum$LanguageOrderField(this);
}

String toJson$Enum$LanguageOrderField(Enum$LanguageOrderField e) {
  switch (e) {
    case Enum$LanguageOrderField.NAME:
      return r'NAME';
    case Enum$LanguageOrderField.TYPE:
      return r'TYPE';
    case Enum$LanguageOrderField.SCRIPT:
      return r'SCRIPT';
    case Enum$LanguageOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$LanguageOrderField fromJson$Enum$LanguageOrderField(String value) {
  switch (value) {
    case r'NAME':
      return Enum$LanguageOrderField.NAME;
    case r'TYPE':
      return Enum$LanguageOrderField.TYPE;
    case r'SCRIPT':
      return Enum$LanguageOrderField.SCRIPT;
    default:
      return Enum$LanguageOrderField.$unknown;
  }
}

enum Enum$LevelOrderField {
  LEVEL,
  CLASS,
  SUBCLASS,
  $unknown;

  factory Enum$LevelOrderField.fromJson(String value) =>
      fromJson$Enum$LevelOrderField(value);

  String toJson() => toJson$Enum$LevelOrderField(this);
}

String toJson$Enum$LevelOrderField(Enum$LevelOrderField e) {
  switch (e) {
    case Enum$LevelOrderField.LEVEL:
      return r'LEVEL';
    case Enum$LevelOrderField.CLASS:
      return r'CLASS';
    case Enum$LevelOrderField.SUBCLASS:
      return r'SUBCLASS';
    case Enum$LevelOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$LevelOrderField fromJson$Enum$LevelOrderField(String value) {
  switch (value) {
    case r'LEVEL':
      return Enum$LevelOrderField.LEVEL;
    case r'CLASS':
      return Enum$LevelOrderField.CLASS;
    case r'SUBCLASS':
      return Enum$LevelOrderField.SUBCLASS;
    default:
      return Enum$LevelOrderField.$unknown;
  }
}

enum Enum$MagicItemOrderField {
  NAME,
  EQUIPMENT_CATEGORY,
  RARITY,
  $unknown;

  factory Enum$MagicItemOrderField.fromJson(String value) =>
      fromJson$Enum$MagicItemOrderField(value);

  String toJson() => toJson$Enum$MagicItemOrderField(this);
}

String toJson$Enum$MagicItemOrderField(Enum$MagicItemOrderField e) {
  switch (e) {
    case Enum$MagicItemOrderField.NAME:
      return r'NAME';
    case Enum$MagicItemOrderField.EQUIPMENT_CATEGORY:
      return r'EQUIPMENT_CATEGORY';
    case Enum$MagicItemOrderField.RARITY:
      return r'RARITY';
    case Enum$MagicItemOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$MagicItemOrderField fromJson$Enum$MagicItemOrderField(String value) {
  switch (value) {
    case r'NAME':
      return Enum$MagicItemOrderField.NAME;
    case r'EQUIPMENT_CATEGORY':
      return Enum$MagicItemOrderField.EQUIPMENT_CATEGORY;
    case r'RARITY':
      return Enum$MagicItemOrderField.RARITY;
    default:
      return Enum$MagicItemOrderField.$unknown;
  }
}

enum Enum$MagicSchoolOrderField {
  NAME,
  $unknown;

  factory Enum$MagicSchoolOrderField.fromJson(String value) =>
      fromJson$Enum$MagicSchoolOrderField(value);

  String toJson() => toJson$Enum$MagicSchoolOrderField(this);
}

String toJson$Enum$MagicSchoolOrderField(Enum$MagicSchoolOrderField e) {
  switch (e) {
    case Enum$MagicSchoolOrderField.NAME:
      return r'NAME';
    case Enum$MagicSchoolOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$MagicSchoolOrderField fromJson$Enum$MagicSchoolOrderField(String value) {
  switch (value) {
    case r'NAME':
      return Enum$MagicSchoolOrderField.NAME;
    default:
      return Enum$MagicSchoolOrderField.$unknown;
  }
}

enum Enum$MonsterOrderField {
  NAME,
  TYPE,
  SIZE,
  CHALLENGE_RATING,
  STRENGTH,
  DEXTERITY,
  CONSTITUTION,
  INTELLIGENCE,
  WISDOM,
  CHARISMA,
  $unknown;

  factory Enum$MonsterOrderField.fromJson(String value) =>
      fromJson$Enum$MonsterOrderField(value);

  String toJson() => toJson$Enum$MonsterOrderField(this);
}

String toJson$Enum$MonsterOrderField(Enum$MonsterOrderField e) {
  switch (e) {
    case Enum$MonsterOrderField.NAME:
      return r'NAME';
    case Enum$MonsterOrderField.TYPE:
      return r'TYPE';
    case Enum$MonsterOrderField.SIZE:
      return r'SIZE';
    case Enum$MonsterOrderField.CHALLENGE_RATING:
      return r'CHALLENGE_RATING';
    case Enum$MonsterOrderField.STRENGTH:
      return r'STRENGTH';
    case Enum$MonsterOrderField.DEXTERITY:
      return r'DEXTERITY';
    case Enum$MonsterOrderField.CONSTITUTION:
      return r'CONSTITUTION';
    case Enum$MonsterOrderField.INTELLIGENCE:
      return r'INTELLIGENCE';
    case Enum$MonsterOrderField.WISDOM:
      return r'WISDOM';
    case Enum$MonsterOrderField.CHARISMA:
      return r'CHARISMA';
    case Enum$MonsterOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$MonsterOrderField fromJson$Enum$MonsterOrderField(String value) {
  switch (value) {
    case r'NAME':
      return Enum$MonsterOrderField.NAME;
    case r'TYPE':
      return Enum$MonsterOrderField.TYPE;
    case r'SIZE':
      return Enum$MonsterOrderField.SIZE;
    case r'CHALLENGE_RATING':
      return Enum$MonsterOrderField.CHALLENGE_RATING;
    case r'STRENGTH':
      return Enum$MonsterOrderField.STRENGTH;
    case r'DEXTERITY':
      return Enum$MonsterOrderField.DEXTERITY;
    case r'CONSTITUTION':
      return Enum$MonsterOrderField.CONSTITUTION;
    case r'INTELLIGENCE':
      return Enum$MonsterOrderField.INTELLIGENCE;
    case r'WISDOM':
      return Enum$MonsterOrderField.WISDOM;
    case r'CHARISMA':
      return Enum$MonsterOrderField.CHARISMA;
    default:
      return Enum$MonsterOrderField.$unknown;
  }
}

enum Enum$ProficiencyOrderField {
  NAME,
  TYPE,
  $unknown;

  factory Enum$ProficiencyOrderField.fromJson(String value) =>
      fromJson$Enum$ProficiencyOrderField(value);

  String toJson() => toJson$Enum$ProficiencyOrderField(this);
}

String toJson$Enum$ProficiencyOrderField(Enum$ProficiencyOrderField e) {
  switch (e) {
    case Enum$ProficiencyOrderField.NAME:
      return r'NAME';
    case Enum$ProficiencyOrderField.TYPE:
      return r'TYPE';
    case Enum$ProficiencyOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$ProficiencyOrderField fromJson$Enum$ProficiencyOrderField(String value) {
  switch (value) {
    case r'NAME':
      return Enum$ProficiencyOrderField.NAME;
    case r'TYPE':
      return Enum$ProficiencyOrderField.TYPE;
    default:
      return Enum$ProficiencyOrderField.$unknown;
  }
}

enum Enum$RaceOrderField {
  NAME,
  $unknown;

  factory Enum$RaceOrderField.fromJson(String value) =>
      fromJson$Enum$RaceOrderField(value);

  String toJson() => toJson$Enum$RaceOrderField(this);
}

String toJson$Enum$RaceOrderField(Enum$RaceOrderField e) {
  switch (e) {
    case Enum$RaceOrderField.NAME:
      return r'NAME';
    case Enum$RaceOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$RaceOrderField fromJson$Enum$RaceOrderField(String value) {
  switch (value) {
    case r'NAME':
      return Enum$RaceOrderField.NAME;
    default:
      return Enum$RaceOrderField.$unknown;
  }
}

enum Enum$RuleOrderField {
  NAME,
  $unknown;

  factory Enum$RuleOrderField.fromJson(String value) =>
      fromJson$Enum$RuleOrderField(value);

  String toJson() => toJson$Enum$RuleOrderField(this);
}

String toJson$Enum$RuleOrderField(Enum$RuleOrderField e) {
  switch (e) {
    case Enum$RuleOrderField.NAME:
      return r'NAME';
    case Enum$RuleOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$RuleOrderField fromJson$Enum$RuleOrderField(String value) {
  switch (value) {
    case r'NAME':
      return Enum$RuleOrderField.NAME;
    default:
      return Enum$RuleOrderField.$unknown;
  }
}

enum Enum$RuleSectionOrderField {
  NAME,
  $unknown;

  factory Enum$RuleSectionOrderField.fromJson(String value) =>
      fromJson$Enum$RuleSectionOrderField(value);

  String toJson() => toJson$Enum$RuleSectionOrderField(this);
}

String toJson$Enum$RuleSectionOrderField(Enum$RuleSectionOrderField e) {
  switch (e) {
    case Enum$RuleSectionOrderField.NAME:
      return r'NAME';
    case Enum$RuleSectionOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$RuleSectionOrderField fromJson$Enum$RuleSectionOrderField(String value) {
  switch (value) {
    case r'NAME':
      return Enum$RuleSectionOrderField.NAME;
    default:
      return Enum$RuleSectionOrderField.$unknown;
  }
}

enum Enum$SkillOrderField {
  NAME,
  ABILITY_SCORE,
  $unknown;

  factory Enum$SkillOrderField.fromJson(String value) =>
      fromJson$Enum$SkillOrderField(value);

  String toJson() => toJson$Enum$SkillOrderField(this);
}

String toJson$Enum$SkillOrderField(Enum$SkillOrderField e) {
  switch (e) {
    case Enum$SkillOrderField.NAME:
      return r'NAME';
    case Enum$SkillOrderField.ABILITY_SCORE:
      return r'ABILITY_SCORE';
    case Enum$SkillOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$SkillOrderField fromJson$Enum$SkillOrderField(String value) {
  switch (value) {
    case r'NAME':
      return Enum$SkillOrderField.NAME;
    case r'ABILITY_SCORE':
      return Enum$SkillOrderField.ABILITY_SCORE;
    default:
      return Enum$SkillOrderField.$unknown;
  }
}

enum Enum$SpellOrderField {
  NAME,
  LEVEL,
  SCHOOL,
  AREA_OF_EFFECT_SIZE,
  $unknown;

  factory Enum$SpellOrderField.fromJson(String value) =>
      fromJson$Enum$SpellOrderField(value);

  String toJson() => toJson$Enum$SpellOrderField(this);
}

String toJson$Enum$SpellOrderField(Enum$SpellOrderField e) {
  switch (e) {
    case Enum$SpellOrderField.NAME:
      return r'NAME';
    case Enum$SpellOrderField.LEVEL:
      return r'LEVEL';
    case Enum$SpellOrderField.SCHOOL:
      return r'SCHOOL';
    case Enum$SpellOrderField.AREA_OF_EFFECT_SIZE:
      return r'AREA_OF_EFFECT_SIZE';
    case Enum$SpellOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$SpellOrderField fromJson$Enum$SpellOrderField(String value) {
  switch (value) {
    case r'NAME':
      return Enum$SpellOrderField.NAME;
    case r'LEVEL':
      return Enum$SpellOrderField.LEVEL;
    case r'SCHOOL':
      return Enum$SpellOrderField.SCHOOL;
    case r'AREA_OF_EFFECT_SIZE':
      return Enum$SpellOrderField.AREA_OF_EFFECT_SIZE;
    default:
      return Enum$SpellOrderField.$unknown;
  }
}

enum Enum$SubclassOrderField {
  NAME,
  $unknown;

  factory Enum$SubclassOrderField.fromJson(String value) =>
      fromJson$Enum$SubclassOrderField(value);

  String toJson() => toJson$Enum$SubclassOrderField(this);
}

String toJson$Enum$SubclassOrderField(Enum$SubclassOrderField e) {
  switch (e) {
    case Enum$SubclassOrderField.NAME:
      return r'NAME';
    case Enum$SubclassOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$SubclassOrderField fromJson$Enum$SubclassOrderField(String value) {
  switch (value) {
    case r'NAME':
      return Enum$SubclassOrderField.NAME;
    default:
      return Enum$SubclassOrderField.$unknown;
  }
}

enum Enum$SubraceOrderField {
  NAME,
  $unknown;

  factory Enum$SubraceOrderField.fromJson(String value) =>
      fromJson$Enum$SubraceOrderField(value);

  String toJson() => toJson$Enum$SubraceOrderField(this);
}

String toJson$Enum$SubraceOrderField(Enum$SubraceOrderField e) {
  switch (e) {
    case Enum$SubraceOrderField.NAME:
      return r'NAME';
    case Enum$SubraceOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$SubraceOrderField fromJson$Enum$SubraceOrderField(String value) {
  switch (value) {
    case r'NAME':
      return Enum$SubraceOrderField.NAME;
    default:
      return Enum$SubraceOrderField.$unknown;
  }
}

enum Enum$TraitOrderField {
  NAME,
  $unknown;

  factory Enum$TraitOrderField.fromJson(String value) =>
      fromJson$Enum$TraitOrderField(value);

  String toJson() => toJson$Enum$TraitOrderField(this);
}

String toJson$Enum$TraitOrderField(Enum$TraitOrderField e) {
  switch (e) {
    case Enum$TraitOrderField.NAME:
      return r'NAME';
    case Enum$TraitOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$TraitOrderField fromJson$Enum$TraitOrderField(String value) {
  switch (value) {
    case r'NAME':
      return Enum$TraitOrderField.NAME;
    default:
      return Enum$TraitOrderField.$unknown;
  }
}

enum Enum$WeaponPropertyOrderField {
  NAME,
  $unknown;

  factory Enum$WeaponPropertyOrderField.fromJson(String value) =>
      fromJson$Enum$WeaponPropertyOrderField(value);

  String toJson() => toJson$Enum$WeaponPropertyOrderField(this);
}

String toJson$Enum$WeaponPropertyOrderField(Enum$WeaponPropertyOrderField e) {
  switch (e) {
    case Enum$WeaponPropertyOrderField.NAME:
      return r'NAME';
    case Enum$WeaponPropertyOrderField.$unknown:
      return r'$unknown';
  }
}

Enum$WeaponPropertyOrderField fromJson$Enum$WeaponPropertyOrderField(
  String value,
) {
  switch (value) {
    case r'NAME':
      return Enum$WeaponPropertyOrderField.NAME;
    default:
      return Enum$WeaponPropertyOrderField.$unknown;
  }
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown;

  factory Enum$__TypeKind.fromJson(String value) =>
      fromJson$Enum$__TypeKind(value);

  String toJson() => toJson$Enum$__TypeKind(this);
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown;

  factory Enum$__DirectiveLocation.fromJson(String value) =>
      fromJson$Enum$__DirectiveLocation(value);

  String toJson() => toJson$Enum$__DirectiveLocation(this);
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{
  'SubclassSpellPrerequisite': {'Level', 'Feature'},
  'FeaturePrerequisiteUnion': {
    'LevelPrerequisite',
    'FeaturePrerequisite',
    'SpellPrerequisite',
  },
  'ProficiencyChoiceItem': {'Proficiency', 'ProficiencyChoice'},
  'AnyEquipment': {
    'Armor',
    'Weapon',
    'Tool',
    'Gear',
    'Pack',
    'Ammunition',
    'Vehicle',
  },
  'IEquipment': {
    'Armor',
    'Weapon',
    'Tool',
    'Gear',
    'Pack',
    'Ammunition',
    'Vehicle',
  },
  'EquipmentOrMagicItem': {
    'Armor',
    'Weapon',
    'Tool',
    'Gear',
    'Pack',
    'Ammunition',
    'Vehicle',
    'MagicItem',
  },
  'StartingEquipmentFromUnion': {'EquipmentCategorySet', 'EquipmentOptionSet'},
  'EquipmentOptionUnion': {
    'CountedReferenceOption',
    'EquipmentCategoryChoiceOption',
    'MultipleItemsOption',
  },
  'MultipleItemUnion': {
    'CountedReferenceOption',
    'EquipmentCategoryChoiceOption',
  },
  'ProficiencyReference': {
    'Equipment',
    'EquipmentCategory',
    'AbilityScore',
    'Skill',
  },
  'DamageOrDamageChoice': {'Damage', 'DamageChoice'},
  'ActionOptionUnion': {'ActionChoiceOption', 'MultipleActionChoiceOption'},
  'MonsterArmorClass': {
    'ArmorClassDex',
    'ArmorClassNatural',
    'ArmorClassArmor',
    'ArmorClassSpell',
    'ArmorClassCondition',
  },
};
