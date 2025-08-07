import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {




    //Load videos from the discover provider
    final discoverProvider = context.watch<DiscoverProvider>();     // Catch all changes in the provider
   // final anotherExample = Provider.of<DiscoverProvider>(context); // same way to get the changes of the provider.


    return Scaffold(
      body: discoverProvider.initialLoading 
        ? Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        : VideoScrollableView(
            videos: discoverProvider.videos
          ),
    );
  }
}
