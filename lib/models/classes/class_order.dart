enum ClassOrderDirection { ASC, DESC }

enum ClassOrderBy { NAME, HIT_DIE }

class ClassOrder {
  ClassOrder({required this.orderDirection, required this.orderBy});

  final ClassOrderDirection orderDirection;
  final ClassOrderBy orderBy;
}
