import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/work_experience.dart';
import '../../domain/entities/course.dart';
import '../../presentation/cubits/profile/profile_cubit.dart';
import '../../presentation/screens/login_screen.dart';
import '../../presentation/screens/register_screen.dart';
import '../../presentation/screens/home_tabs_screen.dart';
import '../../presentation/screens/work_experience_form_screen.dart';
import '../../presentation/screens/course_form_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeTabsScreen(),
      ),
      GoRoute(
        path: '/experience-form',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final experience = extra?['experience'] as WorkExperience?;
          final profileCubit = extra?['cubit'] as ProfileCubit;
          return BlocProvider.value(
            value: profileCubit,
            child: WorkExperienceFormScreen(experience: experience),
          );
        },
      ),
      GoRoute(
        path: '/course-form',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final course = extra?['course'] as Course?;
          final profileCubit = extra?['cubit'] as ProfileCubit;
          return BlocProvider.value(
            value: profileCubit,
            child: CourseFormScreen(course: course),
          );
        },
      ),
    ],
  );
}
