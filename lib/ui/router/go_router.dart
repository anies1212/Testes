import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/model/post.dart';
import 'package:flutter_hackathon_2023/ui/page/record/connected_record_page.dart';
import 'package:flutter_hackathon_2023/ui/page/timeline/connected_timeline_page.dart';
import 'package:flutter_hackathon_2023/ui/page/upload_completed/upload_completed_page.dart';
import 'package:flutter_hackathon_2023/ui/page/welcome/connected_welcome_page.dart';
import 'package:go_router/go_router.dart';

GoRouter createGoRouter(int? userId) {
  return GoRouter(
    // アプリが起動した時
    initialLocation: UploadCompletedPage.routePath,
    // initialLocation: userId == null
    //     ? ConnectedWelcomePage.routePath
    //     : ConnectedTimelinePage.routePath,
    // パスと画面の組み合わせ
    routes: [
      GoRoute(
        path: ConnectedWelcomePage.routePath,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: ConnectedWelcomePage(),
          );
        },
      ),
      GoRoute(
        path: ConnectedRecordPage.routePath,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: ConnectedRecordPage(),
          );
        },
      ),
      GoRoute(
        path: ConnectedTimelinePage.routePath,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: ConnectedTimelinePage(),
          );
        },
      ),
      GoRoute(
        path: UploadCompletedPage.routePath,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: UploadCompletedPage(),
          );
        },
      ),
      // GoRoute(
      //   path: UploadCompletedPage.routePath,
      //   pageBuilder: (context, state) {
      //     return MaterialPage(
      //       child: UploadCompletedPage(
      //         post: PostModel.fromJson(
      //           state.extra as Map<String, dynamic>,
      //         ),
      //       ),
      //     );
      //   },
      // ),
    ],
    // 遷移ページがないなどのエラーが発生した時に、このページに行く
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    ),
  );
}
