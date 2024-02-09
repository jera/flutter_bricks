class RecoverPasswordModule extends AppModule {
  @override
  void registerDependencies() {
    /// UseCases
    ServiceLocator.registerFactory<RecoverPasswordUseCaseProtocol>(() {
      return RecoverPasswordUseCase(routes: ServiceLocator.get<UserRoutesProtocol>());
    });

    /// ViewModel
    ServiceLocator.registerFactory<RecoverPasswordProtocol>(() {
      return RecoverPasswordViewModel(
        recoverPasswordUseCase: ServiceLocator.get<RecoverPasswordUseCaseProtocol>(),
      );
    });
  }
}
