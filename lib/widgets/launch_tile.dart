import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/favorites_provider.dart';
import '../screens/launch_details_screen.dart';

class LaunchTile extends StatefulWidget {
  final String id;
  final String missionName;
  final String rocketName;
  final String imageUrl;
  final DateTime date;
  const LaunchTile(
      {super.key,
      required this.id,
      required this.missionName,
      required this.rocketName,
      required this.date,
      required this.imageUrl});

  @override
  State<LaunchTile> createState() => _LaunchTileState();
}

class _LaunchTileState extends State<LaunchTile> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    final now = DateTime.now();
    final difference = widget.date.difference(now);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        final newDifference = widget.date.difference(DateTime.now());
        if (newDifference.inMilliseconds <= 0) {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    var timeToLaunch = widget.date.difference(DateTime.now());
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 16),
      child: Column(
        children: [
          Card(
            child: ListTile(
              visualDensity: const VisualDensity(vertical: 3),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      id: widget.id,
                    ),
                  ),
                );
              },
              leading: Image.network(widget.imageUrl),
              title: Text(
                widget.missionName,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 16),
              ),
              subtitle: Text(widget.rocketName,
                  style: Theme.of(context).textTheme.bodySmall),
              trailing: Column(
                children: [
                  Consumer<FavoritesProvider>(
                    builder: (context, favoritesProvider, _) {
                      favoritesProvider.init();
                      var isFavorite =
                          favoritesProvider.favorites.contains(widget.id);
                      return Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : null,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(DateFormat.yMMMd().format(widget.date),
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              tileColor: const Color(0xffBCD4D8),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Time Left: ${timeToLaunch.inDays} Days, ${timeToLaunch.inHours.remainder(24)} Hours, ${timeToLaunch.inMinutes.remainder(60)} Minutes, ${timeToLaunch.inSeconds.remainder(60)} Seconds",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
