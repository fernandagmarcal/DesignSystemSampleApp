import 'package:flutter/material.dart';
import '../../shared/shared_colors.dart';
import 'accordion_view_model.dart';

class HpAccordionItem extends StatefulWidget {
  final AccordionItemViewModel viewModel;

  const HpAccordionItem({super.key, required this.viewModel});

  @override
  State<HpAccordionItem> createState() => _HpAccordionItemState();
}

class _HpAccordionItemState extends State<HpAccordionItem>
    with SingleTickerProviderStateMixin {
  late bool _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = widget.viewModel.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    // Tokens do DS HP
    const double radius = 14;
    const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 16, vertical: 14);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: brancoPadrao,                   // header/content claro
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: azulEscuro, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Theme(
        // Remove default dividers do ExpansionTile
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: ExpansionTile(
            initiallyExpanded: _expanded,
            tilePadding: padding,
            childrenPadding: const EdgeInsets.fromLTRB(16, 6, 16, 16),
            onExpansionChanged: (v) => setState(() => _expanded = v),
            trailing: AnimatedRotation(
              turns: _expanded ? 0.5 : 0.0,
              duration: const Duration(milliseconds: 180),
              child: Icon(Icons.expand_more, color: azulEscuro),
            ),
            title: Text(
              widget.viewModel.title,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,    // título forte (HP)
                fontSize: 18,
                color: azulEscuro,
              ),
            ),
            subtitle: widget.viewModel.subtitle == null
                ? null
                : Text(
              widget.viewModel.subtitle!,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: azulEscuro,
              ),
            ),
            children: [
              // Linha dourada sutil entre header e conteúdo (HP)
              Container(
                height: 1,
                color: marromClaro.withOpacity(0.7),
                margin: const EdgeInsets.only(bottom: 12),
              ),
              // Conteúdo
              Align(
                alignment: Alignment.centerLeft,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: azulEscuro,
                  ),
                  child: widget.viewModel.content,),),],),),),);
  }
}
