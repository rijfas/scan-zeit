part of 'visit_recorder_cubit.dart';

@immutable
abstract class VisitRecorderState {}

class VisitRecorderLoading extends VisitRecorderState {}

class VisitRecorderScanned extends VisitRecorderState {}

class VisitRecorderRemoved extends VisitRecorderState {}

class VisitRecorderLoaded extends VisitRecorderState {
  final List<VisitRecord> visitRecords;
  VisitRecorderLoaded({@required this.visitRecords});
}

class VisitRecorderError extends VisitRecorderState {}
