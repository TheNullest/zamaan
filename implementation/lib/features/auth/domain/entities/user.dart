import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:zamaan/shared/domain/entities/base_entity.dart';

enum RegistrationStatus {
  unregistered, // no remote account yet
  anonymous, // temporary Supabase account
  registered, // full email/password account
}

@HiveType(typeId: 1)
class UserEntity extends BaseEntity {
  //========================
  // Fields
  //========================

  @HiveField(11)
  final String displayName;

  @HiveField(12)
  final String? avatarPath;

  @HiveField(13)
  final RegistrationStatus registrationStatus;

  @HiveField(14)
  final String? remoteUserId; // renamed from remoteId for clarity

  // Optional: store email only if needed for UI (but don't rely on it as source of truth)
  @HiveField(15)
  final String? email;

  //========================
  // Constructor
  //========================

  UserEntity({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.displayName,
    this.avatarPath,
    this.registrationStatus = RegistrationStatus.unregistered,
    this.remoteUserId,
    this.email,
    super.description,
    super.order,
  });

  UserEntity.createLocall({
    required this.displayName,
    super.description,
    super.order,
    this.avatarPath,
    this.email,
  }) : remoteUserId = null,
       registrationStatus = RegistrationStatus.unregistered,
       super.create();

  //========================
  // Derived properties
  //========================

  /// Stable identifier for owned entities (tasks, goals, etc.)
  /// Never changes. Use this as foreign key.
  String get userId => id;

  bool get hasRemoteAccount => remoteUserId != null;
  bool get isRegistered => registrationStatus == RegistrationStatus.registered;

  //========================
  // CopyWith
  //========================

  UserEntity copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? displayName,
    String? avatarPath,
    RegistrationStatus? registrationStatus,
    String? supabaseUserId,
    String? email,
    String? description,
    int? order,
  }) {
    return UserEntity(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      displayName: displayName ?? this.displayName,
      avatarPath: avatarPath ?? this.avatarPath,
      registrationStatus: registrationStatus ?? this.registrationStatus,
      remoteUserId: supabaseUserId ?? remoteUserId,
      email: email ?? this.email,
      description: description ?? this.description,
      order: order ?? this.order,
    );
  }

  @override
  List<Object?> get props => [
    ...super.props,
    displayName,
    avatarPath,
    registrationStatus,
    remoteUserId,
    email,
  ];
}
