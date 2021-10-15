import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);

  final mockService = MockFooderlichService();

  @override
  Widget build(BuildContext context) {
    // 2
    // TODO 1: Add TodayRecipeListView FutureBuilder
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, AsyncSnapshot<ExploreData> data) {
          // TODO: Add Nested List Views
          // 4
          if (data.connectionState == ConnectionState.done) {
            final recipes = data.data?.todayRecipes ?? [];
            // TODO: Replace this with TodayRecipeListView
            return Center(
              child: Container(
                child: const Text('Show TodayRecipeListView'),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
