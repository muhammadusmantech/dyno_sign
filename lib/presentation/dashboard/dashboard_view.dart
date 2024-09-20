import 'package:dyno_sign/domain/consts/global_var.dart';
import 'package:dyno_sign/domain/consts/styles.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/routes.dart';
import 'package:dyno_sign/presentation/dashboard/views/agreements/bloc/agreements_bloc.dart';
import 'package:dyno_sign/presentation/dashboard/views/home/bloc/home_bloc.dart';
import 'package:dyno_sign/presentation/dashboard/views/profile/bloc/profile_bloc.dart';
import 'package:dyno_sign/presentation/dashboard/views/templates/bloc/templates_bloc.dart';
import 'package:dyno_sign/presentation/signing_process/bloc/signing_process_cubit.dart';
import 'package:dyno_sign/presentation/signing_process/request_signature/document_preview_view.01.dart';
import 'package:dyno_sign/presentation/dashboard/widgets/bottom_nav_bar.dart';
import 'package:dyno_sign/presentation/widgets/bottom_sheets/bottom_sheets.dart';
import 'package:dyno_sign/presentation/widgets/bottom_sheets/custom_bottom_sheet/sheets_widget/add_documents/add_document.sheet.dart';
import 'package:dyno_sign/presentation/widgets/bottom_sheets/custom_bottom_sheet/sheets_widget/sign_selection/sign_selection.sheet.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../assets_gen/assets.gen.dart';
import '../../domain/consts/app_consts/sign_process_types.dart';
import '../../domain/utils/utils.dart';
import 'widgets/drawer_items_tile.dart';
import '../widgets/dialogs/pdf_preview.dialog.dart';
import 'bloc/dashboard_bloc.dart';

