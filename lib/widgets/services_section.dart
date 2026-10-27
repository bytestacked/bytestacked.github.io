import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'animated_hover_card.dart';
import 'fade_slide_in.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 640 && screenWidth < 1024;

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
                  child: isDesktop
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: _buildHeaderTitle()),
                            const SizedBox(width: 48),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 440),
                              child: Text(
                                'From the first idea to a production-ready product, we provide technology services tailored to your exact business requirements.',
                                style: AppTextStyles.bodyMd(color: AppColors.onSurfaceVariant),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildHeaderTitle(),
                            const SizedBox(height: 12),
                            Text(
                              'From the first idea to a production-ready product, we provide technology services tailored to your exact business requirements.',
                              style: AppTextStyles.bodyMd(color: AppColors.onSurfaceVariant),
                            ),
                          ],
                        ),
                ),
                const SizedBox(height: 48),

                // 7 Services Grid
                LayoutBuilder(
                  builder: (context, constraints) {
                    final crossAxisCount = isDesktop ? 3 : (isTablet ? 2 : 1);
                    return Column(
                      children: [
                        _buildGridRows(crossAxisCount),
                        const SizedBox(height: 20),
                        // 07. Spanning card
                        FadeSlideIn(
                          delay: const Duration(milliseconds: 350),
                          child: _buildSpanningCard(isDesktop: isDesktop),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: AppColors.secondary,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'CAPABILITIES & SERVICES',
              style: AppTextStyles.labelCaps(
                color: AppColors.secondary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Everything You Need to\nBuild, Launch, and Scale.',
          style: AppTextStyles.headlineLg(color: AppColors.primary),
        ),
      ],
    );
  }

  Widget _buildGridRows(int crossAxisCount) {
    final services = [
      _ServiceData(
        number: '01.',
        icon: Icons.terminal_rounded,
        title: 'Custom Software Development',
        description:
            'Full-scale bespoke applications, robust internal portals, enterprise ERP architectures, and low-latency API layers designed for high operational volume.',
        tags: ['Web Apps', 'Internal Portals', 'REST / GraphQL'],
        isCoreFocus: false,
      ),
      _ServiceData(
        number: '02.',
        icon: Icons.devices_rounded,
        title: 'Mobile App Development',
        description:
            'Native-grade user experiences across iOS and Android. High-fidelity tactile layouts, offline cache sync, and hardware sensor integrations.',
        tags: ['iOS / Android', 'Cross-Platform', 'Tactile UI'],
        isCoreFocus: false,
      ),
      _ServiceData(
        number: '03.',
        icon: Icons.flutter_dash_rounded,
        title: 'Flutter Development',
        description:
            'World-class cross-platform engineering from a single robust codebase. State management using Riverpod & BLoC, zero-jank profiling, and direct store pipeline automation.',
        tags: ['Single Codebase', 'BLoC / Riverpod', 'Firebase Sync', '60 FPS Render'],
        isCoreFocus: true,
      ),
      _ServiceData(
        number: '04.',
        icon: Icons.psychology_rounded,
        title: 'Artificial Intelligence & AI',
        description:
            'Practical AI implementations: private LLM pipelines, autonomous knowledge search, contextual assistants, and task execution agents with strict data boundaries.',
        tags: ['LLM Orchestration', 'RAG Pipelines', 'Custom Agents'],
        isCoreFocus: false,
      ),
      _ServiceData(
        number: '05.',
        icon: Icons.cloud_sync_rounded,
        title: 'Cloud Solutions & DevOps',
        description:
            'Zero-downtime CI/CD deployments, infrastructure-as-code, autoscaling architectures on AWS/GCP, and live telemetry observability clusters.',
        tags: ['AWS / GCP', 'Zero-Downtime', 'Terraform'],
        isCoreFocus: false,
      ),
      _ServiceData(
        number: '06.',
        icon: Icons.verified_user_rounded,
        title: 'Security & Reliability',
        description:
            'Bank-grade identity governance, granular RBAC matrices, penetration mitigation, automated vulnerability scanning, and SOC2-ready data controls.',
        tags: ['RBAC & Auth', 'Audit Trails', 'Data Guard'],
        isCoreFocus: false,
      ),
    ];

    if (crossAxisCount == 3) {
      return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: FadeSlideIn(delay: const Duration(milliseconds: 100), child: _buildServiceCard(services[0]))),
              const SizedBox(width: 20),
              Expanded(child: FadeSlideIn(delay: const Duration(milliseconds: 180), child: _buildServiceCard(services[1]))),
              const SizedBox(width: 20),
              Expanded(child: FadeSlideIn(delay: const Duration(milliseconds: 260), child: _buildServiceCard(services[2]))),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: FadeSlideIn(delay: const Duration(milliseconds: 150), child: _buildServiceCard(services[3]))),
              const SizedBox(width: 20),
              Expanded(child: FadeSlideIn(delay: const Duration(milliseconds: 230), child: _buildServiceCard(services[4]))),
              const SizedBox(width: 20),
              Expanded(child: FadeSlideIn(delay: const Duration(milliseconds: 310), child: _buildServiceCard(services[5]))),
            ],
          ),
        ],
      );
    } else if (crossAxisCount == 2) {
      return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildServiceCard(services[0])),
              const SizedBox(width: 20),
              Expanded(child: _buildServiceCard(services[1])),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildServiceCard(services[2])),
              const SizedBox(width: 20),
              Expanded(child: _buildServiceCard(services[3])),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildServiceCard(services[4])),
              const SizedBox(width: 20),
              Expanded(child: _buildServiceCard(services[5])),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: services.map((s) => Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: _buildServiceCard(s),
        )).toList(),
      );
    }
  }

  Widget _buildServiceCard(_ServiceData data) {
    if (data.isCoreFocus) {
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
            blurRadius: 30,
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
                      data.number,
                      style: AppTextStyles.labelCaps(
                        color: AppColors.secondaryFixed,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'CORE FOCUS',
                        style: AppTextStyles.labelCaps(
                          color: AppColors.onSecondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  data.title,
                  style: AppTextStyles.headlineSm(color: AppColors.onPrimary),
                ),
                const SizedBox(height: 12),
                Text(
                  data.description,
                  style: AppTextStyles.bodySm(color: AppColors.primaryFixedDim),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: data.tags.map((t) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  t,
                  style: AppTextStyles.labelCaps(color: AppColors.secondaryFixed),
                ),
              )).toList(),
            ),
          ],
        ),
      );
    }

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
                    data.number,
                    style: AppTextStyles.labelCaps(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    width: 38,
                    height: 38,
                    decoration: const BoxDecoration(
                      color: AppColors.surfaceContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(data.icon, size: 20, color: AppColors.primary),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                data.title,
                style: AppTextStyles.headlineSm(color: AppColors.primary),
              ),
              const SizedBox(height: 12),
              Text(
                data.description,
                style: AppTextStyles.bodySm(color: AppColors.onSurfaceVariant),
              ),
            ],
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: data.tags.map((t) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                t,
                style: AppTextStyles.labelCaps(color: AppColors.onSurfaceVariant),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSpanningCard({required bool isDesktop}) {
    return AnimatedHoverCard(
      backgroundColor: AppColors.surfaceContainerLowest,
      liftOffset: -4.0,
      hoverBorderColor: AppColors.secondary.withValues(alpha: 0.35),
      padding: const EdgeInsets.all(28),
      child: isDesktop
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '07.',
                            style: AppTextStyles.labelCaps(
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'EFFICIENCY SYSTEMS',
                            style: AppTextStyles.labelCaps(
                              color: AppColors.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Business Process Automation',
                        style: AppTextStyles.headlineSm(color: AppColors.primary),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Eliminate repetitive manual toil with bespoke webhook orchestrations, CRM/ERP synchronization bridges, and real-time event-driven notifications.',
                        style: AppTextStyles.bodySm(color: AppColors.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 32),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: const [
                    _TagBadge(text: 'Event-Driven'),
                    _TagBadge(text: 'Webhooks'),
                    _TagBadge(text: 'Automated Sync'),
                  ],
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '07.',
                      style: AppTextStyles.labelCaps(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'EFFICIENCY SYSTEMS',
                      style: AppTextStyles.labelCaps(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Business Process Automation',
                  style: AppTextStyles.headlineSm(color: AppColors.primary),
                ),
                const SizedBox(height: 8),
                Text(
                  'Eliminate repetitive manual toil with bespoke webhook orchestrations, CRM/ERP synchronization bridges, and real-time event-driven notifications.',
                  style: AppTextStyles.bodySm(color: AppColors.onSurfaceVariant),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: const [
                    _TagBadge(text: 'Event-Driven'),
                    _TagBadge(text: 'Webhooks'),
                    _TagBadge(text: 'Automated Sync'),
                  ],
                ),
              ],
            ),
    );
  }
}

class _ServiceData {
  final String number;
  final IconData icon;
  final String title;
  final String description;
  final List<String> tags;
  final bool isCoreFocus;

  _ServiceData({
    required this.number,
    required this.icon,
    required this.title,
    required this.description,
    required this.tags,
    required this.isCoreFocus,
  });
}

class _TagBadge extends StatelessWidget {
  final String text;

  const _TagBadge({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: AppTextStyles.labelCaps(color: AppColors.onSurfaceVariant),
      ),
    );
  }
}
