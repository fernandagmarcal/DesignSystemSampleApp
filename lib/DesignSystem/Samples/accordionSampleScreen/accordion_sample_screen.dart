import 'package:flutter/material.dart';
import '../../shared/shared_colors.dart';
import '../../Components/Accordion/accordion_item.dart';
import '../../Components/Accordion/accordion_view_model.dart';

class AccordionSampleScreen extends StatelessWidget {
  const AccordionSampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = _sampleItems();

    return Scaffold(
      appBar: AppBar(title: const Text('Accordion/Expansion')),
      backgroundColor: backgroundColor,
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (_, i) => HpAccordionItem(viewModel: items[i]),
      ),
    );
  }

  List<AccordionItemViewModel> _sampleItems() {
    return [
      AccordionItemViewModel(
        title: 'A',
        content: _groupList([
          _Entry('Abóbora Explosiva', 'Guloseima que estoura quando mordida.'),
          _Entry('Azará Combinado', 'Feitiço complexo com efeitos somados.'),
        ]),
        initiallyExpanded: false,
      ),
      AccordionItemViewModel(
        title: 'B',
        content: _groupList([
          _Entry('Basilisco', 'Cobra gigante cujo olhar pode matar.'),
          _Entry('Beco Diagonal', 'Rua comercial onde bruxos compram suprimentos.'),
          _Entry('Bicuço', 'Hipogrifo, cabeça de águia e corpo de cavalo.'),
        ]),
        initiallyExpanded: true,
      ),
      AccordionItemViewModel(
        title: 'C',
        content: _groupList([
          _Entry('Corvinal', 'Casa de Hogwarts que valoriza inteligência.'),
          _Entry('Cruciatus', 'Uma das Maldições Imperdoáveis, causa dor extrema.'),
        ]),
      ),
    ];
  }

  static Widget _groupList(List<_Entry> entries) {
    return Column(
      children: List.generate(entries.length * 2 - 1, (index) {
        if (index.isOdd) {
          return Container(
            height: 1,
            color: marromClaro.withOpacity(0.5),
            margin: const EdgeInsets.symmetric(vertical: 8),
          );
        }
        final e = entries[index ~/ 2];
        return _EntryTile(title: e.title, subtitle: e.subtitle);
      }),
    );
  }
}

class _Entry {
  final String title;
  final String subtitle;
  _Entry(this.title, this.subtitle);
}

class _EntryTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const _EntryTile({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
          fontSize: 15,
          color: azulEscuro,),),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          fontSize: 13,
          color: azulEscuro,),),
      visualDensity: VisualDensity.compact,);
  }
}
