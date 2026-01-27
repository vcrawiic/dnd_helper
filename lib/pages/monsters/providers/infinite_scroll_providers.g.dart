// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infinite_scroll_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(InfiniteScroll)
final infiniteScrollProvider = InfiniteScrollFamily._();

final class InfiniteScrollProvider
    extends $NotifierProvider<InfiniteScroll, InfiniteScrollState> {
  InfiniteScrollProvider._({
    required InfiniteScrollFamily super.from,
    required GraphQLService super.argument,
  }) : super(
         retry: null,
         name: r'infiniteScrollProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$infiniteScrollHash();

  @override
  String toString() {
    return r'infiniteScrollProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  InfiniteScroll create() => InfiniteScroll();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InfiniteScrollState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InfiniteScrollState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is InfiniteScrollProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$infiniteScrollHash() => r'0c59151588ecad77eb2dec7311a31fcecc7a5829';

final class InfiniteScrollFamily extends $Family
    with
        $ClassFamilyOverride<
          InfiniteScroll,
          InfiniteScrollState,
          InfiniteScrollState,
          InfiniteScrollState,
          GraphQLService
        > {
  InfiniteScrollFamily._()
    : super(
        retry: null,
        name: r'infiniteScrollProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InfiniteScrollProvider call(GraphQLService service) =>
      InfiniteScrollProvider._(argument: service, from: this);

  @override
  String toString() => r'infiniteScrollProvider';
}

abstract class _$InfiniteScroll extends $Notifier<InfiniteScrollState> {
  late final _$args = ref.$arg as GraphQLService;
  GraphQLService get service => _$args;

  InfiniteScrollState build(GraphQLService service);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<InfiniteScrollState, InfiniteScrollState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<InfiniteScrollState, InfiniteScrollState>,
              InfiniteScrollState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(allMonsters)
final allMonstersProvider = AllMonstersFamily._();

final class AllMonstersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Monster>>,
          List<Monster>,
          FutureOr<List<Monster>>
        >
    with $FutureModifier<List<Monster>>, $FutureProvider<List<Monster>> {
  AllMonstersProvider._({
    required AllMonstersFamily super.from,
    required GraphQLService super.argument,
  }) : super(
         retry: null,
         name: r'allMonstersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$allMonstersHash();

  @override
  String toString() {
    return r'allMonstersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Monster>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Monster>> create(Ref ref) {
    final argument = this.argument as GraphQLService;
    return allMonsters(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AllMonstersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$allMonstersHash() => r'21bee3e6854b474967e037b38e62d6a251d8310a';

final class AllMonstersFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Monster>>, GraphQLService> {
  AllMonstersFamily._()
    : super(
        retry: null,
        name: r'allMonstersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AllMonstersProvider call(GraphQLService service) =>
      AllMonstersProvider._(argument: service, from: this);

  @override
  String toString() => r'allMonstersProvider';
}

@ProviderFor(InfiniteScrollSearchQuery)
final infiniteScrollSearchQueryProvider = InfiniteScrollSearchQueryProvider._();

final class InfiniteScrollSearchQueryProvider
    extends $NotifierProvider<InfiniteScrollSearchQuery, String> {
  InfiniteScrollSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'infiniteScrollSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$infiniteScrollSearchQueryHash();

  @$internal
  @override
  InfiniteScrollSearchQuery create() => InfiniteScrollSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$infiniteScrollSearchQueryHash() =>
    r'13dc79ddb81b6fadaabd2939664d16191f72a1ff';

abstract class _$InfiniteScrollSearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(filteredMonstersInfinite)
final filteredMonstersInfiniteProvider = FilteredMonstersInfiniteFamily._();

final class FilteredMonstersInfiniteProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Monster>>,
          AsyncValue<List<Monster>>,
          AsyncValue<List<Monster>>
        >
    with $Provider<AsyncValue<List<Monster>>> {
  FilteredMonstersInfiniteProvider._({
    required FilteredMonstersInfiniteFamily super.from,
    required GraphQLService super.argument,
  }) : super(
         retry: null,
         name: r'filteredMonstersInfiniteProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$filteredMonstersInfiniteHash();

  @override
  String toString() {
    return r'filteredMonstersInfiniteProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<AsyncValue<List<Monster>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<List<Monster>> create(Ref ref) {
    final argument = this.argument as GraphQLService;
    return filteredMonstersInfinite(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<Monster>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<Monster>>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredMonstersInfiniteProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$filteredMonstersInfiniteHash() =>
    r'4de5393fe6214102cf8b8557bc35b625eb9ade51';

final class FilteredMonstersInfiniteFamily extends $Family
    with $FunctionalFamilyOverride<AsyncValue<List<Monster>>, GraphQLService> {
  FilteredMonstersInfiniteFamily._()
    : super(
        retry: null,
        name: r'filteredMonstersInfiniteProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FilteredMonstersInfiniteProvider call(GraphQLService service) =>
      FilteredMonstersInfiniteProvider._(argument: service, from: this);

  @override
  String toString() => r'filteredMonstersInfiniteProvider';
}
