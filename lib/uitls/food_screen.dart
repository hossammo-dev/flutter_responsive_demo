import 'package:flutter/material.dart';

import 'constants.dart';
import 'responsive_layout.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return ResponsiveLayout(
      mobileLayout: _buildMoile(_size),
      tabletLayout: _buildTablet(_size),
      desktopLayout: _buildTablet(_size),
    );
  }

  Widget _buildMoile(Size _size) => Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: _size.height * 0.23,
                child: ListView.builder(
                  itemCount: 5,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        children: [
                          SizedBox(
                            height: _size.height * 0.15,
                            width: _size.height * 0.15,
                            child: Image.network(
                              kFoodImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text('Food Name'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                itemCount: 30,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: _size.height * 0.15,
                          width: double.infinity,
                          child: Image.network(
                            kFoodImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Food Name',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      );

  Widget _buildTablet(Size _size) => Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
              itemCount: 100,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                mainAxisSpacing: 5,
                childAspectRatio: 0.6,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        children: [
                          SizedBox(
                            child: Image.network(
                              kFoodImage,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Food Name',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
        ),
      );
}