final PageController pageController = PageController();

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    final width = appWidth(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<HomeBloc>()),
          BlocProvider(create: (context) => getIt<TemplatesBloc>()),
          BlocProvider(create: (context) => getIt<AgreementsBloc>()),
          BlocProvider(create: (context) => getIt<ProfileBloc>()),
        ],
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          key: scaffoldKey,
          drawer: _buildDrawer(width, color, context),

          /// [Body]
          body: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: pages,
          ),

          /// [BottomNavigationBar]
          bottomNavigationBar: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              int currentIndex = 0;
              if (state is PageChangedState) {
                currentIndex = state.currentIndex;
              }
              return CustomBottomNavBar(
                currentPage: currentIndex,
                onChange: (index) {
                  pageController.jumpToPage(index);
                  context.read<DashboardBloc>().add(PageChangEvent(index));
                },
              );
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,

          /// [FloatingActionButton]
          floatingActionButton: FloatingActionButton(
            elevation: 10,
            onPressed: () => _bottomSheet(context),
            backgroundColor: Theme.of(context).primaryColor,
            child:
                Icon(Icons.add, color: Theme.of(context).colorScheme.surface),
          ),
        ));
  }

  Widget _buildDrawer(double width, ColorScheme color, BuildContext context) {
    return Drawer(
      width: width * 0.75,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DrawerHeader(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Assets.images.splashImg.image(
                  width: 150,
                  fit: BoxFit.contain,
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppStyle.buttonBorderRadius),
                    ),
                    backgroundColor: color.outlineVariant.withOpacity(0.5),
                  ),
                  onPressed: () {
                    scaffoldKey.currentState?.closeDrawer();
                  },
                  icon: Assets.icons.moreIcon.svg(
                      colorFilter:
                          ColorFilter.mode(color.primary, BlendMode.srcIn)),
                ),
              ],
            ),
          ),
          Column(
            children: DrawerTabs.values.map((tab) {
              return BlocBuilder<DashboardBloc, DashboardState>(
                buildWhen: (p, current) => current is PageChangedState,
                builder: (context, state) {
                  int selectedTab = 0;

                  if (state is PageChangedState) {
                    selectedTab = state.currentIndex;
                  }

                  return DrawerItemsTile(
                    isSelected: selectedTab == tab.index,
                    title: tab.label,
                    icon: tab.iconPath,
                    onTap: () {
                      scaffoldKey.currentState?.closeDrawer();
                      selectedTab = tab.index;
                      if (tab.index < 4) {
                        pageController.jumpToPage(selectedTab);
                        context
                            .read<DashboardBloc>()
                            .add(PageChangEvent(selectedTab));
                      } else {
                        _navigateToNewPage(tab.index);
                      }
                    },
                  );
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  // Widget _buildBottomNavigationBar(DashboardBloc bloc, int currentPage) {
  //   return
  // }

  void _navigateToNewPage(int index) {
    if (index == 4) Go.toNamed(Routes.FOLDERS);
    if (index == 5) Go.toNamed(Routes.SETTINGS);
  }

  /// show first Bottom Sheet on [FloatingActionButton] click
  void _bottomSheet(BuildContext context) {
    CustomModelSheet.showBottomSheet(
      context: context,
      title: "Add",
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomBottomSheetTile(
            isSelected: false,
            title: "Request Signature",
            subtitle: 'Request anyone to add signatures in your document',
            onTap: () {
              Go.back();
              _showAddDocumentSheet(
                  context, SignProcessTypes.requestSignatures);
            },
          ),
          CustomBottomSheetTile(
            isSelected: false,
            title: "Sign Documents",
            subtitle:
                'Documents that you want to sign for yourself or sent by others',
            onTap: () {
              Go.back();
              _showSignSelectionSheet(context);
            },
          ),
          CustomBottomSheetTile(
            isSelected: false,
            title: "Add Templates",
            subtitle: 'Make templates and use them again and again.',
            onTap: () {
              Go.toNamed(Routes.AGREEMENT_DETAIL_ADDED);
            },
          ),
        ],
      ),
    );
  }

  ///  Method to show the Document Source [Selection] Sheet
  void _showAddDocumentSheet(
      BuildContext context, SignProcessTypes signProcessTypes) {
    final signingCubit = getIt<SigningProcessCubit>();
    CustomModelSheet.showScrolledBottomSheet(
      context: context,
      title: "Add a Document",
      content: AddDocumentSheet(
        onTap: (source) async {
          Go.back();

          switch (source) {
            case DocumentSource.files:
              FilePicker.pick().then(
                (file) async {
                  _preview(signingCubit,
                      file: file.first, signProcessTypes: signProcessTypes);
                },
              );

              break;
            case DocumentSource.gallery:
              GalleryImageToPdf.convert().then(
                (file) async {
                  _preview(signingCubit,
                      file: file!, signProcessTypes: signProcessTypes);
                },
              );
              break;
            case DocumentSource.camera:
              CameraImageToPdf.convert().then(
                (file) {
                  _preview(signingCubit,
                      file: file!, signProcessTypes: signProcessTypes);
                },
              );
            default:
              break;
          }
        },
      ),
    );
  }

  /// Method to show the SignSheet for [me] or from [other]
  void _showSignSelectionSheet(BuildContext context) {
    CustomModelSheet.showBottomSheet(
      context: context,
      title: "Sign",
      content: SignSelectedSheet(
        onForMe: () {
          // close previous sheet
          Go.back();
          _showAddDocumentSheet(context, SignProcessTypes.onlyForMe);
        },
        onByOthers: () {
          // close previous sheet
          Go.back();
          Go.toNamed(Routes.AGREEMENTS_FROM_OTHER, arguments: {
            'signProcessTypes': SignProcessTypes.sendByOthers,
          });
        },
      ),
    );
  }

  /// [Preview] and check the for [keep] for [discard]

  void _preview(SigningProcessCubit signingCubit,
      {required XFile file, required SignProcessTypes signProcessTypes}) {
    PdfPreviewDialog.show(
      file,
      check: (result) async {
        if (result == PreviewCheck.keep) {
          final model = await FileToModel.convert(file);
          signingCubit.selectedPdfFileList.add(model);

          Go.toNamed(
            Routes.SELECTED_DOCUMENT,
            arguments: {
              'signingCubit': signingCubit,
              'signProcessTypes': signProcessTypes,
            },
          );
        }
      },
    );
  }
}
