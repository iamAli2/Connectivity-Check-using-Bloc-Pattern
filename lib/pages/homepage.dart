import 'package:firstbloc/Bloc/InternetBloc/Internet_bloc.dart';
import 'package:firstbloc/Bloc/InternetBloc/Iterrnet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: ((context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Connected".text.make(),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Not Connected".text.green400.make(),
                backgroundColor: Colors.red,
              ));
            } else {
              return null;
            }
          }),
          builder: (context, state) {
            if (state is InternetGainedState) {
              return "Connected".text.xl3.makeCentered();
            } else if (state is InternetLostState) {
              return "Not Connected".text.xl3.makeCentered();
            } else {
              return "Loading ....".text.xl3.makeCentered();
            }
          },
        ),
      ),
    );
  }
}
