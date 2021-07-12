import '../../style/flutter_flow/flutter_flow_theme.dart';
import '../../style/flutter_flow/flutter_flow_util.dart';
import '../quiz_results/quiz_results_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class QuizOutroPageWidget extends StatefulWidget {
  QuizOutroPageWidget({Key? key}) : super(key: key);

  @override
  _QuizOutroPageWidgetState createState() => _QuizOutroPageWidgetState();
}

class _QuizOutroPageWidgetState extends State<QuizOutroPageWidget> {
  bool checkboxListTileValue = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              duration: Duration(milliseconds: 300),
              reverseDuration: Duration(milliseconds: 300),
              child: QuizResultsWidget(),
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.primaryColor,
        icon: Icon(
          Icons.navigate_next, color: Colors.white
        ),
        elevation: 8,
        label: Container(),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: Text(
                'You have finished the quiz',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.title1.override(
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 20, 20),
                child: Text(
                  '''Disclaimer:
                  These results are in not scientifically accurate. 
                  Don\'t use them to judge your personal condition, talk to a professional.''',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
              child: CheckboxListTile(
                value: checkboxListTileValue,
                onChanged: (newValue) =>
                    setState(() => checkboxListTileValue = newValue ?? false),
                title: Text(
                  'Save my data anonymously',
                  style: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Poppins',
                  ),
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
              ),
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
