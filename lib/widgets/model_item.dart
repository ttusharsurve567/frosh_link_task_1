import 'package:flutter/material.dart';
import 'package:frosh_link_task_1/providers/model.dart';
import 'package:frosh_link_task_1/screens/model_detailed_screen.dart';
import 'package:provider/provider.dart';

class ModelItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha(60),
                  blurRadius: 5.0,
                  spreadRadius: 3.0,
                )
              ],
              image: DecorationImage(
                  image: NetworkImage(model.thumbnailUrl), fit: BoxFit.cover)),
          child: Container(
            color: Colors.black54,
            child: Text(
              model.title,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white60,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context)
              .pushNamed(ModelDetailedScreen.routeName, arguments: model.id);
        },
      ),
    );
  }
}
