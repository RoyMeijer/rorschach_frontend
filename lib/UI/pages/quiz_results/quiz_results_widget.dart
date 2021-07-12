import '../../style/flutter_flow/flutter_flow_theme.dart';
import '../../style/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizResultsWidget extends StatefulWidget {
  QuizResultsWidget({Key? key}) : super(key: key);

  @override
  _QuizResultsWidgetState createState() => _QuizResultsWidgetState();
}

class _QuizResultsWidgetState extends State<QuizResultsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFE1EFE6),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Navigator.pop(context);
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
                'Results',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.title1.override(
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
