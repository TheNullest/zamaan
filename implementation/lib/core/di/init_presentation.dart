part of 'init_dependencies.imports.dart';

void initPresentation() {
  // Presentation-level viewmodels and controllers
  sl.registerFactory<AuthBootstrapViewModel>(() => AuthBootstrapViewModel());
  sl.registerFactory<TaskListViewModel>(() => TaskListViewModel());
}
