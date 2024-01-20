import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BitcoinLineChart extends StatefulWidget {
  const BitcoinLineChart({super.key});

  @override
  State<BitcoinLineChart> createState() => _BitcoinLineChartState();
}

class _BitcoinLineChartState extends State<BitcoinLineChart> {
  List<Color> gradientColors = [Colors.blue, Colors.blue];

  List rawData = [
    {"time": 1705730400, "USD": 41586},
    {"time": 1705726800, "USD": 41578},
    {"time": 1705723200, "USD": 41603},
    {"time": 1705719600, "USD": 41590},
    {"time": 1705716000, "USD": 41619},
    {"time": 1705712400, "USD": 41475},
    {"time": 1705708800, "USD": 41629},
    {"time": 1705705200, "USD": 41664},
    {"time": 1705701600, "USD": 41607},
    {"time": 1705698000, "USD": 41548},
    {"time": 1705694400, "USD": 41770},
    {"time": 1705690800, "USD": 41774},
    {"time": 1705687200, "USD": 41173},
    {"time": 1705683600, "USD": 40349},
    {"time": 1705680000, "USD": 40857},
    {"time": 1705676400, "USD": 40921},
    {"time": 1705672800, "USD": 41349},
    {"time": 1705669200, "USD": 41290},
    {"time": 1705665600, "USD": 41431},
    {"time": 1705662000, "USD": 41426},
    {"time": 1705658400, "USD": 41358},
    {"time": 1705654800, "USD": 41257},
    {"time": 1705651200, "USD": 41235},
    {"time": 1705647600, "USD": 41448},
    {"time": 1705644000, "USD": 41163},
    {"time": 1705640400, "USD": 41053},
    {"time": 1705636800, "USD": 41003},
    {"time": 1705633200, "USD": 41080},
    {"time": 1705629600, "USD": 41257},
    {"time": 1705626000, "USD": 41253},
    {"time": 1705622400, "USD": 41281},
    {"time": 1705618800, "USD": 41315},
    {"time": 1705615200, "USD": 41072},
    {"time": 1705611600, "USD": 40772},
    {"time": 1705608000, "USD": 40957},
    {"time": 1705604400, "USD": 41480},
    {"time": 1705600800, "USD": 41762},
    {"time": 1705597200, "USD": 41872},
    {"time": 1705593600, "USD": 42586},
    {"time": 1705590000, "USD": 42693},
    {"time": 1705586400, "USD": 42500},
    {"time": 1705582800, "USD": 42397},
    {"time": 1705579200, "USD": 42499},
    {"time": 1705575600, "USD": 42406},
    {"time": 1705572000, "USD": 42700},
    {"time": 1705568400, "USD": 42711},
    {"time": 1705564800, "USD": 42862},
    {"time": 1705561200, "USD": 42759},
    {"time": 1705557600, "USD": 42728},
    {"time": 1705554000, "USD": 42624},
    {"time": 1705550400, "USD": 42550},
    {"time": 1705546800, "USD": 42626},
    {"time": 1705543200, "USD": 42556},
    {"time": 1705539600, "USD": 42638},
    {"time": 1705536000, "USD": 42747},
    {"time": 1705532400, "USD": 42674},
    {"time": 1705528800, "USD": 42647},
    {"time": 1705525200, "USD": 42660},
    {"time": 1705521600, "USD": 42581},
    {"time": 1705518000, "USD": 42570},
    {"time": 1705514400, "USD": 42344},
    {"time": 1705510800, "USD": 42318},
    {"time": 1705507200, "USD": 42466},
    {"time": 1705503600, "USD": 42553},
    {"time": 1705500000, "USD": 42578},
    {"time": 1705496400, "USD": 42742},
    {"time": 1705492800, "USD": 42663},
    {"time": 1705489200, "USD": 42815},
    {"time": 1705485600, "USD": 42669},
    {"time": 1705482000, "USD": 42695},
    {"time": 1705478400, "USD": 42638},
    {"time": 1705474800, "USD": 42791},
    {"time": 1705471200, "USD": 42766},
    {"time": 1705467600, "USD": 42833},
    {"time": 1705464000, "USD": 42848},
    {"time": 1705460400, "USD": 42982},
    {"time": 1705456800, "USD": 43000},
    {"time": 1705453200, "USD": 43092},
    {"time": 1705449600, "USD": 43134},
    {"time": 1705446000, "USD": 43224},
    {"time": 1705442400, "USD": 43434},
    {"time": 1705438800, "USD": 43174},
    {"time": 1705435200, "USD": 43151},
    {"time": 1705431600, "USD": 43015},
    {"time": 1705428000, "USD": 43037},
    {"time": 1705424400, "USD": 43242},
    {"time": 1705420800, "USD": 43243},
    {"time": 1705417200, "USD": 42656},
    {"time": 1705413600, "USD": 42787},
    {"time": 1705410000, "USD": 43126},
    {"time": 1705406400, "USD": 42864},
    {"time": 1705402800, "USD": 42849},
    {"time": 1705399200, "USD": 42903},
    {"time": 1705395600, "USD": 42951},
    {"time": 1705392000, "USD": 42740},
    {"time": 1705388400, "USD": 42705},
    {"time": 1705384800, "USD": 42734},
    {"time": 1705381200, "USD": 42751},
    {"time": 1705377600, "USD": 42888},
    {"time": 1705374000, "USD": 42672},
    {"time": 1705370400, "USD": 42542},
    {"time": 1705366800, "USD": 42570},
    {"time": 1705363200, "USD": 42499},
    {"time": 1705359600, "USD": 42582},
    {"time": 1705356000, "USD": 42690},
    {"time": 1705352400, "USD": 42922},
    {"time": 1705348800, "USD": 42953},
    {"time": 1705345200, "USD": 42986},
    {"time": 1705341600, "USD": 42689},
    {"time": 1705338000, "USD": 42503},
    {"time": 1705334400, "USD": 42254},
    {"time": 1705330800, "USD": 42179},
    {"time": 1705327200, "USD": 42833},
    {"time": 1705323600, "USD": 42642},
    {"time": 1705320000, "USD": 42676},
    {"time": 1705316400, "USD": 42540},
    {"time": 1705312800, "USD": 42720},
    {"time": 1705309200, "USD": 42646},
    {"time": 1705305600, "USD": 42692},
    {"time": 1705302000, "USD": 42644},
    {"time": 1705298400, "USD": 42725},
    {"time": 1705294800, "USD": 42585},
    {"time": 1705291200, "USD": 42550},
    {"time": 1705287600, "USD": 42379},
    {"time": 1705284000, "USD": 42266},
    {"time": 1705280400, "USD": 42256},
    {"time": 1705276800, "USD": 41711},
    {"time": 1705273200, "USD": 42245},
    {"time": 1705269600, "USD": 42511},
    {"time": 1705266000, "USD": 42511},
    {"time": 1705262400, "USD": 42638},
    {"time": 1705258800, "USD": 42883},
    {"time": 1705255200, "USD": 42958},
    {"time": 1705251600, "USD": 42917},
    {"time": 1705248000, "USD": 42893},
    {"time": 1705244400, "USD": 42823},
    {"time": 1705240800, "USD": 42883},
    {"time": 1705237200, "USD": 42748},
    {"time": 1705233600, "USD": 42811},
    {"time": 1705230000, "USD": 42879},
    {"time": 1705226400, "USD": 43037},
    {"time": 1705222800, "USD": 42986},
    {"time": 1705219200, "USD": 42998},
    {"time": 1705215600, "USD": 42979},
    {"time": 1705212000, "USD": 42746},
    {"time": 1705208400, "USD": 42579},
    {"time": 1705204800, "USD": 42670},
    {"time": 1705201200, "USD": 42768},
    {"time": 1705197600, "USD": 42790},
    {"time": 1705194000, "USD": 42692},
    {"time": 1705190400, "USD": 42840},
    {"time": 1705186800, "USD": 42982},
    {"time": 1705183200, "USD": 42965},
    {"time": 1705179600, "USD": 42866},
    {"time": 1705176000, "USD": 42792},
    {"time": 1705172400, "USD": 42798},
    {"time": 1705168800, "USD": 42887},
    {"time": 1705165200, "USD": 42873},
    {"time": 1705161600, "USD": 43148},
    {"time": 1705158000, "USD": 42849},
    {"time": 1705154400, "USD": 42724},
    {"time": 1705150800, "USD": 42677},
    {"time": 1705147200, "USD": 42604},
    {"time": 1705143600, "USD": 42701},
    {"time": 1705140000, "USD": 42914},
    {"time": 1705136400, "USD": 43174},
    {"time": 1705132800, "USD": 43097},
    {"time": 1705129200, "USD": 43141},
    {"time": 1705125600, "USD": 43073},
    {"time": 1705122000, "USD": 42827},
    {"time": 1705118400, "USD": 42596},
    {"time": 1705114800, "USD": 42530},
    {"time": 1705111200, "USD": 42668},
    {"time": 1705107600, "USD": 42818},
    {"time": 1705104000, "USD": 42800},
    {"time": 1705100400, "USD": 42480},
    {"time": 1705096800, "USD": 43410},
    {"time": 1705093200, "USD": 43645},
    {"time": 1705089600, "USD": 43433},
    {"time": 1705086000, "USD": 43441},
    {"time": 1705082400, "USD": 43639},
    {"time": 1705078800, "USD": 43502},
    {"time": 1705075200, "USD": 44387},
    {"time": 1705071600, "USD": 45441},
    {"time": 1705068000, "USD": 45776},
    {"time": 1705064400, "USD": 45858},
    {"time": 1705060800, "USD": 45960},
    {"time": 1705057200, "USD": 46068},
    {"time": 1705053600, "USD": 45928},
    {"time": 1705050000, "USD": 45880},
    {"time": 1705046400, "USD": 46002},
    {"time": 1705042800, "USD": 46109},
    {"time": 1705039200, "USD": 46199},
    {"time": 1705035600, "USD": 45956},
    {"time": 1705032000, "USD": 46016},
    {"time": 1705028400, "USD": 46139},
    {"time": 1705024800, "USD": 46140},
    {"time": 1705021200, "USD": 46301},
    {"time": 1705017600, "USD": 46350},
    {"time": 1705014000, "USD": 46409}
  ];

  formatData() {
    List<FlSpot> formattedData = rawData
        .map((e) => FlSpot(e['time'].toDouble(), e['USD'].toDouble()))
        .toList();
    return formattedData;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 0,
              left: 0,
              top: 24,
              bottom: 0,
            ),
            child: LineChart(
              mainData(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    List<FlSpot> formattedData = formatData();

    return LineChartData(
      lineTouchData: const LineTouchData(

        touchTooltipData: LineTouchTooltipData(

          tooltipBgColor: Colors.white,
          fitInsideHorizontally: true,
        ),
      ),
      gridData: const FlGridData(show: false),
      titlesData: const FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 1705014000,
      maxX: 1705730400,
      minY: 38000,
      maxY: 47000,
      backgroundColor: Colors.white,
      lineBarsData: [
        LineChartBarData(
          spots: formattedData,
          isCurved: true,
          color: Colors.blue,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.1))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
