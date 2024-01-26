import 'package:bitcoin_demo_app/services/api_service.dart';
import 'package:bitcoin_demo_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:bitcoin_demo_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:bitcoin_demo_app/ui/views/home/home_view.dart';
import 'package:bitcoin_demo_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:bitcoin_demo_app/ui/views/buy/buy_view.dart';
import 'package:bitcoin_demo_app/ui/views/preview/preview_view.dart';
import 'package:bitcoin_demo_app/ui/views/confirmation/confirmation_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: BuyView),
    MaterialRoute(page: PreviewView),
    MaterialRoute(page: ConfirmationView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
