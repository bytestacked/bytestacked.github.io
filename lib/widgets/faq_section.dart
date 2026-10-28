import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'fade_slide_in.dart';

class FaqSection extends StatefulWidget {
  final Function(String section) onContactTap;

  const FaqSection({super.key, required this.onContactTap});

  @override
  State<FaqSection> createState() => _FaqSectionState();
}

class _FaqSectionState extends State<FaqSection> {
  int? _expandedIndex;

  final List<_FaqItemData> _faqs = [
    _FaqItemData(
      question: 'Why choose Flutter over native iOS and Android development?',
      answer:
          'Flutter allows you to deploy a truly single, high-performance codebase across both iOS and Android. This reduces development time and operational costs by up to 40% while preserving 60+ FPS native hardware rendering and complete UI fidelity.',
    ),
    _FaqItemData(
      question: 'Who owns the intellectual property and code repository?',
      answer:
          'You do, 100%. All Git repositories, design files, deployment credentials, and documentation are transferred to your organization upon milestone completion. We hold no proprietary lock-in.',
    ),
    _FaqItemData(
      question: 'How long does a typical custom software project take?',
      answer:
          'An initial production MVP typically takes between 6 to 10 weeks from discovery to App Store release. Complex enterprise portals or multi-tenant platforms range from 3 to 6 months in phased bi-weekly milestones.',
    ),
    _FaqItemData(
      question: 'Can you integrate AI into our existing software without a rewrite?',
      answer:
          'Yes. We construct isolated API micro-services and event hooks that plug directly into your current databases and user sessions, introducing intelligent search, summarization, and automation without disrupting core operations.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;

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
            child: isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left Column
                      Expanded(
                        flex: 5,
                        child: FadeSlideIn(
                          offset: const Offset(-28, 0),
                          child: _buildLeftInfo(),
                        ),
                      ),
                      const SizedBox(width: 48),
                      // Right Column (Accordion)
                      Expanded(
                        flex: 7,
                        child: _buildAccordionList(),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeSlideIn(
                        child: _buildLeftInfo(),
                      ),
                      const SizedBox(height: 36),
                      _buildAccordionList(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeftInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'INQUIRIES & CLARIFICATIONS',
          style: AppTextStyles.labelCaps(
            color: AppColors.secondary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Frequently Asked\nQuestions.',
          style: AppTextStyles.headlineLg(color: AppColors.primary),
        ),
        const SizedBox(height: 14),
        Text(
          'Need answers about Flutter compatibility, project timelines, or source code ownership? Here is how we operate.',
          style: AppTextStyles.bodyMd(color: AppColors.onSurfaceVariant),
        ),
        const SizedBox(height: 28),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.support_agent_rounded, size: 28, color: AppColors.secondary),
              const SizedBox(width: 14),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: AppTextStyles.bodySm(color: AppColors.onSurfaceVariant),
                    children: [
                      const TextSpan(text: 'Have a specific architectural question? '),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => widget.onContactTap('contact'),
                            child: Text(
                              'Speak with a lead engineer.',
                              style: AppTextStyles.bodySm(
                                color: AppColors.secondary,
                              ).copyWith(
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAccordionList() {
    return Column(
      children: List.generate(_faqs.length, (index) {
        final isExpanded = _expandedIndex == index;
        final faq = _faqs[index];

        return FadeSlideIn(
          delay: Duration(milliseconds: 80 * index),
          offset: const Offset(0, 20),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) {},
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _expandedIndex = isExpanded ? null : index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            faq.question,
                            style: AppTextStyles.labelMd(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 28,
                          height: 28,
                          decoration: const BoxDecoration(
                            color: AppColors.secondaryFixed,
                            shape: BoxShape.circle,
                          ),
                          child: AnimatedRotation(
                            duration: const Duration(milliseconds: 250),
                            turns: isExpanded ? 0.5 : 0.0,
                            child: const Icon(
                              Icons.expand_more_rounded,
                              size: 18,
                              color: AppColors.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (isExpanded) ...[
                      const SizedBox(height: 14),
                      Text(
                        faq.answer,
                        style: AppTextStyles.bodySm(color: AppColors.onSurfaceVariant),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      );
      }),
    );
  }
}

class _FaqItemData {
  final String question;
  final String answer;

  _FaqItemData({required this.question, required this.answer});
}
