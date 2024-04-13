import 'package:book_library/app/app_constant.dart';
import 'package:book_library/controller/base_controller.dart';
import 'package:book_library/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstant.project),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              child: SearchBar(
                trailing: const [Icon(Icons.search)],
                hintText: "Search books here",
                controller: searchController,
                onChanged: controller.onSearchResult,
              ),
            )),
      ),
      body: Obx(
        () => controller.appState.value == AppState.loading
            ? const Center(child: CircularProgressIndicator())
            : controller.books.isNotEmpty
                ? GridView.builder(
                    // Set padding and spacing between cards.
                    padding: const EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      // Set the number of columns based on the device's screen size.
                      crossAxisCount: 2,
                      // Set the aspect ratio of each card.
                      childAspectRatio: 1.5 / 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    // Set the number of items in the grid view.
                    itemCount: controller.books.length,
                    itemBuilder: (BuildContext context, int index) {
                      // Build each card in the grid view.

                      final book = controller.books[index];
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              // Add an image to each card.
                              child: Image.network(
                                'https://covers.openlibrary.org/b/id/${book.coverId}-M.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                      child: Text('${book.title}',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontSize: 15.0))),
                                  const SizedBox(height: 5.0),
                                  book.authorNames != null &&
                                          book.authorNames!.isNotEmpty
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Author: "),
                                            Expanded(
                                              child: Column(
                                                children: List.generate(
                                                    book.authorNames!.length,
                                                    (index) => Text(book
                                                        .authorNames![index])),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container(),
                                  const SizedBox(height: 5.0),
                                  Text(
                                      "Published year: ${book.firstPublishYear}"),
                                  Center(
                                      child: SizedBox(
                                    width: double.infinity,
                                    child: TextButton(
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    side: const BorderSide(
                                                      color: Colors.black,
                                                      // your color here
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.red)),
                                        onPressed: () {},
                                        child: Text(
                                          'Read',
                                          style: TextStyle(
                                              color: ColorManager.white),
                                        )),
                                  )),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      );
                    },
                    // Set the grid view to shrink wrap its contents.
                    shrinkWrap: true,
                  )
                : const Text('No data found'),
      ),
    );
  }
}
