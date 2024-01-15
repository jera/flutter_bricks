class NotificationData {
  // TODO: Adicionar dados que virão da mensagem
  final String teste;

  NotificationData.fromMap(Map map)
      // TODO: Adicionar parametros que vão vir da mensagem
      : teste = map['teste'];

  NotificationData toMap() {
    return '{"teste": "$teste"}';
  }
}
