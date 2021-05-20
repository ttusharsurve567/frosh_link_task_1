import 'package:flutter/material.dart';
import 'package:frosh_link_task_1/providers/model.dart';
import 'package:frosh_link_task_1/screens/model_detailed_screen.dart';
import 'package:provider/provider.dart';

class ModelItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned.fill(
                child: Hero(
              tag: model.id.toString(),
              child: Image.network(
                model.thumbnailUrl,
                fit: BoxFit.cover,
              ),
            )),
            Container(
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
          ],
        ),
        onTap: () {
          Navigator.of(context)
              .pushNamed(ModelDetailedScreen.routeName, arguments: model.id);
        },
      ),
    );
  }
}
