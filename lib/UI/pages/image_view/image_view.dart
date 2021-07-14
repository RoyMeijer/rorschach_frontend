import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  ImageView({
    Key? key,
    required this.photo,
    this.onTap,
  }) : super(key: key);

  final String photo;
  final VoidCallback? onTap;

  @override
  _ImageViewState createState() => _ImageViewState(photo, onTap);
}

class _ImageViewState extends State<ImageView>{
  late String photo;
  late VoidCallback? onTap;

  _ImageViewState(String photo, VoidCallback? onTap) {
    this.photo = photo;
    this.onTap = onTap;

  }

  int rotation = 0;

  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(40,0,0,20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: onTap,
                  child: Icon(Icons.arrow_back, color: Colors.black),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0,0,10,20),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        rotation -= 1;
                      });
                    },
                    child: Icon(
                      Icons.rotate_left,
                      color: Colors.black,
                    ),
                  ),
                )),
          ],
        ),
        body: Container(
            color: Colors.black,
            alignment: Alignment.center,
            child: RotatedBox(
              quarterTurns: this.rotation,
              child: Hero(
                tag: "photo",
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onTap,
                    child: Image.asset(
                      photo,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            )));
  }
}
