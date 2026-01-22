// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monsters_providers_with_debounce.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchQueryWithDebounce)
final searchQueryWithDebounceProvider = SearchQueryWithDebounceProvider._();

final class SearchQueryWithDebounceProvider
    extends $NotifierProvider<SearchQueryWithDebounce, String> {
  SearchQueryWithDebounceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchQueryWithDebounceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchQueryWithDebounceHash();

  @$internal
  @override
  SearchQueryWithDebounce create() => SearchQueryWithDebounce();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$searchQueryWithDebounceHash() =>
    r'e177201fc8b98eadedd3c4c29b17b40605f420ee';

abstract class _$SearchQueryWithDebounce extends $Notifier<String> {
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

@ProviderFor(monstersWithDebounce)
final monstersWithDebounceProvider = MonstersWithDebounceFamily._();

final class MonstersWithDebounceProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Monster>>,
          List<Monster>,
          FutureOr<List<Monster>>
        >
    with $FutureModifier<List<Monster>>, $FutureProvider<List<Monster>> {
  MonstersWithDebounceProvider._({
    required MonstersWithDebounceFamily super.from,
    required GraphQLService super.argument,
  }) : super(
         retry: null,
         name: r'monstersWithDebounceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$monstersWithDebounceHash();

  @override
  String toString() {
    return r'monstersWithDebounceProvider'
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
    return monstersWithDebounce(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MonstersWithDebounceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$monstersWithDebounceHash() =>
    r'05245bed018eda83c46bc9c02c2a4fb5993e5970';

final class MonstersWithDebounceFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Monster>>, GraphQLService> {
  MonstersWithDebounceFamily._()
    : super(
        retry: null,
        name: r'monstersWithDebounceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MonstersWithDebounceProvider call(GraphQLService service) =>
      MonstersWithDebounceProvider._(argument: service, from: this);

  @override
  String toString() => r'monstersWithDebounceProvider';
}

@ProviderFor(filteredMonstersWithDebounce)
final filteredMonstersWithDebounceProvider =
    FilteredMonstersWithDebounceFamily._();

final class FilteredMonstersWithDebounceProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Monster>>,
          AsyncValue<List<Monster>>,
          AsyncValue<List<Monster>>
        >
    with $Provider<AsyncValue<List<Monster>>> {
  FilteredMonstersWithDebounceProvider._({
    required FilteredMonstersWithDebounceFamily super.from,
    required GraphQLService super.argument,
  }) : super(
         retry: null,
         name: r'filteredMonstersWithDebounceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$filteredMonstersWithDebounceHash();

  @override
  String toString() {
    return r'filteredMonstersWithDebounceProvider'
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
    return filteredMonstersWithDebounce(ref, argument);
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
    return other is FilteredMonstersWithDebounceProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$filteredMonstersWithDebounceHash() =>
    r'5da8571f9e2e01caf65bc397367c97d90b498e4e';

final class FilteredMonstersWithDebounceFamily extends $Family
    with $FunctionalFamilyOverride<AsyncValue<List<Monster>>, GraphQLService> {
  FilteredMonstersWithDebounceFamily._()
    : super(
        retry: null,
        name: r'filteredMonstersWithDebounceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FilteredMonstersWithDebounceProvider call(GraphQLService service) =>
      FilteredMonstersWithDebounceProvider._(argument: service, from: this);

  @override
  String toString() => r'filteredMonstersWithDebounceProvider';
}
