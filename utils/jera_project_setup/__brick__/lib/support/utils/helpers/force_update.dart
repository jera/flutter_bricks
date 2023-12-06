import '../../../features/force_update/models/app_info.dart';
import '../../../features/force_update/models/minimum_version.dart';
import '../../../features/force_update/use_case/get_app_info_use_case.dart';
import '../../../features/force_update/use_case/get_minimum_version_use_case.dart';
import '../../../router/mobile_router.dart';

/// Classe que gerencia e avalia se o app deve ser atualizado ou não.
///
/// Inicia a partir da função `verifyVersion`, na qual pega essa informação do servidor,
/// e verifica se a versão corrente nos aplicativos é a versão minima suportada pelo servidor,
/// caso não seja redireciona o app para a tela de atualização do app.
///
/// ***Para utilizar corretamente esse modulo certifique-se todas as dependências necessárias estão no seu projeto.***
abstract class ForceUpdateProtocol {
  void verifySession();
}

class ForceUpdate extends ForceUpdateProtocol {
  // Private properties
  final GetAppInfoUseCaseProtocol getAppInfoUseCase;
  final GetMinimumVersionUseCaseProtocol getMinimumVersionUseCase;

  // Constructor
  ForceUpdate({
    required this.getAppInfoUseCase,
    required this.getMinimumVersionUseCase,
  });

  // Public functions
  @override
  void verifySession() {
    getAppInfoUseCase.execute(completion: (appInfo) {
      _getServerMinimumVersionBy(appInfo);
    });
  }

  // Private functions
  void _getServerMinimumVersionBy(AppInfo appInfo) {
    getMinimumVersionUseCase.execute(
      platform: appInfo.platform,
      success: (minimumVersion) {
        _checkAppVersionToForceUpdateIfNeeded(appInfo, minimumVersion);
      },
    );
  }

  void _checkAppVersionToForceUpdateIfNeeded(AppInfo appInfo, MinimumVersion minimumVersion) {
    if (appInfo.version.toIntVersion >= minimumVersion.versionNumber.toIntVersion) return;

    MobileRouter.redirectToForceUpdate(isRequiredVersion: minimumVersion.isRequiredVersion ?? false);
  }
}

extension IntExtensions on String {
  int get toIntVersion {
    return int.parse(replaceAll('.', ''));
  }
}
