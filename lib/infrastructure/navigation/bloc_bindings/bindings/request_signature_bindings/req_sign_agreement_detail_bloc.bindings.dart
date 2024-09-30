import '../../../../../domain/consts/global_var.dart';
import '../../../../../domain/core/interfaces/bindings.dart';
import '../../../../../presentation/pop_up/request_signature/request_sign_agreement_detail/bloc/req_sign_agreement_detail_bloc.dart';
import '../../../../dal/services/data_models_repository/req_sign_doc_data_repository.dart';

class ReqSignAgreementDetailBlocBindings implements Bindings {
  @override
  void dependencies() {
    getIt.registerFactory<ReqSignAgreementDetailBloc>(
        () => ReqSignAgreementDetailBloc(getIt<ReqSignDocumentRepository>()));
  }
}
