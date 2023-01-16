import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/favorites_provider.dart';

class DetailsCard extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String missionName;
  final String rocketName;
  final String flightNumber;
  final String youtubeUrl;
  final String redditUrl;
  const DetailsCard(
      {super.key,
      required this.id,
      required this.imageUrl,
      required this.missionName,
      required this.flightNumber,
      required this.rocketName,
      required this.youtubeUrl,
      required this.redditUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 50,
        shadowColor: Colors.black,
        color: Colors.greenAccent[100],
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.70,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.green[500],
                      radius: 108,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(imageUrl),
                        radius: 100,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Mission Name: $missionName',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('Rocket Name: $rocketName'),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('Flight Number: $flightNumber'),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: InkWell(
                            onTap: () => launchURL(youtubeUrl),
                            child: const FaIcon(
                              FontAwesomeIcons.youtube,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Consumer<FavoritesProvider>(
                          builder: (context, favoritesProvider, _) {
                            favoritesProvider.init();
                            var isFavorite =
                                favoritesProvider.favorites.contains(id);
                            return IconButton(
                              iconSize: 40,
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color:
                                    isFavorite ? Colors.red : Colors.blueGrey,
                              ),
                              onPressed: () {
                                favoritesProvider.toggleFavorite(id);
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: InkWell(
                            onTap: () => launchURL(redditUrl),
                            child: const FaIcon(
                              FontAwesomeIcons.reddit,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }

  void launchURL(String url) async {
    var myUrl = Uri.parse(url);
    if (await canLaunchUrl(myUrl)) {
      await launchUrl(myUrl);
    } else {
      throw 'Could not launch $url';
    }
  }
}
