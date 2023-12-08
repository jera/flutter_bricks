import 'package:flutter/material.dart';
import '../../support/utils/service_locator/service_locator.dart';

import 'contact_us_view.dart';

abstract class ContactUsProtocol extends ContactUsViewModelProtocol {
  VoidCallback? onTapBackButton;
  VoidCallback? onSuccessSendMessage;
  VoidCallback? onFailureSendMessage;
}

class ContactUsViewController extends StatefulWidget {
  const ContactUsViewController({super.key});

  @override
  State<ContactUsViewController> createState() => _ContactUsViewControllerState();
}

class _ContactUsViewControllerState extends State<ContactUsViewController> {
  late final ContactUsProtocol viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ServiceLocator.get<ContactUsProtocol>();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return ContactUsView(viewModel: viewModel);
  }

  void _bind() {
    viewModel.onSuccessSendMessage = () {
      // TODO Implementar quando retornar sucesso do envio da mensagem
    };

    viewModel.onFailureSendMessage = () {
      // TODO Implementar quando retornar falha do envio da mensagem
    };

    viewModel.onTapBackButton = () {
      // TODO Implementar ação do botão de voltar
    };
  }
}
