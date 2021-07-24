import 'package:flutter/material.dart';
import 'package:rorschach/UI/pages/image_view/image_view.dart';

class RorschachBlotCard extends StatelessWidget {
  const RorschachBlotCard({
    Key? key,
    required this.photo,
    this.onTap,
  }) : super(key: key);

  final String photo;
  final VoidCallback? onTap;

  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Color(0xFFF5F5F5),
      elevation: 10,
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute<void>(builder: (BuildContext context) {
            return ImageView(
              photo: photo,
              onTap: () {
                Navigator.of(context).pop();
              },
            );
          }));
        },
        child: Padding(
          child: Image.asset(photo),
          padding: EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}
