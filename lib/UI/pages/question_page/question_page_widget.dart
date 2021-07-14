import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rorschach/UI/pages/image_view/rorschach_blot_card.dart';

import '../../style/flutter_flow/flutter_flow_theme.dart';
import '../../style/flutter_flow/flutter_flow_widgets.dart';
import '../question_reflection_page/question_reflection_page_widget.dart';

class QuestionPageWidget extends StatefulWidget {
  QuestionPageWidget({Key? key}) : super(key: key);

  @override
  _QuestionPageWidgetState createState() => _QuestionPageWidgetState();
}

class _QuestionPageWidgetState extends State<QuestionPageWidget> {
  late final TextEditingController answerTextfieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    answerTextfieldController = TextEditingController();
  }

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
              child: QuestionReflectionPageWidget(),
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text(
                  'What do you see?',
                  style: FlutterFlowTheme.title1.override(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              RorschachBlotCard(photo: 'assets/images/rorschach-blot-1.jpg'),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text(
                  'Insert answers here:',
                  style: FlutterFlowTheme.title2.override(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                child: TextFormField(
                  controller: answerTextfieldController,
                  obscureText: false,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF160C28),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF160C28),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF160C28),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('send_answer_btn pressed ...');
                      },
                      text: 'Send answer',
                      options: FFButtonOptions(
                        width: 180,
                        height: 40,
                        color: FlutterFlowTheme.primaryColor,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
