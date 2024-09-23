import '../../../../../domain/consts/global_var.dart';
import '../../../../../domain/core/interfaces/bindings.dart';
import '../../../../../presentation/pop_up/request_signature/request_sign_selected_document/bloc/req_sign_selected_doc_bloc.dart';

class ReqSignSelectedDocBlocBindings implements Bindings {
  @override
  void dependencies() async {
    getIt.registerSingleton<ReqSignSelectedDocBloc>(ReqSignSelectedDocBloc());
  }
}