import 'package:ayurvedic_center/core/constants/app_colors.dart';
import 'package:ayurvedic_center/core/constants/assets_helper.dart';
import 'package:ayurvedic_center/core/utils/device.dart';
import 'package:ayurvedic_center/core/utils/extentions.dart';
import 'package:ayurvedic_center/features/home/data/models/patient_model.dart';
import 'package:ayurvedic_center/features/home/presentation/pages/home_screen.dart';
import 'package:ayurvedic_center/features/home/presentation/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PatientsList extends HomeScreen {
  const PatientsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<HomeProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(color: AppColors.appGreen),
              ),
            );
          }

          if (provider.patientList.isEmpty) {
            return Center(
              child: Image.asset(
                AssetsHelper.empty,
                width: Device.width(context) * 0.2,
              ),
            );
          }
          return RefreshIndicator(
            color: AppColors.appGreen,
            onRefresh: () async {
              await provider.getPatientsList();
            },
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: Device.horizontalPadding,
                vertical: 12,
              ),
              itemBuilder: (context, index) {
                Patient patient = provider.patientList[index];
                return patientTile(patient, index);
              },
              separatorBuilder: (context, index) => 15.hBox,
              itemCount: provider.patientList.length,
            ),
          );
        },
      ),
    );
  }

  Widget patientTile(Patient patient, int index) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.fieldColor,
        borderRadius: BorderRadius.circular(8.25),
      ),
      child: Column(
        children: [
          topPart(patient, index),
          Divider(color: Colors.black.withValues(alpha: 0.2), height: 5),
          bottomPart(),
        ],
      ),
    );
  }

  Widget topPart(Patient patient, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${index + 1}.",
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          10.wBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  patient.name!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                5.hBox,
                Text(
                  patient.patientDetailsSet?[0].treatmentName ?? "",
                  style: const TextStyle(
                    color: AppColors.appGreen,
                    fontSize: 13,
                  ),
                ),
                12.hBox,
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      size: 15,
                      color: AppColors.appRed,
                    ),
                    3.wBox,
                    Text(
                      DateFormat(
                        'dd/MM/yyyy',
                      ).format(patient.dateNdTime ?? patient.createdAt!),
                      style: TextStyle(
                        color: Colors.black.withValues(alpha: 0.5),
                        fontSize: 13,
                        height: 0.5,
                      ),
                    ),
                    15.wBox,
                    const Icon(
                      Icons.people_outline,
                      size: 15,
                      color: AppColors.appRed,
                    ),
                    Expanded(
                      child: Text(
                        "Jithesh",
                        style: TextStyle(
                          color: Colors.black.withValues(alpha: 0.5),
                          fontSize: 13,
                          height: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomPart() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: const Padding(
        padding: EdgeInsets.only(left: 35, right: 15, top: 8, bottom: 10),
        child: Row(
          children: [
            Expanded(child: Text("View booking details")),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.appGreen,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
