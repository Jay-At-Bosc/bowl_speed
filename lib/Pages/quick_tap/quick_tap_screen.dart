import 'package:bowl_speed/imports_manager.dart';
import 'dart:developer';

class QuickTapScreen extends StatelessWidget {
  const QuickTapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: Labels.quickTap,
        isHistoryBtnVisible: true,
        onHistory: QuickTapController.instance.getHistory,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.blueColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomLabelText(
                            label: Labels.selectGameType,
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          CustomLabelText(
                            label: Labels.cricket,
                            style: GoogleFonts.rubik(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CustomLabelText(
                                label: "${Labels.bowlerName} :",
                                style: GoogleFonts.rubik(
                                    fontSize: 12,
                                    color: AppColors.textDarkColor
                                        .withOpacity(0.7),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Flexible(
                              child: GetBuilder<BowlerController>(
                                id: 'bowler',
                                builder: (ct) {
                                  return DropdownButtonFormField<String>(
                                    hint: const Text('Select Bowler'),
                                    style: GoogleFonts.rubik(
                                        color: AppColors.textDarkColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                    decoration: const InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 0.0, vertical: 0.0),
                                      border: InputBorder.none,
                                    ),
                                    // value: ct.bowlerList.isNotEmpty
                                    //     ? ct.bowlerList[0].name
                                    //     : "",
                                    onChanged: (String? newValue) {
                                      QuickTapController.instance
                                          .selectBowler(newValue!);
                                    },
                                    items: <DropdownMenuItem<String>>[
                                      const DropdownMenuItem<String>(
                                        value:
                                            "", // Use null for the default option
                                        child: Text('Select Bowler'),
                                      ),
                                      ...ct.bowlerList
                                          .map<DropdownMenuItem<String>>(
                                              (BowlerDetails value) {
                                        return DropdownMenuItem<String>(
                                          value: value.name,
                                          child: Text(
                                            value.name,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            maxLines: 1,
                                          ),
                                        );
                                      }),
                                    ],
                                    validator: (value) => value == null
                                        ? 'Please select an option'
                                        : null,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomLabelText(
                              label: "${Labels.pitchSize} :",
                              style: GoogleFonts.rubik(
                                  fontSize: 12,
                                  color:
                                      AppColors.textDarkColor.withOpacity(0.7),
                                  fontWeight: FontWeight.w500),
                            ),
                            GetBuilder<QuickTapController>(
                              id: QuickTapController.durationId,
                              builder: (ctx) => Flexible(
                                child: CustomLabelText(
                                  label: "${ctx.distance} ${Labels.meter}",
                                  style: GoogleFonts.rubik(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                QuickTapController.instance.changeDistance();
                              },
                              child: const Icon(
                                Iconsax.edit_2,
                                size: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0, top: 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: Get.width * 0.29),
                              child: CustomLabelText(
                                label: "${Labels.speed} :",
                                style: GoogleFonts.rubik(
                                    fontSize: 12,
                                    color: AppColors.textDarkColor
                                        .withOpacity(0.7),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            GetBuilder<QuickTapController>(
                                id: QuickTapController.speedId,
                                builder: (ct) {
                                  return Flexible(
                                    child: CustomLabelText(
                                      label: ct.speed,
                                      style: GoogleFonts.rubik(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0)
                            .copyWith(bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: Get.width * 0.32),
                              child: CustomLabelText(
                                label: "${Labels.time} :",
                                style: GoogleFonts.rubik(
                                    fontSize: 12,
                                    color: AppColors.textDarkColor
                                        .withOpacity(0.7),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            GetBuilder<QuickTapController>(
                              id: QuickTapController.durationId,
                              builder: (controller) => Flexible(
                                child: CustomLabelText(
                                  label: controller.formattedTime,
                                  style: GoogleFonts.rubik(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Clock
              GetBuilder<QuickTapController>(
                  id: QuickTapController.timerId,
                  builder: (ctx) {
                    return Column(
                      children: [
                        CircularCountDownTimer(
                          duration: 60,
                          initialDuration: 0,
                          controller: ctx.countDownController,
                          width: Get.width / 1.7,
                          height: Get.height / 2.4,
                          ringColor: Colors.grey[300]!,
                          ringGradient: null,
                          fillColor: AppColors.containerColor,
                          fillGradient: null,
                          backgroundColor:
                              AppColors.orangeColor.withOpacity(0.8),
                          backgroundGradient: null,
                          strokeWidth: 20.0,
                          strokeCap: StrokeCap.butt,
                          textStyle: const TextStyle(
                              fontSize: 33.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textFormat: CountdownTextFormat.S,
                          isReverse: false,
                          isReverseAnimation: false,
                          isTimerTextShown: true,
                          autoStart: false,
                          onStart: () {
                            log("started");
                          },
                          onComplete: () {
                            log("Completed");
                          },
                          onChange: (String timeStamp) {
                            log('Countdown Changed $timeStamp');
                            // controller.updateTime(duration);
                          },
                          timeFormatterFunction:
                              (defaultFormatterFunction, duration) {
                            if (duration.inSeconds == 0) {
                              return duration.inSeconds;
                            } else {
                              // controller.updateTime(duration);

                              return Function.apply(
                                  defaultFormatterFunction, [duration]);
                            }
                          },
                        ),
                        GetBuilder<QuickTapController>(
                            id: "bowler",
                            builder: (ctx) {
                              return GetBuilder<BowlerController>(
                                  id: "bowler",
                                  builder: (ct) {
                                    return SizedBox(
                                      width: Get.width * 0.4,
                                      height: Get.width * 0.13,
                                      child: ElevatedButton(
                                        onPressed: ct.bowlerList.isEmpty ||
                                                ctx.selectedBowler.isEmpty
                                            ? () {
                                                Get.defaultDialog(
                                                    title: "Oops!!",
                                                    middleText:
                                                        "Please Add Bolwers First Or Select From Existing One!!",
                                                    confirm: ElevatedButton(
                                                      onPressed: () {
                                                        AppPages.back;
                                                        Get.toNamed(Routes
                                                            .addBowlerDetails);
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            AppColors
                                                                .orangeColor
                                                                .withOpacity(
                                                                    0.9),
                                                        foregroundColor:
                                                            AppColors
                                                                .textWhiteColor,
                                                      ),
                                                      child: Text(
                                                        Labels.addBowler,
                                                        style:
                                                            GoogleFonts.rubik(
                                                                fontSize: 16),
                                                      ),
                                                    ));
                                              }
                                            : ctx.isTimerOn
                                                ? ctx.stopTimer
                                                : ctx.startTimer,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.orangeColor
                                              .withOpacity(0.9),
                                          foregroundColor:
                                              AppColors.textWhiteColor,
                                        ),
                                        child: Text(
                                          ctx.isTimerOn == true
                                              ? Labels.finish
                                              : Labels.start,
                                          style:
                                              GoogleFonts.rubik(fontSize: 16),
                                        ),
                                      ),
                                    );
                                  });
                            }),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
