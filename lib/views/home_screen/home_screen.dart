import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:thought_box_machine_test/model/widgets/custom_textfield.dart';
import 'package:thought_box_machine_test/utils/app_colors.dart';
import 'package:thought_box_machine_test/utils/app_styles.dart';
import 'package:thought_box_machine_test/utils/constants.dart';
import 'package:thought_box_machine_test/utils/helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController rowController;
  late TextEditingController columnController;
  late TextEditingController alphabetsController;
  late TextEditingController searchController;

  int cols = 0;
  int rows = 0;
  List<String> chars = [];
  Set<String> set = HashSet<String>();
  List<String> searchList = [];
  bool isAssigned = false;

  void addAllChars() {
    String alphabets = "abcdefghijklmnopqrstuvwxyz";
    List<String> arr = alphabets.split('');

    for (var element in arr) {
      set.add(element);
    }
  }

  @override
  void initState() {
    super.initState();
    rowController = TextEditingController();
    columnController = TextEditingController();
    alphabetsController = TextEditingController();
    searchController = TextEditingController();
    addAllChars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: rowController,
                      inputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      labelText: 'Enter rows',
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      controller: columnController,
                      inputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      labelText: 'Enter columns',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: alphabetsController,
                      inputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      labelText: 'Enter text',
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      controller: searchController,
                      inputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      labelText: 'Search',
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(
                  100,
                  40,
                ),
              ),
              onPressed: () {
                cols = int.tryParse(columnController.text) ?? 0;
                rows = int.tryParse(rowController.text) ?? 0;
                chars = alphabetsController.text.trim().toLowerCase().split('');
                if (rows < 0 || rows == 0) {
                  Helper.showSnackbar(
                    context,
                    message: 'At least 1 row is required',
                    isError: true,
                  );
                  return;
                }
                if (cols < 0 || cols == 0) {
                  Helper.showSnackbar(
                    context,
                    message: 'At least 1 column is required',
                    isError: true,
                  );
                  return;
                }
                if (chars.isEmpty || chars.length < 3) {
                  Helper.showSnackbar(
                    context,
                    message: 'At least 3 characters are required',
                    isError: true,
                  );
                  return;
                }
                if (!set.containsAll(chars)) {
                  Helper.showSnackbar(
                    context,
                    message: 'Only alphabets are allowed',
                    isError: true,
                  );
                  return;
                }
                if (cols > chars.length) {
                  Helper.showSnackbar(
                    context,
                    message: 'Columns should be less than entered text',
                    isError: true,
                  );
                  return;
                }
                if (searchController.text.isNotEmpty ||
                    searchController.text != '') {
                  this.searchList.clear();
                  List<String> searchList =
                      searchController.text.trim().toLowerCase().split('');
                  for (int i = 0; i < searchList.length; i++) {
                    if (chars.contains(searchList[i])) {
                      this.searchList.add(searchList[i]);
                    }
                  }
                  print("${this.searchList} kittiii");
                } else {
                  searchList.clear();
                }
                setState(() => isAssigned = true);
                FocusScope.of(context).unfocus();
              },
              child: const Text(
                'Submit',
              ),
            ),
            height10,
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Rows can vary since it\'ll completely depend on the inputs',
                style: AppStyles.normalText,
              ),
            ),
            isAssigned
                ? Container(
                    margin: const EdgeInsets.all(10),
                    width: double.maxFinite,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: chars.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: cols,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: Alignment.center,
                          color: searchList.contains(chars[index])
                              ? AppColors.redColor
                              : AppColors.primaryColor,
                          child: Text(
                            chars[index],
                            style: AppStyles.normalText.copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
