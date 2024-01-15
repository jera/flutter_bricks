class NotificationData {
  // TODO: Adicionar dados que virão da mensagem
  final String id;

  NotificationData.fromMap(Map map)
      // TODO: Adicionar parametros que vão vir da mensagem
      : id = map['id'];

  NotificationData toMap() {
    return '{"id": "$id"}';
  }
}
