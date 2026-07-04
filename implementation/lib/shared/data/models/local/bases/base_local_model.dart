/// Persistence‑agnostic base model for local storage.
///
/// This interface defines the minimal fields that any local storage record
/// must provide, regardless of the underlying database (Hive, Isar, SQLite).
/// It allows the data source layer to depend on an abstraction, not a concrete Hive class.
abstract class BaseLocalModel {
  String get id;
  DateTime get createdAt;
  DateTime? get updatedAt;
  String? get description;
  int? get order;
}
