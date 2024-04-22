import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PerformanceGraph extends StatelessWidget {
  final List<charts.Series<PerformanceData, num>> seriesList;
  final bool animate;

  PerformanceGraph(this.seriesList, {this.animate = false});

  factory PerformanceGraph.withSampleData() {
    return PerformanceGraph(
      _createSampleData(),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(
      seriesList,
      animate: animate,
      behaviors: [
        charts.ChartTitle('Points (%)',
            behaviorPosition: charts.BehaviorPosition.start,
            titleOutsideJustification: charts.OutsideJustification.middleDrawArea)
      ],
    );
  }

  static List<charts.Series<PerformanceData, num>> _createSampleData() {
    final data = [
      PerformanceData(2020, 5, 3, 4),
      PerformanceData(2021, 25, 15, 20),
      PerformanceData(2022, 100, 50, 75),
    ];

    return [
      charts.Series<PerformanceData, num>(
        id: 'Profits',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (PerformanceData data, _) => data.year,
        measureFn: (PerformanceData data, _) => data.profitsPoints,
        data: data,
      ),
      charts.Series<PerformanceData, num>(
        id: 'Emissions',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (PerformanceData data, _) => data.year,
        measureFn: (PerformanceData data, _) => data.emissionsPoints,
        data: data,
      ),
      charts.Series<PerformanceData, num>(
        id: 'Composite Score',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (PerformanceData data, _) => data.year,
        measureFn: (PerformanceData data, _) => data.compositeScore,
        data: data,
      ),
    ];
  }
}

class PerformanceData {
  final int year;
  final double profitsPoints;
  final double emissionsPoints;
  final double compositeScore;

  PerformanceData(this.year, this.profitsPoints, this.emissionsPoints, this.compositeScore);
}

