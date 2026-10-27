import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'animated_hover_card.dart';
import 'fade_slide_in.dart';

class ProcessSection extends StatelessWidget {
  const ProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 640 && screenWidth < 1024;

    final steps = [
      _StepData(
        number: '01',
        icon: Icons.search_rounded,
        title: 'Discover',
        description:
            'We analyze your business context, map user pain points, audit technical constraints, and define quantitative KPIs.',
        footer: 'Scope & Alignment',
      ),
      _StepData(
        number: '02',
        icon: Icons.architecture_rounded,
        title: 'Plan',
        description:
            'Architectural blueprints, schema models, high-fidelity interactive wireframes, and fixed-milestone sprint roadmaps.',
        footer: 'System Specifications',
      ),
      _StepData(
        number: '03',
        icon: Icons.code_rounded,
        title: 'Build',
        description:
            'Iterative 2-week engineering cycles with continuous staging environments, automated test coverage, and transparent code reviews.',
        footer: 'Agile Construction',
      ),
      _StepData(
        number: '04',
        icon: Icons.verified_rounded,
        title: 'Launch & Support',
        description:
            'Store submissions, cloud provisioning, live traffic verification, documentation handoff, and proactive post-launch telemetry.',
        footer: 'SLA & Iteration',
      ),
    ];

    return Container(
      width: double.infinity,
      color: AppColors.surfaceContainerLow,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1360),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 48.0 : 20.0,
              vertical: isDesktop ? 80.0 : 48.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                FadeSlideIn(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HOW WE WORK',
                        style: AppTextStyles.labelCaps(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'From Concept to Production\nin 4 Clear Stages.',
                        style: AppTextStyles.headlineLg(color: AppColors.primary),
                      ),
                      const SizedBox(height: 12),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 600),
                        child: Text(
                          'A disciplined, milestone-driven execution cycle where progress is transparent, measurable, and collaborative.',
                          style: AppTextStyles.bodyMd(color: AppColors.onSurfaceVariant),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),

                // 4 Horizontal Steps
                if (isDesktop)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(steps.length, (index) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: FadeSlideIn(
                            delay: Duration(milliseconds: 100 + (index * 80)),
                            child: _buildStepCard(steps[index]),
                          ),
                        ),
                      );
                    }),
                  )
                else if (isTablet)
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildStepCard(steps[0])),
                          const SizedBox(width: 16),
                          Expanded(child: _buildStepCard(steps[1])),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildStepCard(steps[2])),
                          const SizedBox(width: 16),
                          Expanded(child: _buildStepCard(steps[3])),
                        ],
                      ),
                    ],
                  )
                else
                  Column(
                    children: steps.map((s) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _buildStepCard(s),
                    )).toList(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepCard(_StepData data) {
    return AnimatedHoverCard(
      backgroundColor: AppColors.surfaceContainerLowest,
      liftOffset: -6.0,
      hoverBorderColor: AppColors.secondary.withValues(alpha: 0.4),
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.number,
                    style: AppTextStyles.headlineSm(
                      color: AppColors.secondary,
                    ).copyWith(fontWeight: FontWeight.w800, fontSize: 26),
                  ),
                  Icon(data.icon, size: 24, color: AppColors.onSurfaceVariant),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                data.title,
                style: AppTextStyles.headlineSm(color: AppColors.primary),
              ),
              const SizedBox(height: 10),
              Text(
                data.description,
                style: AppTextStyles.bodySm(color: AppColors.onSurfaceVariant),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            data.footer,
            style: AppTextStyles.labelCaps(color: AppColors.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}

class _StepData {
  final String number;
  final IconData icon;
  final String title;
  final String description;
  final String footer;

  _StepData({
    required this.number,
    required this.icon,
    required this.title,
    required this.description,
    required this.footer,
  });
}
