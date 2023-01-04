import '../../constants/app/app_constants.dart';
import '../../init/routes/routes.dart';

abstract class BaseSingleton {
  AppConstants get constants => AppConstants.instance;
  Routes get routes => Routes.instance;
}
