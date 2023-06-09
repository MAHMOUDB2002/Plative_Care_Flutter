import 'package:final_project/app/modules/home/views/register_view.dart';
import 'package:final_project/app/modules/patients/controllers/register_patients_controller.dart';
import 'package:final_project/common_widget/custom_buttom.dart';
import 'package:final_project/common_widget/custom_size_box.dart';
import 'package:final_project/common_widget/custom_text.dart';
import 'package:final_project/common_widget/custom_text_buttom.dart';
import 'package:final_project/common_widget/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPatientsView extends GetView<RegisterPatientsController> {
  RegisterPatientsView({Key? key}) : super(key: key);
  var email = TextEditingController();
  var password = TextEditingController();
  var name = TextEditingController();
  var phone = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomText(
                        Colors.black, 30, FontWeight.w600, "  انشاء حساب مريض"),
                    CustomSizeBox(
                      50,
                    ),
                    CustomTextForm(name, " الاسم كامل", TextInputType.name,
                        validator: (name) {
                      if (name!.isEmpty) {
                        return "اسمك لا يجب ان  يكون فارغ";
                      }
                    }),
                    CustomSizeBox(
                      25,
                    ),
                    CustomTextForm(email, "  البريد الالكتروني",
                        TextInputType.emailAddress, validator: (email) {
                      if (email!.isEmpty) {
                        return "بريد الالكتروني  لا يجب ان  يكون فارغ";
                      }
                    }),
                    CustomSizeBox(
                      25,
                    ),
                    CustomTextForm(phone, "  رقم الهاتف", TextInputType.phone,
                        validator: (phoneNumber) {
                      if (phoneNumber!.isEmpty) {
                        return "رقم الهاتف لا يجب ان  يكون فارغ";
                      }
                    }),
                    CustomSizeBox(
                      25,
                    ),
                    CustomTextForm(
                        password, " كلمة المرور", TextInputType.visiblePassword,
                        validator: (password) {
                      if (password!.isEmpty) {
                        return " كلمة المرور لا يجب ان  يكون فارغ";
                      }
                    }),
                    CustomSizeBox(
                      50,
                    ),
                    CustomButtom(() {
                      if (formKey.currentState!.validate()) {
                        controller.register(
                            email.text, password.text, name.text, phone.text);
                      }
                    }, Colors.green, 50, double.infinity, 10, Colors.white,
                        "الاستمرار", 15),
                    CustomSizeBox(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextButtom(
                          () {
                            loginController.moveBetweenPages('patients');
                          },
                          "تسجبل الدخول",
                          Colors.green,
                          12,
                          FontWeight.w600,
                        ),
                        CustomText(
                            Colors.black, 12, FontWeight.w600, "هل لديك حساب؟"),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
