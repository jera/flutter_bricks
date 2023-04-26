import '../../router/mobile_router.dart';
import 'domain/models/app_info.dart';
import 'domain/models/minimum_version.dart';
import 'domain/use_case/get_app_info_use_case.dart';
import 'domain/use_case/get_minimum_version_use_case.dart';

/// Classe que gerencia e avalia se o app deve ser atualizado ou não.
///
/// Inicia a partir da função `verifyVersion`, na qual pega essa informação do servidor,
/// e verifica se a versão corrente nos aplicativos é a versão minima suportada pelo servidor,
/// caso não seja redireciona o app para a tela de atualização do app.
///
/// ***Para utilizar corretamente esse modulo certifique-se todas as dependências necessárias estão no seu projeto.***
class ForceUpdate {
  static final ForceUpdate instance = ForceUpdate._();

  // Private properties
  final GetAppInfoUseCaseProtocol _getAppInfoUseCase;
  final GetMinimumVersionUseCaseProtocol _getMinimumVersionUseCase;

  // Constructor
  ForceUpdate._()
      : _getAppInfoUseCase = GetAppInfoUseCase(),
        _getMinimumVersionUseCase = GetMinimumVersionUseCase();

  // Public functions
  void verifySession() {
    _getAppInfoUseCase.execute(completion: (appInfo) {
      _getServerMinimumVersionBy(appInfo);
    });
  }

  // Private functions
  void _getServerMinimumVersionBy(AppInfo appInfo) {
    _getMinimumVersionUseCase.execute(
      platform: appInfo.platform,
      success: (minimumVersion) {
        _checkAppVersionToForceUpdateIfNeeded(appInfo, minimumVersion);
      },
    );
  }

  void _checkAppVersionToForceUpdateIfNeeded(AppInfo appInfo, MinimumVersion minimumVersion) {
    if (appInfo.version.toIntVersion >= minimumVersion.versionNumber.toIntVersion) return;

    /// Copiar e colocar método do README para colocar dentro do MobileRouter v1.0
    MobileRouter.goToForceUpdate(isRequiredVersion: minimumVersion.isRequiredVersion ?? false);
  }
}

extension IntExtensions on String {
  int get toIntVersion {
    return int.parse(replaceAll('.', ''));
  }
}
