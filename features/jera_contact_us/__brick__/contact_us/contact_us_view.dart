import 'package:flutter/material.dart';

import 'enum/contact_us_options.dart';

abstract class ContactUsViewModelProtocol with ChangeNotifier {
  bool get isLoading;
  ContactUsOptions? get dropdownButtonValue;
  List<ContactUsOptions> get dropdownButtonItems;

  void didTapBackButton();
  void updateExplanationMessage(String newExplanationMessage);
  void didTapSelectContactUsOption(ContactUsOptions? contactUsOption);

  VoidCallback? sendMessage();
}

class ContactUsView extends StatelessWidget {
  final ContactUsViewModelProtocol viewModel;

  const ContactUsView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Fale Conosco',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: viewModel.didTapBackButton,
          icon: const Icon(
            size: 24,
            color: Colors.black,
            Icons.arrow_back_ios_rounded,
          ),
        ),
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (_, __) {
          if (viewModel.isLoading) return const Center(child: CircularProgressIndicator());

          return CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        'Entre em contato conosco, estamos aqui para ouvir você! Entre em contato conosco e compartilhe suas dúvidas, sugestões ou comentários. Sua opinião é muito importante para nós.',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const SizedBox(height: 32),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: DropdownButton(
                          isExpanded: true,
                          hint: const Text('Assunto'),
                          items: _dropdownButtonItems,
                          underline: const SizedBox.shrink(),
                          value: viewModel.dropdownButtonValue,
                          onChanged: viewModel.didTapSelectContactUsOption,
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextField(
                        maxLines: 5,
                        cursorColor: Colors.black,
                        onChanged: viewModel.updateExplanationMessage,
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                        decoration: const InputDecoration(hintText: 'Digite aqui sua mensagem'),
                      ),
                      const Spacer(flex: 5),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: viewModel.sendMessage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text(
                          'Enviar mensagem',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  List<DropdownMenuItem<ContactUsOptions>> get _dropdownButtonItems {
    return viewModel.dropdownButtonItems.map((item) {
      return DropdownMenuItem<ContactUsOptions>(
        value: item,
        child: Text(
          item.description,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      );
    }).toList();
  }
}
