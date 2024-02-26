import 'package:carousel_slider/carousel_slider.dart';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/slide_panel/views/slide_panel.dart';
import 'package:edhp/core/utils/app_components/widgets/ShowToast.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/drawer/drawer_components.dart';
import 'package:edhp/features/home/widgets/MemberShipCard.dart';
import 'package:edhp/features/home/widgets/SearchBarView.dart';
import 'package:edhp/features/layout/cubit/cubit.dart';
import 'package:edhp/features/layout/cubit/states.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit()..loadData(context),
      child: BlocConsumer<LayoutCubit, LayoutStates>(
          listener: (context, state) {           },
          builder: (context, state) {
            // if(state is GetProfileSuccessfullyState || state is GetProfileImageSuccessfullyState || state is ChangeAdsImage ) {
              return Scaffold(backgroundColor: Colors.transparent,key: _key,
                              appBar: AppBar(backgroundColor: Colors.transparent,
                                iconTheme: const IconThemeData(color: AppColors.blackColor),
                                elevation: 0,
                                centerTitle: true,
                                title: SvgPicture.asset(AppPaths.logoPath , width: 55,height: 55,),titleSpacing: 0,
                                leading: IconButton(
                                  onPressed: (){

                                  },
                                  icon: SvgPicture.asset(AppPaths.notificationIconSvg),
                                ),
                                actions: [
                                  IconButton(onPressed: (){
                                            _key.currentState?.openEndDrawer();
                                            },
                                            icon: SvgPicture.asset(AppPaths.drawerIconSvg),
                                          ),
                                ],
                              ),
                              body:  SlidePanel(
                                body: Padding(padding: const EdgeInsets.fromLTRB(16.0,12,16,8),child:SingleChildScrollView(child: Column(
                                  children: [
                                    SearchBarView(),

                                    const SizedBox(
                                      height: 35,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height / 4.5,
                                      child:
                                           CarouselSlider(
                                                  items: [
                                                    for(String image in LayoutCubit.get(context).adsImage)
                                                      Container(
                                                          clipBehavior: Clip.antiAlias,
                                                          width: MediaQuery.of(context).size.width,
                                                          height: MediaQuery.of(context).size.height / 4.5,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(10.0),
                                                          ),
                                                          child: Image.network(image,
                                                                  fit: BoxFit.fill,
                                                                  loadingBuilder: (BuildContext context, Widget child,
                                                                      ImageChunkEvent? loadingProgress) {
                                                                    if (loadingProgress == null) return child;
                                                                    return Center(
                                                                      child: CircularProgressIndicator(
                                                                        value: loadingProgress.expectedTotalBytes != null
                                                                            ? loadingProgress.cumulativeBytesLoaded /
                                                                            loadingProgress.expectedTotalBytes!
                                                                            : null,
                                                                      ),
                                                                    );
                                                                  },
                                                                )),
                                                  ],
                                                  options: CarouselOptions(
                                                    height: 450,
                                                    aspectRatio: 18/9,
                                                    viewportFraction: 0.9,
                                                    initialPage: 0,
                                                    enableInfiniteScroll: true,
                                                    reverse: false,
                                                    autoPlay: true,
                                                    autoPlayInterval: const Duration(seconds: 3),
                                                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                                                    autoPlayCurve: Curves.fastOutSlowIn,
                                                    enlargeCenterPage: true,
                                                    enlargeFactor: 0.6,
                                                    scrollDirection: Axis.horizontal,
                                                  )
                                              ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(child: Container(margin: EdgeInsets.all(8),width: 90,height: 140,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(12))),
                                          child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                                            SvgPicture.asset('assets/icons/ic_01.svg',width: 70,),
                                            SizedBox(height: 20,),
                                            Text(StringsManager.medicalEvents,style: Styles.textStyle12W500.copyWith(color: Color(0xffFEA6A7)),)
                                          ]),),onTap: (){
                                                GoRouter.of(context).push(AppRouters.kMedicalEvents);
                                        }),

                                        InkWell(child: Container(margin: EdgeInsets.all(8),width: 90,height: 140,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(12))),
                                          child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                                            SvgPicture.asset('assets/icons/ic_02.svg',width: 70,),
                                            SizedBox(height: 20,),
                                            Text('العضويات',style: Styles.textStyle12W500.copyWith(color: Color(0xff9CA8FA)),)
                                          ]),),onTap: (){
                                                if(memberShips!=null && memberShips.length>0){
                                                    ShowToast.showToastGreen('انت بالفعل مشترك فى باقة');
                                                }else {
                                                  GoRouter.of(context).push(
                                                      AppRouters.kServiceScreen,
                                                      extra: SubscriptionRequest());
                                                }
                                        }),


                                        InkWell(child: Container(margin: EdgeInsets.all(8),width: 90,height: 140,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(12))),
                                          child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                                            SvgPicture.asset('assets/icons/ic_03.svg',width: 70,),
                                            SizedBox(height: 20,),
                                            Text('نصائح',style: Styles.textStyle12W500.copyWith(color: Color(0xff85E2C5)),)
                                          ]),),onTap: () {
                                          GoRouter.of(context).push(AppRouters.kMedicalAdvices);
                                        },),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(child:Text(StringsManager.showAll , style: Styles.textStyle11W500.copyWith(color: AppColors.secondNew),),
                                        onTap: () {
                                          GoRouter.of(context).push(AppRouters.kMedicalNetworkView);
                                        },),
                                        const Spacer(),
                                        const Text(StringsManager.healthNetwork , style: Styles.textStyle14W500,),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    SizedBox(height: 150,
                                      child: ListView.builder(scrollDirection: Axis.horizontal,reverse: true,itemCount: HealthyNetwork.length,itemBuilder: (BuildContext context, int index) {
                                              return Container(margin: EdgeInsets.all(8),width: 100,height: 150,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(12))),
                                                      child: InkWell(child:Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                        SvgPicture.asset('assets/icons/ico_${index+1}.svg'),
                                                        SizedBox(height: 25,),
                                                        Text(HealthyNetwork.elementAt(index),style: Styles.textStyle12W500.copyWith(color: AppColors.thirdNew),)
                                                      ]),onTap: () {
                                                        openUrl(HealthyNetworkLinks.elementAt(index));
                                                      }),);
                                      }),
                                    ),
                                    const SizedBox(height: 8,)
                                  ],
                                ),
                              )),slideHandlerWidth: 7,
                                  slidePanelHeight: 170,
                                  slidePanelWidth: 250,
                                  slideOffBodyTap: true,
                                  leftPanelVisible: true,
                                  rightPanelVisible: false, leftSlide: Container(padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.boxesColor,),
                                      child: InkWell(child: Center(child:
                                      (memberShips!=null && memberShips.length>0)?
                                            MemberShipCard(memberShip: memberShips[0],scaler: 1,spaceTop: 28,)
                                          : SizedBox()),
                                                    onTap: () {
                                                      GoRouter.of(context).push(AppRouters.kMemberShipPreview);
                                                    },
                                ),), rightSlide: SizedBox(),),
                              endDrawer: Drawer(
                                child: Container(decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: <Color>[
                                                AppColors.secondNew,
                                                AppColors.primaryNew
                                              ],
                                            ),
                                          ),
                                          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                      DrawerAppHeader(
                                                        image: AppPaths.profileImage,
                                                        name: CacheHelper.getData(key: 'profile'),// GetProfileCubit.get(context).userProfileModel!.profileName.toString(),
                                                        username: CacheHelper.getData(key: 'name'),// GetProfileCubit.get(context).userProfileModel!.userName.toString(),
                                                      ),
                                                      const DrawerAppList(),
                                                      const DrawerAppFooter()
                                                    ],
                ),
                                ),
              ),
            );
            }
            // else {
            //   return const Scaffold(
            //     body: Center(
            //       child: CircularProgressIndicator(color: AppColors.primaryBlueColor,),
            //     ),
            //   );
            // }
          // },
        ),
    );
  }
}