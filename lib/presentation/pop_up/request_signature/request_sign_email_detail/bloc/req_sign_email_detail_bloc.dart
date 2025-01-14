import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../infrastructure/dal/services/data_models_repository/req_sign_doc_data_repository.dart';

part 'req_sign_email_detail_event.dart';
part 'req_sign_email_detail_state.dart';

class ReqSignEmailDetailBloc extends Bloc<ReqSignEmailDetailEvent, ReqSignEmailDetailState> {
  final ReqSignDocumentRepository dataRepository;

  ReqSignEmailDetailBloc(this.dataRepository) : super(ReqSignEmailDetailInitial()) {
    on<ReqSignEmailDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
