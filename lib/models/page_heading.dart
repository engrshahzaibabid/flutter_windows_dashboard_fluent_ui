import '../models/responsive.dart';
import 'package:fluent_ui/fluent_ui.dart';

class PageHeading extends StatelessWidget {
  PageHeading({Key? key, required this.title}) : super(key: key);

  String title;
  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: ResponsiveWidget.isSmallScreen(context) ? 16 : 20,
        fontWeight: FontWeight.bold));
  }
}
