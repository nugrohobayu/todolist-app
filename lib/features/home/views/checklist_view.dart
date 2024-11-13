import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/application/constant/color_palette.dart';
import 'package:todolist/application/helper/size_config.dart';
import 'package:todolist/features/home/viewmodels/checklist_viewmodel.dart';

class CheckListView extends StatelessWidget {
  static const routeName = '/CheckListView';

  const CheckListView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CheckListViewModel>(context, listen: false).getCheckList(context);
    });
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {},
      child: Scaffold(
        floatingActionButton: IconButton(
            onPressed: () {
              Provider.of<CheckListViewModel>(context, listen: false).postCheckList(
                context,
                "test dua",
              );
            },
            icon: const Icon(
              Icons.add_box_rounded,
              size: 48,
              color: Colors.green,
            )),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.kDefaultPadding * 2,
            vertical: SizeConfig.kDefaultPadding * 4,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: SizeConfig.screenWidth * .75,
                child: const Text(
                  "Selamat Datang,",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: SizeConfig.kDefaultPadding)),
              Consumer<CheckListViewModel>(builder: (context, provider, child) {
                final checklist = provider.checklist.data;
                if (checklist != null) {
                  return Column(
                    children: checklist.map((e) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.screenHeight * .12,
                          margin: EdgeInsets.only(bottom: SizeConfig.kDefaultMargin * 4),
                          padding: EdgeInsets.only(
                            // top: SizeConfig.kDefaultPadding * 3,
                            left: SizeConfig.kDefaultPadding * 2,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: ColorPalette.grey.withOpacity(.4),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                textAlign: TextAlign.left,
                                e.name ?? "",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              IconButton(
                                  onPressed: () async {
                                    final id = e.id;
                                    Provider.of<CheckListViewModel>(context, listen: false).deleteCheckList(
                                      context,
                                      id.toString(),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.redAccent,
                                  )),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
