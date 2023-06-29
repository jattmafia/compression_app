import 'package:compressionapp/screens/compression/compressionscreen/compressionscreen.dart';
import 'package:compressionapp/screens/convert/convertscreen/convertscreen.dart';
import 'package:compressionapp/screens/pdfmaker/pdfmakerscreen/pdfmakerscreen.dart';
import 'package:compressionapp/utils/appcolors/appcolors.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().BackgroundColour,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Conversion App",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors().HeadingColour),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: AppColors().TabbarColour,
              ),
              child: TabBar(
                automaticIndicatorColorAdjustment: true,
                dividerColor: Colors.transparent,
                unselectedLabelColor: Colors.white,
                labelColor: Colors.white,
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  //border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColors().ButtonColour,
                ),
                tabs: [
                  Tab(text: 'Compression'),
                  Tab(text: 'Convert'),
                  Tab(text: 'Pdf maker'),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                CompressionScreen(),
                ConvertScreen(),
                PdfMakerScreen()
              ]),
            )
          ],
        ),
      ),
    );
  }
}
