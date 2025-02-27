import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techbiz_rfid/src/common/widgets/general_appbar.dart';

class EditTagView extends ConsumerStatefulWidget {
  const EditTagView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditTagViewState();
}

class _EditTagViewState extends ConsumerState<EditTagView> {

  @override
  Widget build(BuildContext context) {
    return GeneralAppBar(
      appbarTitle: "Edit Tag",
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text("Select Tag to Edit"),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              // child: ListView.builder(
                
              //   itemBuilder: ),
            )
          ],
        ),
      ),);
  }
}