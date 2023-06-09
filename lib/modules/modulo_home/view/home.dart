import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_uniclima_v2/modules/modulo_home/controller/home.controller.dart';
import 'package:projeto_uniclima_v2/modules/modulo_home/view/widget/tempo_widgets.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.cidadeSelecionada()),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            DropdownSearch<String>(
              popupProps: PopupProps.menu(
                showSelectedItems: true,
                disabledItemFn: (String s) => s.startsWith('I'),
              ),
              items: controller.cidades,
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Cidade",
                  hintText: 'Selecione a cidade',
                  filled: true,
                  fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                  contentPadding: const EdgeInsets.fromLTRB(12, 12, 8, 0),
                  border: const OutlineInputBorder(),
                ),
              ),
              onChanged: (value) {
                if (value != null) {
                  controller.atualizarCidadeSelecionada(value);
                }
              },
              selectedItem: controller.cidadeSelecionada(),
            ),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const CircularProgressIndicator(
                    strokeWidth: 3.0,
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  );
                } else if (controller.climaData.value != null) {
                  return TempoWidget(climaData: controller.climaData.value!);
                } else {
                  return Text(
                    'Sem dados para exibir',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () {
                  if (controller.isLoading.value) {
                    return Text(
                      'Carregando...',
                      style: Theme.of(context).textTheme.headlineSmall,
                    );
                  } else {
                    return IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () => controller.carregaTempo(),
                      color: Colors.blue,
                      iconSize: 50.0,
                      tooltip: 'Recarregar',
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
