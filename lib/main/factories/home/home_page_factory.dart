import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:target_app/presentation/presenters/home_page_store.dart';

import '../../../ui/pages/home/home_page.dart';

Widget makeHomePage() {
  final homePageStore = GetIt.instance<HomePageStore>();
  return HomePage(homePageStore: homePageStore);
}
