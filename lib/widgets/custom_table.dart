import 'package:flutter/material.dart';

import 'custom_colors.dart';

class CustomTable extends StatefulWidget {
  CustomTable({
    Key? key,
    this.verticalAlignment = TableCellVerticalAlignment.middle,
    required this.headerWidget,
    required this.bodyWidget,
    required this.columnWidths,
    this.bodyColumnWidths,
  }) : super(key: key);

  List<Widget> headerWidget;
  List<TableRow> bodyWidget;
  final Map<int, TableColumnWidth> columnWidths;
  final Map<int, TableColumnWidth>? bodyColumnWidths;
  TableCellVerticalAlignment verticalAlignment;

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          columnWidths: widget.columnWidths,
          border: TableBorder.all(),
          defaultVerticalAlignment: widget.verticalAlignment,
          children: [
            TableRow(
              children: widget.headerWidget,

            )
          ],
        ),
        Table(
          columnWidths: widget.bodyColumnWidths ?? widget.columnWidths,
          border: TableBorder.all(),
          defaultVerticalAlignment: widget.verticalAlignment,
          children: widget.bodyWidget,
        ),
      ],
    );
  }
}

class BoletoCheckbox extends StatelessWidget {
  BoletoCheckbox({Key? key, required this.onClick, required this.value}) : super(key: key);

  ValueChanged<bool?>? onClick;
  bool? value;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.3,
      child: Checkbox(
        value: value,
        onChanged: onClick,
      ),
    );
  }
}


class TextTableRow extends StatelessWidget {
  TextTableRow(
      {Key? key, required this.nome, this.color = Colors.white, this.padding = const EdgeInsets.all(12), this.fonte = true, this.aligment = Alignment.center})
      : super(key: key);

  String nome;
  Color? color;
  EdgeInsetsGeometry? padding;
  bool? fonte;
  AlignmentGeometry? aligment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: aligment,
      padding: padding,
      color: color,
      child: Text(
        nome,
        style: TextStyle(fontSize: 20, fontWeight: fonte == true ? FontWeight.bold : FontWeight.normal),
        textAlign: TextAlign.center,
      ),
    );
  }
}
