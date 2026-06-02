const fs = require('fs');
const path = require('path');

const lib = path.join(__dirname, '../lib');

function p(...segments) {
  return path.join(lib, ...segments);
}

const folders = [
  // ========== CORE (Tools & Infrastructure) ==========
  p('core/di'),           // Dependency Injection (GetIt)
  p('core/network'),      // Supabase Client, Connectivity
  p('core/database'),     // Hive Init, TypeAdapters
  p('core/error'),        // Failures & Exceptions
  p('core/usecase'),      // Base UseCase class
  p('core/utils'),        // Formatters, Validators
  p('core/theme'),        // Global App Theme
  p('core/constants'),    // App Strings, Asset Paths

  // ========== SHARED (Shared Business Logic) ==========
  // This prevents Circular Dependencies between features
  p('shared/domain/entities'),     // User, Category, Tag, Project
  p('shared/domain/repositories'),
  p('shared/data/models'),         // Hive/Supabase Models for shared entities
  p('shared/data/repositories'),
  p('shared/presentation/widgets'), // Global buttons, text fields

  // ========== FEATURE: AUTH ==========
  p('features/auth/domain/entities'),
  p('features/auth/domain/usecases'),
  p('features/auth/domain/repositories'),
  p('features/auth/data/models'),
  p('features/auth/data/datasources'),
  p('features/auth/data/repositories'),
  p('features/auth/presentation/bloc'),
  p('features/auth/presentation/pages'),

  // ========== FEATURE: TASK CENTER ==========
  p('features/task_center/domain/entities'), // Specific to tasks (e.g. SubTask)
  p('features/task_center/domain/usecases'),
  p('features/task_center/domain/repositories'),
  p('features/task_center/data/models'),
  p('features/task_center/data/datasources/local'),
  p('features/task_center/data/datasources/remote'),
  p('features/task_center/data/repositories'),
  p('features/task_center/presentation/bloc'),
  p('features/task_center/presentation/pages'),
  p('features/task_center/presentation/widgets'),

  // ========== FEATURE: PRODUCTIVITY (Bounded Context) ==========
  // Combines Pomodoro, Time Bank, and Incentives
  p('features/productivity/domain/entities'),
  p('features/productivity/domain/usecases'),
  p('features/productivity/domain/repositories'),
  p('features/productivity/data/models'),
  p('features/productivity/data/datasources'),
  p('features/productivity/data/repositories'),
  p('features/productivity/presentation/bloc'),
  p('features/productivity/presentation/pages'),

  // ========== FEATURE: SYNC LOG (The Roadmap Requirement) ==========
  // A specialized feature to manage Issue 6 (Log service for sync data)
  p('features/sync/domain'),
  p('features/sync/data'),
  p('features/sync/presentation/widgets'),
];

// Create folders and .gitkeep files
folders.forEach(folder => {
  try {
    fs.mkdirSync(folder, { recursive: true });
    console.log(`✅ Created: ${path.relative(path.join(__dirname, '..'), folder)}`);

    const gitkeepPath = path.join(folder, '.gitkeep');
    if (!fs.existsSync(gitkeepPath)) {
      fs.writeFileSync(gitkeepPath, '', 'utf8');
    }
  } catch (err) {
    console.error(`❌ Failed to create ${folder}:`, err.message);
  }
});

console.log('\n🎉 Clean Architecture Skeleton Created!');