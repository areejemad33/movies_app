import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/widgets/app_button.dart';
import 'package:movies_app/features/profile/presentation/widgets/delete_account_button.dart';
import 'package:movies_app/features/profile/avatar_cubit.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/routes/routes_manager.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController;
    final TextEditingController nameController;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text('Pick Avatar', style: Theme
              .of(context)
              .textTheme
              .titleMedium)),
          body: Padding(
            padding: REdgeInsets.symmetric(vertical: 33.56.h, horizontal: 16.w),
            child: Column(
                children: [
                  InkWell(
                      onTap: () => buildAvatarSelector(context),
                      child: Image.asset(AssetsManager.avatar2,)),
                  SizedBox(height: 35.h),
                  AppTextFormField(
                    controller:
                    nameController = TextEditingController(text: 'John Safwat'),
                    prefixIcon: Image.asset(AssetsManager.profileIcon),
                    hintText: '',
                  ),
                  SizedBox(height: 19.28.h),
                  AppTextFormField(
                    controller: phoneController =
                        TextEditingController(text: '01200000000'),
                    hintText: '',
                    prefixIcon: Image.asset(AssetsManager.phoneIcon),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 30.28.h,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RoutesManager.resetPassword);
                        }
                        ,
                        child: Text('Reset Password', style: GoogleFonts.roboto(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorsManager.white,
                        ),)),
                  ),
                  Spacer(),
                  DeleteAccountButton(text: 'Delete Account', onPressed: () {}),
                  SizedBox(height: 19.h),
                  AppButton(text: 'Update Data', onPressed: () {}),
                ]
            ),
          )
      ),
    );
  }
void buildAvatarSelector(BuildContext context) {
    String? selectedAvatar;
    showModalBottomSheet(context: context, builder: (context) {
      return BlocProvider(
        create: (context) => AvatarCubit(),
        child:  BlocBuilder<AvatarCubit, String?>(
          builder: (context, selectedAvatar){
          return Container(
            decoration: BoxDecoration(
                color: ColorsManager.black28,
                borderRadius: BorderRadius.circular(24)
            ),
             child: Padding(
               padding:  REdgeInsets.all(19),
               child: GridView.builder(
           shrinkWrap: true,
           itemCount: AssetsManager.avatars.length,
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 3,
             crossAxisSpacing: 12,
             mainAxisSpacing: 12,
           ),
           itemBuilder: (context, index) {
             final bool isSelected = selectedAvatar == AssetsManager.avatars[index];
             return InkWell(
               onTap: (){
                 context.read<AvatarCubit>().selectAvatar(AssetsManager.avatars[index]);
               },
               child: Container(
                 decoration: BoxDecoration(
                   border: Border.all(
               color: ColorsManager.yellow,
                     width: 1,
                   ),
                   borderRadius: BorderRadius.circular(20),
          
                   color: isSelected ? ColorsManager.yellow.withOpacity(.56) : ColorsManager.black28,
                 ),
                 child: Image.asset(
                   AssetsManager.avatars[index],
                 ),
               ),
             );
           },
               ),
             ),
          );
          },
        ),
      );
    },
    );
}}



