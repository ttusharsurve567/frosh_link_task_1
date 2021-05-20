import 'package:flutter/material.dart';
import 'package:frosh_link_task_1/providers/model.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

class ModelDetailedScreen extends StatelessWidget {
  static const routeName = '/model_detailed';
  @override
  Widget build(BuildContext context) {
    final modelId = ModalRoute.of(context).settings.arguments as int;
    final loadedModel = Provider.of<Models>(context).findById(modelId);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Image",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            Hero(
                tag: modelId.toString(), child: Image.network(loadedModel.url)),
            SizedBox(
              height: 10,
            ),
            Text(
              loadedModel.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            )
          ],
        )
            // Column(
            //   children: [
            //     Container(
            //       height: MediaQuery.of(context).size.height * 0.8826,
            //       child: PhotoView(
            //         backgroundDecoration: BoxDecoration(
            //             color: Colors.white,
            //             gradient: LinearGradient(
            //                 colors: [Colors.white, Colors.black54],
            //                 begin: Alignment.topCenter,
            //                 end: Alignment.bottomCenter)),
            //         imageProvider: NetworkImage(
            //           loadedModel.url,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            ),
      ),
    );
  }
}
