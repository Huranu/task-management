import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/src/auth/presentation/login_screen.dart';
import 'package:task/src/calendar/calendar_screen.dart';
import 'package:task/src/milestones/milestone_screen.dart';
import 'package:task/src/sprints/sprint_screen.dart';
import 'package:task/src/tasks/create_task_screen.dart';
import 'package:task/src/home/home_screen.dart';
import 'package:task/src/projects/project_screen.dart';
import 'package:task/src/tasks/filtered_tasks_screen.dart';
import 'package:task/src/tasks/presentation/task_screen.dart';
import 'package:task/src/workspaces/workspace_screen.dart';
import '../home/home_navbar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login',
    debugLogDiagnostics: true,
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state, child) {
            return MaterialPage(
                child: AppScaffold(
              location: state.uri.toString(),
              child: child,
            ));
          },
          routes: [
            GoRoute(
              path: "/",
              pageBuilder: (context, state) => const MaterialPage(
                  child: Scaffold(body: HomeScreen()), fullscreenDialog: true),
            ),
            GoRoute(
              path: "/workspaces",
              pageBuilder: (context, state) => const MaterialPage(
                  child: Scaffold(
                    body: MyWorkspaceScreen(),
                  ),
                  fullscreenDialog: true),
            ),
            GoRoute(
              path: "/calendar",
              pageBuilder: (context, state) => const MaterialPage(
                  child: MyCalendar(), fullscreenDialog: true),
            ),
            GoRoute(
              path: "/profile",
              pageBuilder: (context, state) => const MaterialPage(
                  child: Scaffold(
                    body: Text('Profile'),
                  ),
                  fullscreenDialog: true),
            ),
          ]),
      GoRoute(
          path: "/login",
          pageBuilder: (context, state) =>
              MaterialPage(child: LoginScreen(), fullscreenDialog: true)),
      GoRoute(
          path: "/create-task",
          pageBuilder: (context, state) =>
              MaterialPage(child: CreateTaskScreen(), fullscreenDialog: true)),
      GoRoute(
          path: "/task/:taskId",
          pageBuilder: (context, state) {
            return MaterialPage(
                child: MyTaskScreen(
                    taskId: int.parse(state.pathParameters['taskId']!)),
                fullscreenDialog: true);
          }),
      GoRoute(
        path: "/project/:proId",
        pageBuilder: (context, state) {
          return MaterialPage(
              child: MyProjectScreen(
                proId: int.parse(state.pathParameters['proId']!),
              ),
              fullscreenDialog: true);
        },
      ),
      GoRoute(
        path: "/milestone/:mileId",
        pageBuilder: (context, state) {
          return MaterialPage(
              child: MyMilestoneScreen(
                mileId: int.parse(state.pathParameters['mileId']!),
              ),
              fullscreenDialog: true);
        },
      ),
      GoRoute(
        path: "/sprint/:sprintId",
        pageBuilder: (context, state) {
          return MaterialPage(
              child: MySprintScreen(
                sprintId: int.parse(state.pathParameters['sprintId']!),
              ),
              fullscreenDialog: true);
        },
      ),
      GoRoute(
        path: "/tasks",
        pageBuilder: (context, state) {
          return const MaterialPage(
              child: MyTasksScreen(), fullscreenDialog: true);
        },
      ),
    ]);
