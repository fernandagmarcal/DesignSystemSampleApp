import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'App/core/coordinator/app_coordinator.dart';
import 'DesignSystem/shared/shared_theme.dart';

void main() {
  // Inicia a aplicação a partir do widget App, que contém o MaterialApp e o Coordinator.
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // O AppCoordinator é criado aqui para ser o gerenciador de navegação
    final coordinator = AppCoordinator();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HP Design System App',

      // 1. Aplica o Tema Global do seu Design System
      theme: AppTheme.light(),

      // 2. Define a chave de navegação global do Coordinator
      navigatorKey: AppCoordinator.navigatorKey,

      // 3. Define o gerador de rotas do Coordinator
      onGenerateRoute: AppCoordinator.generateRoute,

      // 4. Define a rota inicial
      initialRoute: AppCoordinator.loginRoute,

      // 5. Configuração para garantir que o Coordinator inicie corretamente o fluxo
      onGenerateInitialRoutes: (initialRoute) {
        // Usa o gerador de rotas do Coordinator para construir o primeiro widget
        return [
          AppCoordinator.generateRoute(RouteSettings(name: initialRoute))!,
        ];
      },
    );
  }
}

// ⚠️ PONTO DE ENTRADA DO PROJETO:
// O arquivo 'main.dart' do seu projeto deve ser alterado para chamar este widget:
/*
import 'package:flutter/material.dart';
import 'App/main_app.dart'; // Importa seu novo ponto de entrada

void main() {
  // O app agora inicia a partir da raiz da arquitetura MVVMC
  runApp(const App());
}
*/

// import 'package:flutter/material.dart';
// import 'DesignSystem/Samples/actionButtonSampleScreen/action_button_sample_screen.dart';
// import 'DesignSystem/Samples/tabComponentSampleScreen/tab_sample_screen.dart';
// import 'DesignSystem/Samples/accordionSampleScreen/accordion_sample_screen.dart';
// import 'DesignSystem/Samples/assetsSampleScreen/assets_sample_screen.dart';
// import 'DesignSystem/Samples/colorsSampleScreen/colors_sample_screen.dart';
// import 'DesignSystem/shared/shared_theme.dart';
// import '/DesignSystem/Samples/characterCardSampleScreen/character_card_sample_screen.dart';
// import '/DesignSystem/Samples/inputFieldSampleScreen/input_field_sample_screen.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Design System Sample App',
//       theme: AppTheme.light(), // seu tema HP
//       home: const DsHome(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class SampleItem {
//   final String title;
//   final String subtitle;
//   final List<String> tags;
//   final Widget Function() builder;
//   final IconData icon;
//
//   SampleItem({
//     required this.title,
//     required this.subtitle,
//     required this.tags,
//     required this.builder,
//     required this.icon,
//   });
//
//   bool matches(String q) {
//     final query = q.toLowerCase().trim();
//     if (query.isEmpty) return true;
//     return title.toLowerCase().contains(query) ||
//         subtitle.toLowerCase().contains(query) ||
//         tags.any((t) => t.toLowerCase().contains(query));
//   }
// }
//
// class DsHome extends StatefulWidget {
//   const DsHome({super.key});
//
//   @override
//   State<DsHome> createState() => _DsHomeState();
// }
//
// class _DsHomeState extends State<DsHome> {
//   final _controller = TextEditingController();
//   late List<SampleItem> _all;
//   late List<SampleItem> _filtered;
//
//   @override
//   void initState() {
//     super.initState();
//     _all = [
//       SampleItem(title: 'Action Button', subtitle: 'Botões HP (Primary / Secondary / Tertiary)', tags: ['button', 'acao', 'botao', 'icon left right', 'hp'], builder: () => const ActionButtonPage(), icon: Icons.smart_button,),
//       SampleItem(title: 'Tab Bar', subtitle: 'Filled & Underline', tags: ['tab', 'tabs', 'navigation', 'barra', 'underline', 'filled'], builder: () => const TabPage(), icon: Icons.tab,),
//       SampleItem(title: 'Accordion / Expansion', subtitle: 'Abrir detalhes ao tocar', tags: ['accordion', 'expansion', 'lista', 'detalhes'], builder: () => const AccordionSampleScreen(), icon: Icons.unfold_more,),
//       SampleItem(title: 'Assets (Fontes & Ícones)', subtitle: 'Listagem de fontes e ícones do DS', tags: ['assets', 'fontes', 'icones', 'typography', 'icons'], builder: () => AssetsSampleScreen.instantiate(), icon: Icons.font_download,),
//       SampleItem(title: 'Paleta de Cores', subtitle: 'Nome + HEX das cores', tags: ['cores', 'colors', 'palette', 'hex', 'theme'], builder: () => ColorsSampleScreen.instantiate(), icon: Icons.palette,),
//       SampleItem(title: 'Input Text Field', subtitle: 'Campo de texto estilizado HP', tags: ['input', 'textfield', 'form', 'texto'], builder: () => InputFieldPage(), icon: Icons.text_fields,),
//       SampleItem(title: 'Character Card', subtitle: 'Cards do Personagem API', tags: ['character', 'personagem', 'card'], builder: () => CharacterCardSampleScreen(), icon: Icons.recent_actors,),
//       // DsSampleItem(title: 'Bottom Tab Bar',subtitle: 'Navegação inferior',tags: ['bottom', 'navigation', 'tabs', 'bar'],builder: () => const BottomTabBarPage(),icon: Icons.space_dashboard,),
//       // DsSampleItem(title: 'Linked Label', subtitle: 'Texto com link',tags: ['label', 'link', 'texto', 'acessibilidade'],builder: () => const LinkedLabelPage(),icon: Icons.link,),
//     ];
//     _filtered = List.from(_all);
//     _controller.addListener(() {setState(() {_filtered = _all.where((e) => e.matches(_controller.text)).toList();});});}
//
//   @override
//   void dispose() {_controller.dispose();super.dispose();}
//   void _open(SampleItem item) {Navigator.of(context).push(MaterialPageRoute(builder: (_) => item.builder()));}
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Design System Sample App'),
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(56),
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
//             child: _SearchField(controller: _controller),),),),
//       body: ListView.separated(
//         padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
//         itemCount: _filtered.length,
//         separatorBuilder: (_, __) => const SizedBox(height: 12),
//         itemBuilder: (_, i) {
//           final item = _filtered[i];
//           return _SampleCard(item: item, onTap: () => _open(item));},),);}}
//
// class _SearchField extends StatelessWidget {
//   final TextEditingController controller;
//   const _SearchField({required this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       textInputAction: TextInputAction.search,
//       decoration: InputDecoration(
//         hintText: 'Buscar componente (ex.: button, tabs, cores...)',
//         prefixIcon: const Icon(Icons.search),),);}}
//
// class _SampleCard extends StatelessWidget {
//   final SampleItem item;
//   final VoidCallback onTap;
//
//   const _SampleCard({required this.item, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 1,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(14),
//         onTap: onTap,
//         child: Padding(
//           padding: const EdgeInsets.all(14),
//           child: Row(
//             children: [
//               Icon(item.icon, size: 28),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(item.title, style: Theme.of(context).textTheme.titleMedium),
//                     const SizedBox(height: 4),
//                     Text(item.subtitle, style: Theme.of(context).textTheme.bodySmall),],),),
//               const Icon(Icons.chevron_right),],),),),);
//   }
// }
