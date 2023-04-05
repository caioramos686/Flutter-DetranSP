import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomDataChart extends StatefulWidget {
  List<ChartData> itens;

  CustomDataChart({Key? key, required this.itens}) : super(key: key);

  @override
  _CustomDataChartState createState() => _CustomDataChartState();
}
class _CustomDataChartState extends State<CustomDataChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <ChartSeries>[
          ColumnSeries<ChartData, String>(
            color: Colors.blueAccent,
            dataSource: widget.itens,
            xValueMapper: (ChartData dados, _) => dados.valueX,
            yValueMapper: (ChartData dados, _) => dados.valueY,
            pointColorMapper: (ChartData dados, _) => dados.cor,
            dataLabelSettings: DataLabelSettings(isVisible: true, labelPosition: ChartDataLabelPosition.outside),
          ),
        ],
      ),
    );
  }
}
class ChartData{
  final String valueX;
  final int valueY;
  final Color cor;

  ChartData(this.valueX, this.valueY, this.cor);
}
