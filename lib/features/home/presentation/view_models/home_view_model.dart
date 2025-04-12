import 'package:flutter/material.dart';
import 'package:tejas_palyekar_portfolio/features/home/domain/models/home_model.dart';

class HomeViewModel extends ChangeNotifier {
  bool _isDarkMode = true;
  HomeModel? _homeData;

  bool get isDarkMode => _isDarkMode;
  HomeModel? get homeData => _homeData;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  Future<void> loadHomeData() async {
    // TODO: Load data from repository
    _homeData = HomeModel(
      name: 'Tejas Palyekar',
      role: 'Mobile App Developer',
      description:
          'Passionate about building beautiful and functional mobile applications.',
      skills: ['Flutter', 'Android', 'iOS', 'Firebase'],
      projects: [],
    );
    notifyListeners();
  }
}
