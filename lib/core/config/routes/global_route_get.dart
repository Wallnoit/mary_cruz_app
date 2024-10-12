import 'package:get/get_navigation/get_navigation.dart';
import 'package:mary_cruz_app/actualizations/Actualization_page.dart';
import 'package:mary_cruz_app/candidates/pages/candidates_page.dart';
import 'package:mary_cruz_app/events/pages/events_page.dart';
import 'package:mary_cruz_app/home/pages/home_page.dart';
import 'package:mary_cruz_app/news/pages/news_page.dart';
import 'package:mary_cruz_app/proposals/pages/proposals_page.dart';
import 'package:mary_cruz_app/survey/pages/survey_page.dart';
import 'package:mary_cruz_app/testimony/pages/testimony_page.dart';

import '../../../comments/ui/opinions_page.dart';

class GlobalRouteGet {
  static const initialRoute = '/';

  static final List<GetPage> routes = [
    GetPage(
        name: '/', page: () => const HomePage(), transition: Transition.fadeIn),
    
    GetPage(
        name: '/candidates',
        page: () => const CandidatesPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/proposals',
        page: () => const ProposalsPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/news',
        page: () => const NewsPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/events',
        page: () => const EventsPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/testimony',
        page: () => const TestimonyPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/opinions',
        page: () => const OpinionsPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/survey',
        page: () => const SurveyPage(),
        transition: Transition.fadeIn),
  ];
}
