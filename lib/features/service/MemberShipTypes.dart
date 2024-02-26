import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/back_custom_app_bar.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/service/cubit/cubit.dart';
import 'package:edhp/features/service/cubit/states.dart';
import 'package:edhp/features/service/widgets/MemberShipTypeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MemberShipTypes extends StatefulWidget {
  const MemberShipTypes({
    super.key,
  });

  @override
  State<MemberShipTypes> createState() => _MemberShipTypesState();
}

class _MemberShipTypesState extends State<MemberShipTypes> {
  late OurProductCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = OurProductCubit.get(context);
    cubit.getMembershipType();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OurProductCubit, OurProductStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Spacer(),
                        Text(StringsManager.membershipCards,
                            style: Styles.textStyle20W500,
                            textAlign: TextAlign.center),
                        Spacer(),
                        BackCustomAppBar(),
                      ],
                    ),
                  ),
                  if (state is OurProductLoadingState)
                    const CircularProgressIndicator(
                        color: AppColors.primaryBlueColor),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => MemberShipTypeView(
                        price: cubit.membershipTypeList[index].price.toString(),
                        name: cubit.membershipTypeList[index].name.toString(),
                        description: cubit.membershipTypeList[index].description
                            .toString(),
                        id: cubit.membershipTypeList[index].iD ?? 0,
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 30,
                      ),
                      itemCount: cubit.membershipTypeList.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
