import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'fade_slide_in.dart';

class SolutionsSection extends StatelessWidget {
  final Function(String section) onExploreSolution;

  const SolutionsSection({super.key, required this.onExploreSolution});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 640 && screenWidth < 1024;

    final solutions = [
      _SolutionData(
        objective: 'Objective 01',
        title: 'Launch a New Product',
        description:
            'Turn wireframes into a production-grade MVP ready for market validation, paying users, and investor scrutiny without architectural debt.',
        actionText: 'Explore MVP track',
      ),
      _SolutionData(
        objective: 'Objective 02',
        title: 'Modernize Existing Software',
        description:
            'Refactor monolithic legacy systems into clean, reactive modular microservices. Cut downtime and reduce maintenance overhead.',
        actionText: 'Explore Refactoring',
      ),
      _SolutionData(
        objective: 'Objective 03',
        title: 'Streamline Business Operations',
        description:
            'Consolidate disparate spreadsheets and manual emails into customized internal portals, unified dashboards, and automated sync hooks.',
        actionText: 'Explore Internal Tools',
      ),
      _SolutionData(
        objective: 'Objective 04',
        title: 'Improve Customer Experiences',
        description:
            'Deliver fluid mobile interfaces, lightning-fast web checkout paths, and zero-friction customer journeys that boost retention.',
        actionText: 'Explore UX Engineering',
      ),
      _SolutionData(
        objective: 'Objective 05',
        title: 'Integrate AI into Your Workflow',
        description:
            'Augment your human workforce with deterministic AI pipelines, automated document summaries, and intelligent triaging bots.',
        actionText: 'Explore AI Integration',
      ),
      _SolutionData(
        objective: 'Objective 06',
        title: 'Scale Your Digital Product',
        description:
            'Prepare infrastructure for hyper-growth traffic spikes. Edge-caching, distributed read replicas, and resilient message brokers.',
        actionText: 'Explore Scale Solutions',
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
                        'SOLUTIONS',
                        style: AppTextStyles.labelCaps(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Technology That Solves\nReal Problems.',
                        style: AppTextStyles.headlineLg(color: AppColors.primary),
                      ),
                      const SizedBox(height: 12),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 600),
                        child: Text(
                          'Whether you are launching an early-stage venture or scaling an existing enterprise stack, we adapt our engineering to your current inflection point.',
                          style: AppTextStyles.bodyMd(color: AppColors.onSurfaceVariant),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),

                // 6 Cards Grid
                if (isDesktop)
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: FadeSlideIn(delay: const Duration(milliseconds: 100), child: _buildSolutionCard(solutions[0]))),
                          const SizedBox(width: 20),
                          Expanded(child: FadeSlideIn(delay: const Duration(milliseconds: 180), child: _buildSolutionCard(solutions[1]))),
                          const SizedBox(width: 20),
                          Expanded(child: FadeSlideIn(delay: const Duration(milliseconds: 260), child: _buildSolutionCard(solutions[2]))),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: FadeSlideIn(delay: const Duration(milliseconds: 150), child: _buildSolutionCard(solutions[3]))),
                          const SizedBox(width: 20),
                          Expanded(child: FadeSlideIn(delay: const Duration(milliseconds: 230), child: _buildSolutionCard(solutions[4]))),
                          const SizedBox(width: 20),
                          Expanded(child: FadeSlideIn(delay: const Duration(milliseconds: 310), child: _buildSolutionCard(solutions[5]))),
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
                          Expanded(child: _buildSolutionCard(solutions[0])),
                          const SizedBox(width: 16),
                          Expanded(child: _buildSolutionCard(solutions[1])),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildSolutionCard(solutions[2])),
                          const SizedBox(width: 16),
                          Expanded(child: _buildSolutionCard(solutions[3])),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildSolutionCard(solutions[4])),
                          const SizedBox(width: 16),
                          Expanded(child: _buildSolutionCard(solutions[5])),
                        ],
                      ),
                    ],
                  )
                else
                  Column(
                    children: solutions.map((s) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _buildSolutionCard(s),
                    )).toList(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSolutionCard(_SolutionData data) {
    return _InteractiveSolutionCard(
      data: data,
      onTap: () => onExploreSolution('contact'),
    );
  }
}

class _InteractiveSolutionCard extends StatefulWidget {
  final _SolutionData data;
  final VoidCallback onTap;

  const _InteractiveSolutionCard({required this.data, required this.onTap});

  @override
  State<_InteractiveSolutionCard> createState() => _InteractiveSolutionCardState();
}

class _InteractiveSolutionCardState extends State<_InteractiveSolutionCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(0, _isHovered ? -6 : 0, 0),
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.surfaceContainerLowest : AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered ? AppColors.secondary.withValues(alpha: 0.4) : Colors.transparent,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? AppColors.secondary.withValues(alpha: 0.12)
                    : Colors.transparent,
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.objective,
                    style: AppTextStyles.labelCaps(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    widget.data.title,
                    style: AppTextStyles.headlineSm(color: AppColors.primary),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.data.description,
                    style: AppTextStyles.bodySm(color: AppColors.onSurfaceVariant),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      widget.data.actionText,
                      style: AppTextStyles.labelMd(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 6),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    transform: Matrix4.translationValues(_isHovered ? 4 : 0, 0, 0),
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      size: 16,
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SolutionData {
  final String objective;
  final String title;
  final String description;
  final String actionText;

  _SolutionData({
    required this.objective,
    required this.title,
    required this.description,
    required this.actionText,
  });
}
