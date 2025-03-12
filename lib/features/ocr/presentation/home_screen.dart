import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scanme/features/ocr/bloc/ocr_bloc.dart';
import 'package:scanme/features/ocr/presentation/helpguide.dart';
import 'package:scanme/features/ocr/presentation/homescreen_boxes/history_page.dart';
import 'package:scanme/features/ocr/presentation/settings.dart';
import 'package:scanme/features/ocr/presentation/splash_screen.dart';

import '../../../core/injection.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ImagePicker _imagepicker = ImagePicker(); // Moved outside build method

  @override
  Widget build(BuildContext context) {
    List<String> texts = [
      "Camera",
      "Gallery",
      "null",
      "Recents",
    ];

    List<IconData> icons = [
      Icons.camera_alt_rounded,
      Icons.photo,
      Icons.no_accounts_rounded,
      Icons.history,
    ];

    List<VoidCallback> onTaps = [
      () => _openCamera(context),
      () => _openGallery(context),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SplashScreen()),
        );
      },
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HistoryPage()),
        );
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Helpguide()));
            },
            icon: Icon(Icons.help_outline)),
        title: const Center(
          child: Text(
            "Scan Me",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(Icons.settings, color: Colors.black),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              },
            ),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => getIt<OcrBloc>(),
        child: BlocListener<OcrBloc, OcrState>(
          listener: (context, state) {
            print(state); // Debugging purpose

            if (state is UserLoadingState) {
              showDialog(
                context: context,
                barrierDismissible: false, // Prevent dismissing manually
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Processing OCR.."),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10),
                        Text("Please wait..."),
                      ],
                    ),
                  );
                },
              );
            } else if (state is UserLoadedState) {
              Navigator.pop(context); // Close loading dialog
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("OCR Success! Data: ${state.user}")),
              );
            } else if (state is UserErrorState) {
              Navigator.pop(context); // Close loading dialog
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Error: ${state.error}"),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              CarouselSlider(
                items: [
                  Image.network(
                      "https://www.scandit.com/wp-content/uploads/2019/12/IDScanningBlog.jpg"),
                  Image.network(
                      "https://getnametag.com/images/scanning-guidance/header-image.png"),
                  Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStvxLVo8SgaGU44hekOGkPCxCllTt6czl6oQ&s",
                      scale: 0.8),
                ],
                options: CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(seconds: 3),
                    viewportFraction: 1,
                    height: 200,
                    enlargeCenterPage: true),
              ),
              const Spacer(), // Push GridView to the bottom
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 50), // Add some spacing at the bottom
                child: GridView.builder(
                  shrinkWrap:
                      true, // Prevents GridView from taking unnecessary space
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: texts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      onTaps[index]();
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue[200],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              icons[index],
                              color: Colors.black,
                              size: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              texts[index],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openCamera(BuildContext context) async {
    final ImagePicker _imagepicker = ImagePicker();
    final XFile? image =
        await _imagepicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      print("Image picked: ${image.path}");

      // Convert XFile to File
      final File imageFile = File(image.path);

      // Pass the File object to the event
      context.read<OcrBloc>().add(GetUserDataEvent(imageFile));
    }
  }

  Future<void> _openGallery(BuildContext context) async {
    final ImagePicker _imagepicker =
        ImagePicker(); // Ensure ImagePicker is initialized
    final XFile? image =
        await _imagepicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      print("Image picked: ${image.path}");

      // Convert XFile to File
      final File imageFile = File(image.path);

      // Pass the File object to the event
      context.read<OcrBloc>().add(GetUserDataEvent(imageFile));
    }
  }
}
