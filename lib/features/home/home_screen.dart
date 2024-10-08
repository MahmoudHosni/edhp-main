import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/slide_panel/views/slide_panel.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/drawer/drawer_components.dart';
import 'package:edhp/features/home/cubit/MemberShipsResponse.dart';
import 'package:edhp/features/home/widgets/MemberShipCard.dart';
import 'package:edhp/features/home/widgets/MemberShipGoldCard.dart';
import 'package:edhp/features/home/widgets/SearchBarView.dart';
import 'package:edhp/features/layout/cubit/cubit.dart';
import 'package:edhp/features/layout/cubit/states.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:edhp/models/medical_network_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
 // Create a key
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit()..loadData(context),
      child: BlocConsumer<LayoutCubit, LayoutStates>(
          listener: (context, state) {
            if(state is OnGetAppVersion){
              print("state.newAppVersion >>> ${state.newAppVersion.trim()}");
              print("state.currentAppVersion >>> ${state.currentAppVersion.trim()}");
              if(state.newAppVersion.trim() !=state.currentAppVersion){
                showVersionDialog(context,state.newAppVersion);
              }
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              key: _key,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                iconTheme: const IconThemeData(color: AppColors.blackColor),
                elevation: 0,
                centerTitle: true,
                title: SvgPicture.asset(
                  AppPaths.logoPath,
                  width: 55,
                  height: 55,
                ),
                titleSpacing: 0,
                leading: IconButton(
                  onPressed: () {
                    _key.currentState?.openDrawer();
                  },
                  icon: SvgPicture.asset(AppPaths.drawerIconSvg),
                ),
                actions: [
                  IconButton(
                    onPressed: () { GoRouter.of(context).push(AppRouters.kCreatePaymentScreen,);  },
                    icon: SvgPicture.asset(AppPaths.notificationIconSvg),
                  ),
                ],
              ),
              body: SlidePanel(
                body: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 12, 20, 8),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SearchBarView(),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: CarouselSlider(
                                items: [
                                  for (String image
                                      in LayoutCubit.get(context).adsImage)
                                    Container(
                                        clipBehavior: Clip.antiAlias,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                4.5,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Image.network(
                                          image,
                                          fit: BoxFit.fill,
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent?
                                                  loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value: loadingProgress
                                                            .expectedTotalBytes !=
                                                        null
                                                    ? loadingProgress
                                                            .cumulativeBytesLoaded /
                                                        loadingProgress
                                                            .expectedTotalBytes!
                                                    : null,
                                              ),
                                            );
                                          },
                                        )),
                                ],
                                options: CarouselOptions(
                                  enlargeFactor: 0.22,
                                  viewportFraction: 0.85,
                                  enlargeCenterPage: true,
                                  enableInfiniteScroll: true,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                )),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                    child: Container(
                                      height: 140,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/ic_01.svg',
                                            ),
                                            const SizedBox(
                                              height: 14,
                                            ),
                                            Text(
                                              StringsManager.medicalEvents,
                                              style: Styles.textStyle12W500
                                                  .copyWith(
                                                      color: Color(0xffFEA6A7)),
                                            )
                                          ]),
                                    ),
                                    onTap: () {
                                      GoRouter.of(context)
                                          .push(AppRouters.kMedicalEvents);
                                    }),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: InkWell(
                                    child: Container(
                                      height: 140,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/ic_02.svg',
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              'العضويات',
                                              style: Styles.textStyle12W500
                                                  .copyWith(
                                                      color: Color(0xff9CA8FA)),
                                            )
                                          ]),
                                    ),
                                    onTap: () {
                                        var sbRequest = SubscriptionRequest();
                                        sbRequest.SubscriptionTypeID = -1;
                                        GoRouter.of(context).push(
                                            AppRouters.kServiceScreen,
                                            extra: sbRequest);
                                    }),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: InkWell(
                                  child: Container(
                                    height: 140,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/ic_03.svg',
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'نصائح',
                                            style: Styles.textStyle12W500
                                                .copyWith(
                                                    color: Color(0xff85E2C5)),
                                          )
                                        ]),
                                  ),
                                  onTap: () {
                                    GoRouter.of(context)
                                        .push(AppRouters.kMedicalAdvices);
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              Text(
                                StringsManager.medicalNetwork.tr(),
                                style: Styles.textStyle14W500,
                              ),
                              const Spacer(),
                              InkWell(
                                child: Text(
                                  StringsManager.showAll,
                                  style: Styles.textStyle11W500
                                      .copyWith(color: AppColors.secondNew),
                                ),
                                onTap: () {
                                  GoRouter.of(context)
                                      .push(AppRouters.kMedicalNetworkScreen);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                            height: 128,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: medicalNetworkList.length,
                                separatorBuilder: (_, __) => const SizedBox(
                                      width: 8,
                                    ),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width: 112,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    child: InkWell(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/icons/ico_${index + 1}.svg'),
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            Text(
                                              medicalNetworkList[index].title,
                                              style: Styles.textStyle12W500
                                                  .copyWith(
                                                      color:
                                                          AppColors.thirdNew),
                                            )
                                          ]),
                                      onTap: () => GoRouter.of(context).push(
                                          medicalNetworkList[index].router),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    )),
                slideHandlerWidth: 10,
                slidePanelHeight: 210,
                slidePanelWidth: 250,
                slideOffBodyTap: true,
                leftPanelVisible: true,
                rightPanelVisible: false,
                leftSlide:Container(
                  padding: const EdgeInsets.fromLTRB(0,0,7,0),height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.boxesColor,
                  ),child: ListView(padding: EdgeInsets.zero,shrinkWrap: false, children: [
                        for(MemberShipsResponse membership in memberShips)
                            getMembershipView(membership),
                    ]),
                ),

                rightSlide: const SizedBox(),
              ),
              drawer: Drawer(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        AppColors.secondNew,
                        AppColors.primaryNew
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DrawerAppHeader(
                        image: AppPaths.profileImage,
                        name: CacheHelper.getData(key: 'profile'),
                        // GetProfileCubit.get(context).userProfileModel!.profileName.toString(),
                        username: CacheHelper.getData(
                            key:
                                'name'), // GetProfileCubit.get(context).userProfileModel!.userName.toString(),
                      ),
                      const DrawerAppList(),
                      const DrawerAppFooter()
                    ],
                  ),
                ),
              ),
            );
          }
          ),
    );
  }

  getMembershipView(MemberShipsResponse membership) {
    print(membership.MembershipTypeName);
    return  Container(
        padding: const EdgeInsets.all(5),height: 170,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.boxesColor,
        ),child:InkWell(
          child: Center(
              child: (membership != null)
                  ? ((membership.MembershipTypeName=="Gold Member")? MemberShipGoldCard(memberShip: membership, scaler: 1.0, spaceTop: 28,spaceLeft: 1.2,):
                                                                     MemberShipCard(memberShip: membership,scaler: 1,spaceTop: 28,) )
                  : const SizedBox()),
          onTap: () {
            GoRouter.of(context).push(AppRouters.kMemberShipPreview,extra: membership);
          },
    ));
  }
}