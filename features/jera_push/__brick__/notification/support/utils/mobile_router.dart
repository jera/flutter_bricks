class MobileRouter {
  static void redirectToInternalPage({required String id}) {
    final context = MobileRouter.rootNavigatorKey.currentContext;

    if (context == null) return;

    // TODO: Redirecionar para a tela especifica
    if (id != null) {
      context.goNamed();
    }
  }
}
