import 'package:zamaan/shared/domain/entities/base_entity.dart';
import 'package:zamaan/shared/domain/enums/enums.dart';

class UserEntity extends BaseEntity {
  //========================
  // Fields
  //========================

  final String displayName;

  final String? avatarPath;

  final RegistrationStatus registrationStatus;

  final String? remoteUserId; // renamed from remoteId for clarity

  // Optional: store email only if needed for UI (but don't rely on it as source of truth)
  final String? email;

  //========================
  // Constructor
  //========================

  UserEntity({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.displayName,
    required this.registrationStatus,
    required this.email,
    this.avatarPath,
    this.remoteUserId,
    super.description,
    super.order,
  });

  UserEntity.createLocal({
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
    String? remoteUserId,
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
      remoteUserId: remoteUserId ?? this.remoteUserId,
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
