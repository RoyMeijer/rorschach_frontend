import '../../style/flutter_flow/flutter_flow_theme.dart';
import '../../style/flutter_flow/flutter_flow_util.dart';
import '../question_reflection_page/question_reflection_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class IntroReflectionWidget extends StatefulWidget {
  IntroReflectionWidget({Key? key}) : super(key: key);

  @override
  _IntroReflectionWidgetState createState() => _IntroReflectionWidgetState();
}

class _IntroReflectionWidgetState extends State<IntroReflectionWidget> {
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
              duration: Duration(milliseconds: 400),
              reverseDuration: Duration(milliseconds: 400),
              child: QuestionReflectionPageWidget(),
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
                'You will now enter the second part of the quiz. ',
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
                  '''You will be asked what the reasons are you answered like you did.  Click on the options for a explanation.
                  Color
                  Movement
                  Form''',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
