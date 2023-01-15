import 'package:provider/provider.dart';

import 'favorites_provider.dart';
import 'upcoming_launches_provider.dart';

List<ChangeNotifierProvider> providers = [
  ChangeNotifierProvider(create: (_) => LaunchesProvider()),
  ChangeNotifierProvider(create: (_) => FavoritesProvider()),
];
