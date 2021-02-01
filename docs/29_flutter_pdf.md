# Flutter PDF app

# Contents
[Packages Used](#packages-used) | [Descripion](#descritpion) | [Explanation](#explanation) | [Results](#results) |

## Packages Used
* [pdf_flutter](https://pub.dev/packages/pdf_flutter) 
* [file picker](https://pub.dev/packages/file_picker)

## Description
This PoC has 3 buttons as shown in the image
* [PDF from URL](https://github.com/KK-MS/app_tutorial_flutter/blob/master/lib/29_flutter_pdf.dart)
* [PDF from Asset](https://github.com/KK-MS/app_tutorial_flutter/blob/master/lib/29_flutter_pdf.dart)
* [PDF from file/Device Storage](https://github.com/KK-MS/app_tutorial_flutter/blob/master/lib/29_flutter_pdf.dart)

![pdf-homescreen](https://user-images.githubusercontent.com/56631153/106457926-fc3eb100-648f-11eb-855f-ac4e1676000f.png)

From the image, it can be seen that the url is also being displayed. 
Also, tried to open the pdf when the device (emulator) WiFi was turned off, the pdf was still able to load.

## Explanation
The app uses two packages as mentioned above. The pdf_flutter package is used to load the pdf from url, assets and file system (Device Storage).
The file_picker package is used to get the file from the device storage.

## Results
* [PDF from URL](https://github.com/KK-MS/app_tutorial_flutter/blob/master/lib/29_flutter_pdf.dart):- When clicked, the pdf_flutter package loads the pdf file from the given url. The image below shows the pdf being loaded when clicked on "PDF from URL"
Here is the code snippet
```
RaisedButton(
              color: Colors.amber,
              child: Text('PDF from URL'),
              onPressed: () {
                print('URL to be loaded');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PDF.network(
                      url,
                      height: MediaQuery.of(context).size.height * 0.90,
                      width: MediaQuery.of(context).size.width * 0.90,
                    ),
                  ),
                );
              },
            ),
```       

![pdf-url](https://user-images.githubusercontent.com/56631153/106458339-84bd5180-6490-11eb-898f-f529c61719d0.png)

* [PDF from Asset](https://github.com/KK-MS/app_tutorial_flutter/blob/master/lib/29_flutter_pdf.dart):-  When clicked, the pdf_flutter package loads the pdf file from the asset. 
Thus, the pdf file has to be in the assets folder of the project directory before building the application. 
Here is the code snippet of the function being used
```
RaisedButton(
              color: Colors.blueAccent,
              child: Text('PDF from Assest'),
              onPressed: () {
                print('Asset PDF Loaded');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PDF.assets(
                      'assets/demopdf.pdf',
                      height: MediaQuery.of(context).size.height * 0.90,
                      width: MediaQuery.of(context).size.width * 0.90,
                    ),
                  ),
                );
              },
            ),
```
![pdf-asset](https://user-images.githubusercontent.com/56631153/106458675-057c4d80-6491-11eb-8f70-503fee6d85bd.png)

From the image below, it can be seen that the pdf file is present in assets folder. The file name is ```demopdf.pdf``` and it is highlighted in green color in the image below

![asset-structure](https://user-images.githubusercontent.com/56631153/106458767-23e24900-6491-11eb-808a-66cf30c77ae4.png)

* [PDF from file/Device Storage](https://github.com/KK-MS/app_tutorial_flutter/blob/master/lib/29_flutter_pdf.dart):- When clicked, the file-picker triggers the ```await FilePicker.platform.pickFiles``` function
which asks for the users to select the pdf file from the file manager. Once the pdf file is selected, the pdf_flutter package loads the file in the app.
Here is the code snippet
```
RaisedButton(
              onPressed: () async {
                FilePickerResult pickedFile =
                    await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                );
                if (pickedFile != null) {
                  localfile = File(pickedFile.files.single.path);
                }
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDF.file(
                        localfile,
                        height: MediaQuery.of(context).size.height * 0.90,
                        width: MediaQuery.of(context).size.width * 0.90,
                      ),
                    ),
                  );
                });
                //print('Device function called');
              },
              child: Text('PDF from file/Device Storage'),
              color: Colors.greenAccent,
            ),
```
![pdf-device-storage](https://user-images.githubusercontent.com/56631153/106459387-111c4400-6492-11eb-8f73-01cf967a5fcc.png)

Once the pdf file is selected, the app loads the pdf as shown below


![pdf-device-storage-display](https://user-images.githubusercontent.com/56631153/106459439-24c7aa80-6492-11eb-9412-794aeda32f23.png)
