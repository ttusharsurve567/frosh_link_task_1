import 'package:flutter/material.dart';
import 'package:frosh_link_task_1/providers/model.dart';
import 'package:frosh_link_task_1/widgets/model_item.dart';
import 'package:provider/provider.dart';

class ModelsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final modelData = Provider.of<Models>(context).models;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
          value: modelData[index],
          child: ModelItem(),
        );
      },
      itemCount: modelData.length,
      padding: EdgeInsets.all(8),
    );
  }
}
