import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'animated_hover_card.dart';
import 'fade_slide_in.dart';

class WhySection extends StatelessWidget {
  const WhySection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 640 && screenWidth < 1024;

    final principles = [
      _PrincipleData(
        icon: Icons.tune_rounded,
        title: 'Solutions Tailored to You',
        description:
            'No cookie-cutter templates or forced tech stacks. Every architectural decision is mapped directly to your operating model and scale needs.',
      ),
      _PrincipleData(
        icon: Icons.offline_bolt_rounded,
        title: 'Engineering With Purpose',
        description:
            'We prioritize business metrics over novelty. Clean code, stable dependencies, and scalable data models that your team can maintain.',
      ),
      _PrincipleData(
        icon: Icons.handshake_rounded,
        title: 'End-to-End Support',
        description:
            'We don\'t disappear after deployment. We support store reviews, infrastructure updates, telemetry alerting, and continuous roadmap iterations.',
      ),
      _PrincipleData(
        icon: Icons.forum_rounded,
        title: 'Transparent Communication',
        description:
            'Direct access to the engineers building your product. Weekly sprint demos, visible project backlogs, and straightforward status updates.',
      ),
      _PrincipleData(
        icon: Icons.dynamic_form_rounded,
        title: 'Flexible Engagement',
        description:
            'From targeted sprint bursts to ongoing technical advisory, our engagement models adapt to match your team\'s existing momentum.',
      ),
      _PrincipleData(
        icon: Icons.all_inclusive_rounded,
        title: 'Long-Term Thinking',
        description:
            'We write code that is easy to extend, thoroughly documented, and ready for your future in-house engineering team to inherit seamlessly.',
      ),
    ];

    return Container(
      width: double.infinity,
      color: AppColors.surface,
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
                        'WHY BYTESTACKED.',
                        style: AppTextStyles.labelCaps(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Practical Engineering.\nMeaningful Outcomes.',
                        style: AppTextStyles.headlineLg(color: AppColors.primary),
                      ),
                      const SizedBox(height: 12),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 600),
                        child: Text(
                          'We don\'t build software for the sake of complexity. We build dependable tools that generate immediate and sustained business value.',
                          style: AppTextStyles.bodyMd(color: AppColors.onSurfaceVariant),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),

                // 6 Principles Grid
                if (isDesktop)
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: FadeSlideIn(delay: const Duration(milliseconds: 100), child: _buildPrincipleCard(principles[0]))),
                          const SizedBox(width: 20),
                          Expanded(child: FadeSlideIn(delay: const Duration(milliseconds: 180), child: _buildPrincipleCard(principles[1]))),
                          const SizedBox(width: 20),
                          Expanded(child: FadeSlideIn(delay: const Duration(milliseconds: 260), child: _buildPrincipleCard(principles[2]))),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: FadeSlideIn(delay: const Duration(milliseconds: 150), child: _buildPrincipleCard(principles[3]))),
                          const SizedBox(width: 20),
                          Expanded(child: FadeSlideIn(delay: const Duration(milliseconds: 230), child: _buildPrincipleCard(principles[4]))),
                          const SizedBox(width: 20),
                          Expanded(child: FadeSlideIn(delay: const Duration(milliseconds: 310), child: _buildPrincipleCard(principles[5]))),
                        ],
                      ),
                    ],
                  )
                else if (isTablet)
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildPrincipleCard(principles[0])),
                          const SizedBox(width: 16),
                          Expanded(child: _buildPrincipleCard(principles[1])),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildPrincipleCard(principles[2])),
                          const SizedBox(width: 16),
                          Expanded(child: _buildPrincipleCard(principles[3])),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildPrincipleCard(principles[4])),
                          const SizedBox(width: 16),
                          Expanded(child: _buildPrincipleCard(principles[5])),
                        ],
                      ),
                    ],
                  )
                else
                  Column(
                    children: principles.map((p) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _buildPrincipleCard(p),
                    )).toList(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPrincipleCard(_PrincipleData data) {
    return AnimatedHoverCard(
      backgroundColor: AppColors.surfaceContainerLowest,
      liftOffset: -6.0,
      hoverBorderColor: AppColors.secondary.withValues(alpha: 0.35),
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(data.icon, size: 28, color: AppColors.secondary),
          const SizedBox(height: 16),
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
    );
  }
}

class _PrincipleData {
  final IconData icon;
  final String title;
  final String description;

  _PrincipleData({
    required this.icon,
    required this.title,
    required this.description,
  });
}
