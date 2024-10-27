import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //final arguments = settings.arguments;

    switch (settings.name) {
      // case AppRoutesNames.login:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<LoginCubit>(),
      //       child: const LogInScreen(),
      //     ),
      //   );
      //
      // case AppRoutesNames.welcomePage:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<LoginCubit>(),
      //       child: const WelcomeScreen(),
      //     ),
      //   );
      //
      // case AppRoutesNames.forgetPasswordByEmail:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<ForgetPasswordByEmailCubit>(),
      //       child: const ForgetPasswordByEmailScreen(),
      //     ),
      //   );
      //
      // case AppRoutesNames.forgetPasswordByPhone:
      //   return MaterialPageRoute(
      //     builder: (_) => const ForgetPasswordByPhoneScreen(),
      //   );
      //
      // case AppRoutesNames.home:
      //     return MaterialPageRoute(
      //       builder: (_) => const HomeScreen(),
      //     );
      //
      // case AppRoutesNames.otp:
      //   return MaterialPageRoute(
      //     builder: (_) => const OtpScreen(),
      //   );
      //
      // case AppRoutesNames.newPassword:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<NewPasswordCubit>(),
      //       child: const NewPasswordScreen(),
      //     ),
      //   );
      //
      // case AppRoutesNames.absentsStudents:
      //   return MaterialPageRoute(
      //     builder: (_) => const AbsenceStudentPerClassScreen(),
      //   );
      //
      // case AppRoutesNames.generalAbsentsStudents:
      //   return MaterialPageRoute(
      //     builder: (_) => const GeneralAbsenceStudentScreen(),
      //   );
      //
      // case AppRoutesNames.studentsSheet:
      //   return MaterialPageRoute(
      //     builder: (_) => const AbsenceStudentsSheetScreen(),
      //   );
      //
      // case AppRoutesNames.teachersSheet:
      //   return MaterialPageRoute(
      //     builder: (_) => const AbsenceTeachersSheetScreen(),
      //   );
      //
      // case AppRoutesNames.absenceTeacher:
      //   return MaterialPageRoute(
      //     builder: (_) => const AbsenceTeacherScreen(),
      //   );
      //
      // case AppRoutesNames.classesVisits:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<ClassesVisitsCubit>()..emitAllClassVisitsStates(),
      //       child: const ClassesVisitsScreen(),
      //       ),
      //   );
      //
      // case AppRoutesNames.visitedTeacher:
      //   if(arguments is VisitedTeacherArguments){
      //     return MaterialPageRoute(
      //       builder: (_) => VisitedTeacherScreen(
      //         teacherName: arguments.teacherName,
      //         visitDate: arguments.visitDate,
      //
      //       ),
      //     );
      //   }
      //   return null;
      // case AppRoutesNames.visitedTeacherFinish:
      //   return MaterialPageRoute(
      //     builder: (_) => const VisitedTeacherFinishScreen(),
      //   );
      //
      // case AppRoutesNames.lateMangerReport:
      //   return MaterialPageRoute(
      //     builder: (_) => const LateMangerReportScreen(),
      //   );
      //
      // case AppRoutesNames.lateTeacherReport:
      //   return MaterialPageRoute(
      //     builder: (_) => const LateTeacherReport(),
      //   );
      //
      // case AppRoutesNames.lateStudent:
      //   return MaterialPageRoute(
      //     builder: (_) => const LateStudentDetailsScreen(),
      //   );
      //
      // case AppRoutesNames.lateStudentGeneralSearch:
      //   return MaterialPageRoute(
      //     builder: (_) => const LateStudentGeneralSearchScreen(),
      //   );
      //
      // case AppRoutesNames.lateTeacherSheet:
      //   return MaterialPageRoute(
      //     builder: (_) => const LateTeacherSheetScreen(),
      //   );
      //
      // case AppRoutesNames.chooseSchool:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<UserSchoolsCubit>()..emitUserSchoolStates(),
      //       child: const ChooseSchoolScreen(),
      //     ),
      //   );
      //
      // case AppRoutesNames.notification:
      //   return MaterialPageRoute(
      //     builder: (_) => const NotificationScreen(),
      //   );
      //
      // case AppRoutesNames.endedVisits:
      //   return MaterialPageRoute(
      //     builder: (_) => const EndedVisits(),
      //   );
      //
      // case AppRoutesNames.termsAndConditions:
      //   return MaterialPageRoute(
      //     builder: (_) => const TermsAndConditions(),
      //   );
      //
      // case AppRoutesNames.privacyPolicy:
      //   return MaterialPageRoute(
      //     builder: (_) => const PrivacyPolicyScreen(),
      //   );

      default:
        return null;
    }
  }
}
