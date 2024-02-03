import 'package:blocpracticeapp/blocs/internet/internet_bloc.dart';
import 'package:blocpracticeapp/blocs/internet/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetConnectivityView extends StatefulWidget {
  const InternetConnectivityView({super.key});

  @override
  State<InternetConnectivityView> createState() =>
      _InternetConnectivityViewState();
}

class _InternetConnectivityViewState extends State<InternetConnectivityView> {
  @override
  Widget build(BuildContext context) {
    final InternetBloc internetBloc = InternetBloc();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text(
          "Internet Connectivity",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocConsumer<InternetBloc, InternetState>(
        bloc: internetBloc,
        builder: (context, state) {
          if (state is InternetConnectivityAvailableState) {
            return const Center(
              child: Text("Connected to internet"),
            );
          } else if (state is InternetConnectivityUnavailableState) {
            return const Center(
              child: Text("No internet"),
            );
          } else if (state is InternetConnectivityLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: Text("Internet Loading"),
            );
          }
        },
        listener: (context, state) {
          if (state is InternetConnectivityAvailableState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Connected to internet"),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is InternetConnectivityUnavailableState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("No internet"),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
      ),
    );
  }
}
