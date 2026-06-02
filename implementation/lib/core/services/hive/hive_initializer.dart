import 'dart:developer';
import 'dart:io';

import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:zamaan/core/platform/directory_wrapper.dart';
import 'package:zamaan/core/platform/path_provider_wrapper.dart';
import 'package:zamaan/core/platform/platform_wrapper.dart';
import 'package:zamaan/core/services/hive/hive_wrapper.dart';

abstract class HiveInitializer {
  HiveInitializer({
    required this.hive,
    required this.platform,
    required this.pathProvider,
    required this.directory,
  });

  final HiveWrapper hive;
  final PlatformWrapper platform;
  final PathProviderWrapper pathProvider;
  final DirectoryWrapper directory;

  Future<void> init();
}

class HiveInitializerImpl extends HiveInitializer {
  HiveInitializerImpl({
    required super.hive,
    required super.platform,
    required super.pathProvider,
    required super.directory,
  });

  /// Initializes Hive by setting the document directory and registering
  /// all required adapters.
  @override
  Future<void> init() async {
    if (platform.isWindows) {
      directory.directory = Directory(r'E:\Flutter.Dart\HiveFiles\Zamaan');
    } else {
      try {
        directory.directory = await pathProvider.getAppDocDirectory();
      } on Exception catch (e) {
        log(e.toString(), name: 'HiveInitializerImpl.init');
      }
    }
    if (!directory.existsSync()) {
      await directory.create(recursive: true);
    }
    await hive.initFlutter(directory.path);

    final modelAdapters = <TypeAdapter>[
      TaskHiveModelAdapter(),
      RemoteSessionHiveModelAdapter(),
      UserHiveModelAdapter(),
      CategoryHiveModelAdapter(),
      GoalHiveModelAdapter(),
      CustomMeasurementUnitHiveModelAdapter(),
      ScheduleConstraintsHiveModelAdapter(),
      ScheduledDayTimeHiveModelAdapter(),
      ScheduledIntervalHiveModelAdapter(),
      ScheduledOccurrenceHiveModelAdapter(),
      DateRangeHiveModelAdapter(),
      TimeRangeHiveModelAdapter(),
      SubTaskHiveModelAdapter(),
      TagHiveModelAdapter(),
      TaskActivityHiveModelAdapter(),
      LogHiveModelAdapter(),
      // SyncLogHiveModelAdapter(),
      DeviceHiveModelAdapter(),
    ];

    final enumAdapters = <TypeAdapter>[
      DayTypeAdapter(),
      GoalConstraintAdapter(),
      IntervalUnitAdapter(),
      MeasurementCategoryAdapter(),
      MeasurementUnitAdapter(),
      OSAdapter(),
      PriorityAdapter(),
      ReferenceTypeAdapter(),
      RepetitionTypeAdapter(),
      ScheduleTypeAdapter(),
      SyncActionAdapter(),
      TaskStatusAdapter(),
      OccurrenceStatusAdapter(),
      WeekDayAdapter(),
      ScheduledTimeModeAdapter(),
    ];

    final dartClassAdapters = <TypeAdapter>[DurationAdapter()];

    final adapters = enumAdapters + dartClassAdapters + modelAdapters;
    for (final adapter in adapters) {
      Hive.registerAdapter(adapter);
    }
  }
}
