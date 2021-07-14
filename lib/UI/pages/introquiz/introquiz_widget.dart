import '../../style/flutter_flow/flutter_flow_theme.dart';
import '../../style/flutter_flow/flutter_flow_util.dart';
import '../question_page/question_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class IntroquizWidget extends StatefulWidget {
  IntroquizWidget({Key? key}) : super(key: key);

  @override
  _IntroquizWidgetState createState() => _IntroquizWidgetState();
}

class _IntroquizWidgetState extends State<IntroquizWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFE1EFE6),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                duration: Duration(milliseconds: 400),
                reverseDuration: Duration(milliseconds: 400),
                child: QuestionPageWidget(),
              ),
            );
          },
          backgroundColor: FlutterFlowTheme.primaryColor,
          icon: Icon(
            Icons.navigate_next,
            color: Colors.white,
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
                  'Welcome to the Rorschach test, please read the following information before starting the test',
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
                    '''- You can click on the image to enlarge.
- You can take as much time as you want, you\'re allowed to post multiple or no answers.
- You can view the image from any angle you want''',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 110, 0),
                        child: Text(
                          'I understand, start the quiz',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
