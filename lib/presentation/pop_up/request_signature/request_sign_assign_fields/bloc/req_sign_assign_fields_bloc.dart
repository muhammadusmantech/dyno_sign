import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../infrastructure/dal/services/data_models_repository/req_sign_doc_data_repository.dart';

part 'req_sign_assign_fields_event.dart';
part 'req_sign_assign_fields_state.dart';

class ReqSignAssignFieldsBloc extends Bloc<ReqSignAssignFieldsEvent, ReqSignAssignFieldsState> {
  final ReqSignDocumentRepository dataRepository;

  ReqSignAssignFieldsBloc(this.dataRepository) : super(ReqSignAssignFieldsInitial()) {
    on<DocumentPreviewRequested>(_onDocumentPreviewRequested);
    on<DocumentSelected>(_onDocumentSelected);
  }

  Future<void> _onDocumentPreviewRequested(
      DocumentPreviewRequested event, Emitter<ReqSignAssignFieldsState> emit) async {
    emit(DocumentPreviewLoading());
    try {
      // for (var file in selectedPdfFileList) {
      //   final firstPage = await PdfSinglePage.get(file.xFile!);
      //   final imageBytes = firstPage?.bytes;
      //
      //   if (imageBytes != null) {
      //     emit(DocumentPreviewLoaded(imageBytes));
      //   }
      // }
    } catch (e) {
      emit(DocumentPreviewError(e.toString()));
    }
  }

  void _onDocumentSelected(DocumentSelected event, Emitter<ReqSignAssignFieldsState> emit) {
    emit(AssignFieldSelectedDoc(event.index));
  }
}
