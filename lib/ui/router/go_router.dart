import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/ui/page/record/connected_record_page.dart';
import 'package:flutter_hackathon_2023/ui/page/welcome/welcome_page.dart';
import 'package:flutter_hackathon_2023/ui/timeline/connected_timeline_page.dart';
import 'package:go_router/go_router.dart';

GoRouter createGoRouter(int? userId) {
  return GoRouter(
    // アプリが起動した時
    initialLocation:
        userId == null ? WelcomePage.routePath : ConnectedRecordPage.routePath,
    // パスと画面の組み合わせ
    routes: [
      GoRoute(
        path: WelcomePage.routePath,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: WelcomePage(),
          );
        },
        routes: [
          GoRoute(
            path: ConnectedRecordPage.routePath,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: ConnectedRecordPage(),
              );
            },
          ),
        ],
      ),
    ],
    // 遷移ページがないなどのエラーが発生した時に、このページに行く
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
        GoRoute(
          name: ConnectedTimelinePage.routePath,
          path: ConnectedTimelinePage.routePath,
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: ConnectedTimelinePage(),
            );
          },
        ),
      ],
    ),
  ],
  // 遷移ページがないなどのエラーが発生した時に、このページに行く
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      body: Center(
        child: Text(state.error.toString()),
      ),
    ),
  );
}
