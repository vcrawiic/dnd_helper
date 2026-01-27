// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monsters_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchQuery)
final searchQueryProvider = SearchQueryProvider._();

final class SearchQueryProvider extends $NotifierProvider<SearchQuery, String> {
  SearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchQueryHash();

  @$internal
  @override
  SearchQuery create() => SearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$searchQueryHash() => r'790bd96a8a13bb944767c7bf06a5378cfc78a54d';

abstract class _$SearchQuery extends $Notifier<String> {
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

@ProviderFor(monsters)
final monstersProvider = MonstersFamily._();

final class MonstersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Monster>>,
          List<Monster>,
          FutureOr<List<Monster>>
        >
    with $FutureModifier<List<Monster>>, $FutureProvider<List<Monster>> {
  MonstersProvider._({
    required MonstersFamily super.from,
    required GraphQLService super.argument,
  }) : super(
         retry: null,
         name: r'monstersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$monstersHash();

  @override
  String toString() {
    return r'monstersProvider'
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
    return monsters(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MonstersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$monstersHash() => r'8a528bb931b87792068f430f201182f718e80684';

final class MonstersFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Monster>>, GraphQLService> {
  MonstersFamily._()
    : super(
        retry: null,
        name: r'monstersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MonstersProvider call(GraphQLService service) =>
      MonstersProvider._(argument: service, from: this);

  @override
  String toString() => r'monstersProvider';
}

@ProviderFor(filteredMonsters)
final filteredMonstersProvider = FilteredMonstersFamily._();

final class FilteredMonstersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Monster>>,
          AsyncValue<List<Monster>>,
          AsyncValue<List<Monster>>
        >
    with $Provider<AsyncValue<List<Monster>>> {
  FilteredMonstersProvider._({
    required FilteredMonstersFamily super.from,
    required GraphQLService super.argument,
  }) : super(
         retry: null,
         name: r'filteredMonstersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$filteredMonstersHash();

  @override
  String toString() {
    return r'filteredMonstersProvider'
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
    return filteredMonsters(ref, argument);
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
    return other is FilteredMonstersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$filteredMonstersHash() => r'a426f74deb196ed569a5761f7c91e97c8ddc7cfa';

final class FilteredMonstersFamily extends $Family
    with $FunctionalFamilyOverride<AsyncValue<List<Monster>>, GraphQLService> {
  FilteredMonstersFamily._()
    : super(
        retry: null,
        name: r'filteredMonstersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FilteredMonstersProvider call(GraphQLService service) =>
      FilteredMonstersProvider._(argument: service, from: this);

  @override
  String toString() => r'filteredMonstersProvider';
}
