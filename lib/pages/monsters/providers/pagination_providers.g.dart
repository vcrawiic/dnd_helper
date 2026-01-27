// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CurrentPage)
final currentPageProvider = CurrentPageProvider._();

final class CurrentPageProvider extends $NotifierProvider<CurrentPage, int> {
  CurrentPageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentPageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentPageHash();

  @$internal
  @override
  CurrentPage create() => CurrentPage();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$currentPageHash() => r'b20b78115f344fef1a514dde15057df442526539';

abstract class _$CurrentPage extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(PaginationSearchQuery)
final paginationSearchQueryProvider = PaginationSearchQueryProvider._();

final class PaginationSearchQueryProvider
    extends $NotifierProvider<PaginationSearchQuery, String> {
  PaginationSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paginationSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paginationSearchQueryHash();

  @$internal
  @override
  PaginationSearchQuery create() => PaginationSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$paginationSearchQueryHash() =>
    r'63efedc0cae037d56d0e82ca702c31b9ba7a7a6e';

abstract class _$PaginationSearchQuery extends $Notifier<String> {
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

@ProviderFor(paginatedMonsters)
final paginatedMonstersProvider = PaginatedMonstersFamily._();

final class PaginatedMonstersProvider
    extends
        $FunctionalProvider<
          AsyncValue<Monsters?>,
          Monsters?,
          FutureOr<Monsters?>
        >
    with $FutureModifier<Monsters?>, $FutureProvider<Monsters?> {
  PaginatedMonstersProvider._({
    required PaginatedMonstersFamily super.from,
    required GraphQLService super.argument,
  }) : super(
         retry: null,
         name: r'paginatedMonstersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$paginatedMonstersHash();

  @override
  String toString() {
    return r'paginatedMonstersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Monsters?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Monsters?> create(Ref ref) {
    final argument = this.argument as GraphQLService;
    return paginatedMonsters(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedMonstersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$paginatedMonstersHash() => r'2a9a9fbd794f2b23b490867f3b046d465fa746d8';

final class PaginatedMonstersFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Monsters?>, GraphQLService> {
  PaginatedMonstersFamily._()
    : super(
        retry: null,
        name: r'paginatedMonstersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PaginatedMonstersProvider call(GraphQLService service) =>
      PaginatedMonstersProvider._(argument: service, from: this);

  @override
  String toString() => r'paginatedMonstersProvider';
}

@ProviderFor(allMonstersPagination)
final allMonstersPaginationProvider = AllMonstersPaginationFamily._();

final class AllMonstersPaginationProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Monster>>,
          List<Monster>,
          FutureOr<List<Monster>>
        >
    with $FutureModifier<List<Monster>>, $FutureProvider<List<Monster>> {
  AllMonstersPaginationProvider._({
    required AllMonstersPaginationFamily super.from,
    required GraphQLService super.argument,
  }) : super(
         retry: null,
         name: r'allMonstersPaginationProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$allMonstersPaginationHash();

  @override
  String toString() {
    return r'allMonstersPaginationProvider'
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
    return allMonstersPagination(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AllMonstersPaginationProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$allMonstersPaginationHash() =>
    r'b7e0038c179df66ae991111a40a8dfcf1535f9fa';

final class AllMonstersPaginationFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Monster>>, GraphQLService> {
  AllMonstersPaginationFamily._()
    : super(
        retry: null,
        name: r'allMonstersPaginationProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AllMonstersPaginationProvider call(GraphQLService service) =>
      AllMonstersPaginationProvider._(argument: service, from: this);

  @override
  String toString() => r'allMonstersPaginationProvider';
}

@ProviderFor(displayedMonsters)
final displayedMonstersProvider = DisplayedMonstersFamily._();

final class DisplayedMonstersProvider
    extends
        $FunctionalProvider<
          AsyncValue<DisplayedMonstersResult>,
          AsyncValue<DisplayedMonstersResult>,
          AsyncValue<DisplayedMonstersResult>
        >
    with $Provider<AsyncValue<DisplayedMonstersResult>> {
  DisplayedMonstersProvider._({
    required DisplayedMonstersFamily super.from,
    required GraphQLService super.argument,
  }) : super(
         retry: null,
         name: r'displayedMonstersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$displayedMonstersHash();

  @override
  String toString() {
    return r'displayedMonstersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<AsyncValue<DisplayedMonstersResult>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<DisplayedMonstersResult> create(Ref ref) {
    final argument = this.argument as GraphQLService;
    return displayedMonsters(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<DisplayedMonstersResult> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<DisplayedMonstersResult>>(
        value,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DisplayedMonstersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$displayedMonstersHash() => r'551cc0e4796fedd8f364375967c7bc16f51efc6e';

final class DisplayedMonstersFamily extends $Family
    with
        $FunctionalFamilyOverride<
          AsyncValue<DisplayedMonstersResult>,
          GraphQLService
        > {
  DisplayedMonstersFamily._()
    : super(
        retry: null,
        name: r'displayedMonstersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DisplayedMonstersProvider call(GraphQLService service) =>
      DisplayedMonstersProvider._(argument: service, from: this);

  @override
  String toString() => r'displayedMonstersProvider';
}
