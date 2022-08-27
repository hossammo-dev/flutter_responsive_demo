import 'package:flutter/material.dart';

import 'uitls/constants.dart';
import 'uitls/responsive_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: ResponsiveLayout(
        mobileLayout: _mobileLayout(_size),
        tabletLayout: _tabletLayout(_size),
        desktopLayout: _desktopLayout(_size),
      ),
    );
  }

  Widget _mobileLayout(Size _size) => SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              kDummyImageUrl,
              height: _size.height * 0.4,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                kDummyText,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      );

  Widget _tabletLayout(Size _size) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => ListTile(
                leading: const Icon(Icons.person),
                title: Text('User #${index + 1}'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: _mobileLayout(_size),
          ),
        ],
      );

  Widget _desktopLayout(Size _size) => _tabletLayout(_size);
}
