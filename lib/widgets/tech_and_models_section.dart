import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'animated_hover_card.dart';
import 'fade_slide_in.dart';

class TechAndModelsSection extends StatelessWidget {
  final Function(String section) onSelectModel;

  const TechAndModelsSection({super.key, required this.onSelectModel});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;

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
              children: [
                // Top: Tech Standards
                FadeSlideIn(
                  child: Column(
                    children: [
                      Text(
                        'TECHNOLOGY STANDARDS',
                        style: AppTextStyles.labelCaps(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Built on Modern, Resilient Foundational Stacks',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.headlineMd(color: AppColors.primary),
                      ),
                      const SizedBox(height: 24),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 900),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 10,
                          runSpacing: 10,
                          children: const [
                            _InteractiveTechPill(text: 'Flutter & Dart', hasDot: true),
                            _InteractiveTechPill(text: 'Riverpod / BLoC'),
                            _InteractiveTechPill(text: 'TypeScript & Next.js'),
                            _InteractiveTechPill(text: 'PostgreSQL / Supabase'),
                            _InteractiveTechPill(text: 'Firebase Realtime'),
                            _InteractiveTechPill(text: 'OpenAI / Claude LLM APIs'),
                            _InteractiveTechPill(text: 'Docker & Kubernetes'),
                            _InteractiveTechPill(text: 'AWS / Google Cloud'),
                            _InteractiveTechPill(text: 'Fastlane CI/CD'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 64),

                // 3 Engagement Models
                if (isDesktop)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: FadeSlideIn(delay: const Duration(milliseconds: 100), child: _buildModel1())),
                      const SizedBox(width: 20),
                      Expanded(child: FadeSlideIn(delay: const Duration(milliseconds: 200), child: _buildModel2())),
                      const SizedBox(width: 20),
                      Expanded(child: FadeSlideIn(delay: const Duration(milliseconds: 300), child: _buildModel3())),
                    ],
                  )
                else
                  Column(
                    children: [
                      _buildModel1(),
                      const SizedBox(height: 20),
                      _buildModel2(),
                      const SizedBox(height: 20),
                      _buildModel3(),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildModel1() {
    return AnimatedHoverCard(
      backgroundColor: AppColors.surfaceContainerLowest,
      liftOffset: -6.0,
      hoverBorderColor: AppColors.secondary.withValues(alpha: 0.35),
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
                    'MODEL 01',
                    style: AppTextStyles.labelCaps(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Icon(Icons.rocket_launch_rounded, size: 22, color: AppColors.primary),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'New Product Development',
                style: AppTextStyles.headlineSm(color: AppColors.primary),
              ),
              const SizedBox(height: 10),
              Text(
                'Full lifecycle build from scoping and architecture to production store deployment. Best for brand new MVPs and startup launches.',
                style: AppTextStyles.bodySm(color: AppColors.onSurfaceVariant),
              ),
              const SizedBox(height: 20),
              _buildCheckItem('Fixed scope & timeline milestones', false),
              _buildCheckItem('Dedicated engineering squad', false),
              _buildCheckItem('Complete code ownership', false),
            ],
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => onSelectModel('contact'),
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.surfaceContainer,
                foregroundColor: AppColors.primary,
                side: BorderSide.none,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text(
                'Select New Build',
                style: AppTextStyles.labelMd(color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModel2() {
    return AnimatedHoverCard(
      backgroundColor: AppColors.primary,
      liftOffset: -8.0,
      hoverBorderColor: AppColors.secondary,
      normalShadows: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.15),
          blurRadius: 20,
          offset: const Offset(0, 8),
        ),
      ],
      hoverShadows: [
        BoxShadow(
          color: AppColors.secondary.withValues(alpha: 0.35),
          blurRadius: 32,
          offset: const Offset(0, 14),
        ),
      ],
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
                    'MODEL 02',
                    style: AppTextStyles.labelCaps(
                      color: AppColors.secondaryFixed,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'POPULAR',
                      style: AppTextStyles.labelCaps(
                        color: AppColors.onSecondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Product Enhancement',
                style: AppTextStyles.headlineSm(color: AppColors.onPrimary),
              ),
              const SizedBox(height: 10),
              Text(
                'Targeted sprint bursts to implement complex features, refactor performance bottlenecks, or integrate modern AI capabilities.',
                style: AppTextStyles.bodySm(color: AppColors.primaryFixedDim),
              ),
              const SizedBox(height: 20),
              _buildCheckItem('Flexible bi-weekly sprints', true),
              _buildCheckItem('Performance & jank audits', true),
              _buildCheckItem('Rapid onboarding to existing code', true),
            ],
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => onSelectModel('contact'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                foregroundColor: AppColors.onSecondary,
                elevation: 2,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text(
                'Start Sprint Burst',
                style: AppTextStyles.labelMd(color: AppColors.onSecondary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModel3() {
    return AnimatedHoverCard(
      backgroundColor: AppColors.surfaceContainerLowest,
      liftOffset: -6.0,
      hoverBorderColor: AppColors.secondary.withValues(alpha: 0.35),
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
                    'MODEL 03',
                    style: AppTextStyles.labelCaps(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Icon(Icons.security_rounded, size: 22, color: AppColors.primary),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Technical Support & SLA',
                style: AppTextStyles.headlineSm(color: AppColors.primary),
              ),
              const SizedBox(height: 10),
              Text(
                'Continuous monitoring, security patch management, store compliance maintenance, and high-priority bug resolution retainers.',
                style: AppTextStyles.bodySm(color: AppColors.onSurfaceVariant),
              ),
              const SizedBox(height: 20),
              _buildCheckItem('Guaranteed response SLA', false),
              _buildCheckItem('Automated CI/CD health checks', false),
              _buildCheckItem('OS & SDK upgrade guarantees', false),
            ],
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => onSelectModel('contact'),
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.surfaceContainer,
                foregroundColor: AppColors.primary,
                side: BorderSide.none,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text(
                'Retainer Inquiry',
                style: AppTextStyles.labelMd(color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckItem(String text, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            Icons.check_rounded,
            size: 16,
            color: isDark ? AppColors.secondaryFixed : AppColors.secondary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.bodySm(
                color: isDark ? AppColors.primaryFixedDim : AppColors.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InteractiveTechPill extends StatefulWidget {
  final String text;
  final bool hasDot;

  const _InteractiveTechPill({required this.text, this.hasDot = false});

  @override
  State<_InteractiveTechPill> createState() => _InteractiveTechPillState();
}

class _InteractiveTechPillState extends State<_InteractiveTechPill> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovered ? -3 : 0, 0),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.surfaceContainerLowest : AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered ? AppColors.secondary.withValues(alpha: 0.5) : Colors.transparent,
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppColors.secondary.withValues(alpha: 0.15)
                  : Colors.black.withValues(alpha: 0.03),
              blurRadius: _isHovered ? 12 : 4,
              offset: Offset(0, _isHovered ? 4 : 1),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.hasDot) ...[
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppColors.secondary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
            ],
            Text(
              widget.text,
              style: AppTextStyles.labelMd(
                color: _isHovered ? AppColors.secondary : AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
