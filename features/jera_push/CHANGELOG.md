# 0.1.0+1

- Versão de lançamento.

# 0.2.0+2

#### Notification Data

Foi adicionado o modelo NotificationData para armazenar todas as informações voltadas aos dados de uma notificação e facilitar o seu mapeamento.

#### Mobile Router

Foi adicionado o Mobile Router para lidar com o redirecionamento da aplicação a partir de uma notificação, caso seja necessária de outra maneira na sua aplicação, remova o Mobile Router e forneça ao `_clickHandler` uma nova forma de redirecionamento através de outra função.
