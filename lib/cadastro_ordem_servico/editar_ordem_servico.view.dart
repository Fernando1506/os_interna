// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:os_interna/components/input_text.dart';

// import '../components/buttons.dart';

// import '../relatorio/relatorio.view.dart';
// import 'cadastro_ordem_servico.controller.dart';

// class EditarOrdemServicoView extends StatelessWidget {
//   EditarOrdemServicoView({
//     Key? key,
//     required this.idDados,
//   }) : super(key: key) {
//     controller = CadastrarDadosController(idDados: idDados);
//   }

//   String idDados;

//   late CadastrarDadosController controller;
//   late final GlobalKey<FormState> formKey;

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Row(
//         children: [
//           Text("Movimento - Ordem de Serviço"),
//         ],
//       ),
//       content: FutureBuilder(
//           future: controller.carregarCadastro(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return Container(
//                 width: 400,
//                 height: 100,
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(right: 10),
//                             child: InputText(
//                               enabled: false,
//                               label: 'Nº O.S',
//                               width: 100,
//                               controller: TextEditingController(),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(right: 10),
//                             child: InputText(
//                               enabled: true,
//                               label: 'Data',
//                               width: 120,
//                               controller: TextEditingController(),
//                             ),
//                           ),
//                           Expanded(
//                             child: InputText(
//                               enabled: true,
//                               label: 'Cliente',
//                               width: 200,
//                               controller: controller.nomeController,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 25),
//                         child: Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(right: 10),
//                               child: InputText(
//                                   enabled: true,
//                                   label: 'Série',
//                                   width: 100,
//                                   controller: controller.serieController),
//                             ),
//                             Expanded(
//                               child: InputText(
//                                   enabled: true,
//                                   label: 'Status',
//                                   width: 200,
//                                   controller: controller.statusController),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             } else {
//               return Container(
//                 width: 400,
//                 height: 100,
//               );
//             }
//           }),
//       actions: <Widget>[
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             buildAddButton(),
//             Padding(
//               padding: const EdgeInsets.only(right: 10),
//               child: buildGravarButton(),
//             ),
//             Button(
//               text: "Cancelar",
//               onTap: () {
//                 Get.offAll(RelatorioView());
//               },
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget buildAddButton() {
//     if (controller.idDados.isEmpty) {
//       return Button(
//         text: "Adicionar",
//         onTap: () {
//           controller.gravarDados(newData: true);
//         },
//       );
//     } else {
//       return Container();
//     }
//   }

//   Widget buildGravarButton() {
//     if (controller.idDados.isNotEmpty) {
//       return Button(
//         text: "Gravar",
//         onTap: () {
//           controller.gravarDados(newData: false);
//         },
//       );
//     } else {
//       return Container();
//     }
//   }
// }
