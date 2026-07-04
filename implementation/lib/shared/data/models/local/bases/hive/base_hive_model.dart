import 'package:equatable/equatable.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:zamaan/shared/data/models/local/bases/base_local_model.dart';

abstract class BaseHiveModel extends BaseLocalModel with EquatableMixin {
  BaseHiveModel({
    required this.id,
    required this.createdAt,
    this.description,
    this.updatedAt,
    this.order,
  });

  @override
  @HiveField(0)
  final String id;

  @override
  @HiveField(2)
  final DateTime createdAt;

  @override
  @HiveField(3)
  final String? description;

  @override
  @HiveField(4)
  final DateTime? updatedAt;

  @override
  @HiveField(5)
  final int? order;

  @override
  List<Object?> get props => [id, createdAt, description, updatedAt, order];
}
