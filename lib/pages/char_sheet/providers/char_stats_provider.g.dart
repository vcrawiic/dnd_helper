// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'char_stats_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CharStatsNotifier)
final charStatsProvider = CharStatsNotifierFamily._();

final class CharStatsNotifierProvider
    extends $AsyncNotifierProvider<CharStatsNotifier, CharStats> {
  CharStatsNotifierProvider._({
    required CharStatsNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'charStatsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$charStatsNotifierHash();

  @override
  String toString() {
    return r'charStatsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CharStatsNotifier create() => CharStatsNotifier();

  @override
  bool operator ==(Object other) {
    return other is CharStatsNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$charStatsNotifierHash() => r'9ff9836da317dc7edeb3aca552874fb283db2f70';

final class CharStatsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          CharStatsNotifier,
          AsyncValue<CharStats>,
          CharStats,
          FutureOr<CharStats>,
          String
        > {
  CharStatsNotifierFamily._()
    : super(
        retry: null,
        name: r'charStatsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CharStatsNotifierProvider call(String characterId) =>
      CharStatsNotifierProvider._(argument: characterId, from: this);

  @override
  String toString() => r'charStatsProvider';
}

abstract class _$CharStatsNotifier extends $AsyncNotifier<CharStats> {
  late final _$args = ref.$arg as String;
  String get characterId => _$args;

  FutureOr<CharStats> build(String characterId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<CharStats>, CharStats>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CharStats>, CharStats>,
              AsyncValue<CharStats>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
