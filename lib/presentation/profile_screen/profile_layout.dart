import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wst/generated/l10n.dart';
import 'package:wst/navigation/app_router.dart';
import 'package:wst/presentation/profile_screen/bloc/setting_cubit.dart';
import 'package:value_provider/value_provider.dart';

import '../../test2.dart';

class ProfileLayout extends StatefulWidget {
  const ProfileLayout({super.key});

  @override
  State<ProfileLayout> createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends State<ProfileLayout> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).profile),
      ),
      body: BlocConsumer<SettingCubit, SettingState>(
        listener: (context, state) {
          state.maybeWhen(
              logoutState: () =>
              {},
              orElse: () => {});
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        context.read<SettingCubit>().saveLocaleConfig('uk');
                        LocalizationProvider.of(context).value = const Locale('uk');
                      },
                      child: Text(S.current.ukraine),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        context.read<SettingCubit>().saveLocaleConfig('en');
                        LocalizationProvider.of(context).value = const Locale('en');
                      },
                      child: Text(S.current.english),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
