import 'package:clean_arhitecture/core/utils/logger_settigns.dart';
import 'package:clean_arhitecture/presentation/common/state_renderer/state_render_impl.dart';
import 'package:clean_arhitecture/presentation/cubit/user_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    getUsers();
    super.initState();
  }

  void getUsers() {
    context.read<UserCubit>().getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, FlowState>(listener: (context, state) {
      if (state is UserLoadingState) {
        logger.i("LOADİNG");
      } else if (state is UserLoadedState) {
        logger.i("LOADED");
      } else if (state is UserErrorState) {
        logger.i("LOADED");
      }
      print("XXX STATE:" + state.toString());
    }, builder: (context, state) {
      return Scaffold(
        body: state.getScreenWidget(context, _getContent(context, state), () {
          context.read<UserCubit>().getUsers();
        }),
      );
    });
  }
}

Widget _getContent(BuildContext context, FlowState state) {
  if (state is ContentState) {
    logger.i("ALOO");
    logger.i(state.data);

    return ListView.builder(
        itemBuilder: (context, index) {
          if (state is ContentState) {
            final user = state.data[index];
            return ListTile(
              leading: Image.network(user.avatar.toString()),
              title: Text(user.name.toString()),
              subtitle: Text(user.createdAt!.substring(10).toString()),
            );
          }
        },
        itemCount: state is ContentState ? state.data.length : 0);
  }
  return Container();
}

/*
return Scaffold(
        body: state is UserLoadingState
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) {
                  if (state is ContentState) {
                    final user = state.data[index];
                    return ListTile(
                      leading: Image.network(user.avatar.toString()),
                      title: Text(user.name.toString()),
                      subtitle: Text(user.createdAt!.substring(10).toString()),
                    );
                  }
                },
                itemCount: state is ContentState ? state.data.length : 0),
      );
 */
