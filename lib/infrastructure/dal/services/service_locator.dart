import 'package:dyno_sign/domain/consts/global_var.dart';
import 'package:dyno_sign/domain/core/interfaces/bindings.dart';
import 'package:dyno_sign/infrastructure/dal/services/api_services/api_helper.dart';
import 'package:image_picker/image_picker.dart';

import 'data_models_repository/req_sign_doc_data_repository.dart';

class ServiceLocator extends Bindings {
  @override
  void dependencies() {
    getIt.registerFactory(() => ApiHelper());

    /// imagePicker
    getIt.registerLazySingleton(() => ImagePicker());

    /// Request Sign Doc Model Injection
    getIt.registerLazySingleton<ReqSignDocumentRepository>(() => ReqSignDocumentRepository());
  }
}
