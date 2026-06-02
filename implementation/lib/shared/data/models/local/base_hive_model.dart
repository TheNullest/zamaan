import 'package:equatable/equatable.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

abstract class BaseHiveModel with EquatableMixin {
  BaseHiveModel({
    required this.id,
    required this.createdAt,
    this.description,
    this.updatedAt,
    this.order,
    this.isSynced = false, // Defaults to false until Supabase acknowledges it
    this.isDeleted = false, // Used for offline soft-deletes
  });

  @HiveField(0)
  final String id;

  @HiveField(2)
  final DateTime createdAt;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  final DateTime? updatedAt;

  @HiveField(5)
  final int? order;

  @HiveField(6)
  final bool isSynced;

  @HiveField(7)
  final bool isDeleted;

  @override
  List<Object?> get props => [id, createdAt, description, updatedAt, order, isSynced, isDeleted];
}
