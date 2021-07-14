import '../../style/flutter_flow/flutter_flow_theme.dart';
import '../../style/flutter_flow/flutter_flow_util.dart';
import '../../style/flutter_flow/flutter_flow_widgets.dart';
import '../quiz_outro_page/quiz_outro_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class QuestionReflectionPageWidget extends StatefulWidget {
  QuestionReflectionPageWidget({Key? key}) : super(key: key);

  @override
  _QuestionReflectionPageWidgetState createState() =>
      _QuestionReflectionPageWidgetState();
}

class _QuestionReflectionPageWidgetState
    extends State<QuestionReflectionPageWidget> {
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
              child: QuizOutroPageWidget(),
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
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Text(
                'Reflection',
                style: FlutterFlowTheme.title1.override(
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Color(0xFFF5F5F5),
              elevation: 10,
              child: Image.asset(
                'assets/images/rorschach-blot-1.jpg',
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                'What\'s the reason you answered {Dog}?',
                style: FlutterFlowTheme.title2.override(
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Divider(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: GridView(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 0,
                    childAspectRatio: 1,
                  ),
                  scrollDirection: Axis.vertical,
                  children: [
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Color',
                      options: FFButtonOptions(
                        width: 20,
                        height: 20,
                        color: Color(0xFFF7E5B3),
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Movement',
                      options: FFButtonOptions(
                        width: 20,
                        height: 20,
                        color: Color(0xFFF7E5B3),
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Form',
                      options: FFButtonOptions(
                        width: 20,
                        height: 20,
                        color: Color(0xFFF7E5B3),
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
