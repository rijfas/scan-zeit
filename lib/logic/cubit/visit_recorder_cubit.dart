import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scan_zeit/data/models/default_user.dart';
import 'package:scan_zeit/data/repositories/visit_record_repository.dart';
import '../../data/models/visit_record.dart';
part 'visit_recorder_state.dart';

class VisitRecorderCubit extends Cubit<VisitRecorderState> {
  final VisitRecordRepository _visitRecordRepository = VisitRecordRepository();
  VisitRecorderCubit() : super(VisitRecorderLoading());

  void loadData({@required String uid}) async {
    emit(VisitRecorderLoading());
    List<VisitRecord> visitRecords =
        await _visitRecordRepository.loadVisitData(uid: uid);
    if (visitRecords is List<VisitRecord>) {
      emit(VisitRecorderLoaded(visitRecords: visitRecords));
    } else {
      emit(VisitRecorderError());
    }
  }

  void scanData({@required DefaultUser user, @required String scanid}) async {
    emit(VisitRecorderLoading());
    _visitRecordRepository
        .scanData(user: user, scanid: scanid, time: DateTime.now().toString())
        .then((_) {
      emit(VisitRecorderScanned());
    });
  }

  void removeData({@required String uid, @required Map<String, dynamic> data}) {
    emit(VisitRecorderLoading());
    _visitRecordRepository
        .removeData(uid: uid, data: data)
        .then((_) => emit(VisitRecorderRemoved()));
  }
}
