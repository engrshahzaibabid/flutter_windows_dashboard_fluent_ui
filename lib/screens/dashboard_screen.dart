import 'package:fluent_ui/fluent_ui.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:window_manager/window_manager.dart';

import '../models/page_heading.dart';
import '../models/responsive.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with WindowListener {
  var viewKey = GlobalKey();
  TooltipBehavior? _tooltipBehavior;
  final List<ChartData> chartData = [
    ChartData('Sec A', '12', '10', '14', '20'),
    ChartData('Sec B', '14', '11', '18', '23'),
    ChartData('Sec C', '16', '10', '15', '20'),
    ChartData('Sec D', '18', '16', '18', '24')
  ];

  closeDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return ContentDialog(
            title: const Text('Confirm Close'),
            content: const Text('Are you sure you want to close the app?'),
            actions: [
              FilledButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.pop(context);
                    windowManager.destroy();
                  }),
              FilledButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          );
        });
  }

  item(String heading, text, IconData iconData, Color color, int index) {
    return Container(
      width: ResponsiveWidget.isLargeScreen(context)
          ? MediaQuery.of(context).size.width / 5.4
          : ResponsiveWidget.isMediumScreen(context)
              ? MediaQuery.of(context).size.width / 3.2
              : MediaQuery.of(context).size.width,
      height: 100,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(1, 1),
                blurRadius: 5,
                spreadRadius: 5,
                color: Colors.black.withOpacity(0.01))
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.05, 1],
                    colors: index == 0
                        ? [
                            Colors.green.withOpacity(0.75),
                            Colors.green.withOpacity(0.4)
                          ]
                        : index == 1
                            ? [
                                Colors.orange.withOpacity(0.75),
                                Colors.orange.withOpacity(0.4)
                              ]
                            : index == 2
                                ? [
                                    Colors.red.withOpacity(0.75),
                                    Colors.red.withOpacity(0.4)
                                  ]
                                : [
                                    Colors.purple.withOpacity(0.75),
                                    Colors.purple.withOpacity(0.4)
                                  ])),
            child: const Icon(
              FluentIcons.follow_user,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                heading,
                maxLines: 2,
                style: TextStyle(
                height: 1,
                color: Colors.grey.withOpacity(0.8),
                fontSize: 11),
              ),
              const SizedBox(height: 8),
              Text(
                text,
                style: const TextStyle(fontSize: 30, height: 1),
              )
            ],
          ),
        ],
      ),
    );
  }

  stackedChart(){
    return Container(
        height: 400,
        width: ResponsiveWidget.isLargeScreen(context) ? MediaQuery.of(context).size.width / 2.4 : MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(offset: const Offset(1,1), blurRadius: 5, spreadRadius: 5, color: Colors.black.withOpacity(0.02))
            ]
        ),
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(
                text: 'Section wise attendance',
                alignment: ChartAlignment.near,
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    fontSize: 14)),
            series: <ChartSeries>[
              StackedColumnSeries<ChartData, String>(
                  groupName: 'Group A',
                  dataLabelSettings: DataLabelSettings(
                      isVisible:true,
                      showCumulativeValues: true
                  ),
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => num.parse(data.y1)
              ),
              StackedColumnSeries<ChartData, String>(
                  groupName: 'Group B',
                  dataLabelSettings: DataLabelSettings(
                      isVisible:true,
                      showCumulativeValues: true
                  ),
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => num.parse(data.y2)
              ),
              StackedColumnSeries<ChartData, String>(
                  groupName: 'Group A',
                  dataLabelSettings: DataLabelSettings(
                      isVisible:true,
                      showCumulativeValues: true
                  ),
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => num.parse(data.y3)
              ),
              StackedColumnSeries<ChartData, String>(
                  groupName: 'Group B',
                  dataLabelSettings: DataLabelSettings(
                      isVisible:true,
                      showCumulativeValues: true
                  ),
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => num.parse(data.y4)
              )
            ]
        )
    );
  }

  cartesianChart(){
    return Container(
        height: 400,
        width: ResponsiveWidget.isLargeScreen(context) ? MediaQuery.of(context).size.width / 3 : MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(1, 1),
                  blurRadius: 5,
                  spreadRadius: 5,
                  color: Colors.black.withOpacity(0.02))
            ]),
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(
                text: 'Previous Quarter Attendance',
                alignment: ChartAlignment.near,
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    fontSize: 14)),
            tooltipBehavior: _tooltipBehavior,
            series: <LineSeries<SalesData, String>>[
              LineSeries<SalesData, String>(
                  dataSource: <SalesData>[
                    SalesData('Jan', 804),
                    SalesData('Feb', 720),
                    SalesData('Mar', 783),
                    SalesData('Apr', 750),
                    // SalesData('May', 40),
                    // SalesData('June', 20),
                    // SalesData('July', 40),
                  ],
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  // Enable data label
                  dataLabelSettings:
                  const DataLabelSettings(isVisible: true))
            ]));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    windowManager.addListener(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    windowManager.removeListener(this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: PageHeading(
                  title: 'Dashboard',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ResponsiveWidget.isLargeScreen(context)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        item('Present\nStudents', '36', FluentIcons.user_clapper,
                            Colors.blue, 0),
                        item('Absent\nStudents', '10', FluentIcons.align_right,
                            Colors.green, 1),
                        item('Fake\nAttendance', '5', FluentIcons.cancel,
                            Colors.red, 2),
                        item('Total', '51', FluentIcons.delete, Colors.purple,
                            3),
                      ],
                    )
                  : ResponsiveWidget.isMediumScreen(context)
                  ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      item('Present Students', '36',
                          FluentIcons.user_clapper, Colors.blue, 0),
                      item('Absent Students', '10',
                          FluentIcons.align_right, Colors.green, 1),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      item('Fake Attendance', '5', FluentIcons.cancel,
                          Colors.red, 2),
                      item('Total', '51', FluentIcons.delete,
                          Colors.purple, 3),
                    ],
                  )
                ],
              )
                  : Column(
                      children: [
                        item('Present Students', '36',
                            FluentIcons.user_clapper, Colors.blue, 0),
                        const SizedBox(height: 25),
                        item('Absent Students', '10',
                            FluentIcons.align_right, Colors.green, 1),
                        const SizedBox(height: 25),
                        item('Fake Attendance', '5', FluentIcons.cancel,
                            Colors.red, 2),
                        const SizedBox(height: 25),
                        item('Total', '51', FluentIcons.delete,
                            Colors.purple, 3),
                      ],
                    ),

              const SizedBox(height: 25),

              ResponsiveWidget.isLargeScreen(context)
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  stackedChart(),
                  cartesianChart(),
                ],
              )
                  : Column(
                children: [
                  stackedChart(),
                  cartesianChart(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onWindowClose() async {
    super.onWindowClose();
    bool isPrevented = await windowManager.isPreventClose();
    if (isPrevented) {
      closeDialog();
    }
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class ChartData{
  ChartData(this.x, this.y1, this.y2, this.y3, this.y4);
  final String x;
  final String y1;
  final String y2;
  final String y3;
  final String y4;
}