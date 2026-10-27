import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'fade_slide_in.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _companyController = TextEditingController();
  final _detailsController = TextEditingController();

  String _selectedService = 'Flutter App Development';
  String _selectedBudget = '< \$15,000 (Sprint Audit / MVP Scope)';
  String _selectedTimeline = 'Immediately (Within 2 weeks)';

  bool _isSubmitted = false;

  final List<String> _services = [
    'Flutter App Development',
    'Custom Software & Web Platform',
    'AI Pipeline Integration',
    'Cloud Infrastructure & CI/CD',
    'Maintenance & Performance Tuning',
  ];

  final List<String> _budgets = [
    '< \$15,000 (Sprint Audit / MVP Scope)',
    '\$15,000 – \$40,000 (Standard Product Build)',
    '\$40,000 – \$100,000+ (Enterprise Platform)',
    'Ongoing Monthly Retainer',
  ];

  final List<String> _timelines = [
    'Immediately (Within 2 weeks)',
    'Next 30–60 Days',
    'Flexible / Planning Phase',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _companyController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isSubmitted = true;
      });
    }
  }

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
            child: FadeSlideIn(
              child: Container(
                padding: EdgeInsets.all(isDesktop ? 48 : 24),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: isDesktop
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left Info Column
                          Expanded(
                            flex: 5,
                            child: _buildLeftInfo(),
                          ),
                          const SizedBox(width: 48),
                          // Right Form Column
                          Expanded(
                            flex: 7,
                            child: _buildForm(),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLeftInfo(),
                          const SizedBox(height: 36),
                          _buildForm(),
                        ],
                      ),
              ),
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
        Row(
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
              'GET IN TOUCH',
              style: AppTextStyles.labelCaps(
                color: AppColors.secondary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          "Have an Idea?\nLet's Make It Happen.",
          style: AppTextStyles.headlineLg(color: AppColors.primary),
        ),
        const SizedBox(height: 14),
        Text(
          "Tell us about your product goals, architectural challenges, or operational needs. We'll reply within 24 business hours with an initial technical perspective.",
          style: AppTextStyles.bodyMd(color: AppColors.onSurfaceVariant),
        ),
        const SizedBox(height: 32),

        // Direct Info
        Column(
          children: [
            _buildContactRow(
              Icons.alternate_email_rounded,
              'contact@bytestacked.io',
              isBold: true,
            ),
            const SizedBox(height: 16),
            _buildContactRow(
              Icons.public_rounded,
              'bytestacked.github.io',
              isBold: true,
            ),
            const SizedBox(height: 16),
            _buildContactRow(
              Icons.schedule_rounded,
              'Typical response time: < 24 hours',
            ),
          ],
        ),
        const SizedBox(height: 40),

        Container(
          padding: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.surfaceContainerHigh)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'HEADQUARTERS & REMOTE OPERATIONS',
                style: AppTextStyles.labelCaps(
                  color: AppColors.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Distributed engineering studio catering to global founders and enterprises.',
                style: AppTextStyles.bodySm(color: AppColors.onSurfaceVariant),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactRow(IconData icon, String text, {bool isBold = false}) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.secondary),
        const SizedBox(width: 12),
        Text(
          text,
          style: isBold
              ? AppTextStyles.labelMd(color: AppColors.primary, fontWeight: FontWeight.w700)
              : AppTextStyles.bodySm(color: AppColors.onSurfaceVariant),
        ),
      ],
    );
  }

  Widget _buildForm() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 768;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: Name & Email
          if (isDesktop)
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    label: 'YOUR NAME *',
                    hint: 'Alex Mercer',
                    controller: _nameController,
                    validator: (v) => (v == null || v.isEmpty) ? 'Please enter your name' : null,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(
                    label: 'EMAIL ADDRESS *',
                    hint: 'alex@company.com',
                    controller: _emailController,
                    validator: (v) => (v == null || !v.contains('@')) ? 'Please enter a valid email' : null,
                  ),
                ),
              ],
            )
          else ...[
            _buildTextField(
              label: 'YOUR NAME *',
              hint: 'Alex Mercer',
              controller: _nameController,
              validator: (v) => (v == null || v.isEmpty) ? 'Please enter your name' : null,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'EMAIL ADDRESS *',
              hint: 'alex@company.com',
              controller: _emailController,
              validator: (v) => (v == null || !v.contains('@')) ? 'Please enter a valid email' : null,
            ),
          ],
          const SizedBox(height: 16),

          // Row 2: Company & Service
          if (isDesktop)
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    label: 'COMPANY / ORGANIZATION',
                    hint: 'Starlight Labs Ltd.',
                    controller: _companyController,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildDropdown(
                    label: 'PRIMARY SERVICE NEEDED',
                    value: _selectedService,
                    items: _services,
                    onChanged: (v) => setState(() => _selectedService = v!),
                  ),
                ),
              ],
            )
          else ...[
            _buildTextField(
              label: 'COMPANY / ORGANIZATION',
              hint: 'Starlight Labs Ltd.',
              controller: _companyController,
            ),
            const SizedBox(height: 16),
            _buildDropdown(
              label: 'PRIMARY SERVICE NEEDED',
              value: _selectedService,
              items: _services,
              onChanged: (v) => setState(() => _selectedService = v!),
            ),
          ],
          const SizedBox(height: 16),

          // Row 3: Budget & Timeline
          if (isDesktop)
            Row(
              children: [
                Expanded(
                  child: _buildDropdown(
                    label: 'ESTIMATED BUDGET RANGE',
                    value: _selectedBudget,
                    items: _budgets,
                    onChanged: (v) => setState(() => _selectedBudget = v!),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildDropdown(
                    label: 'TARGET TIMELINE',
                    value: _selectedTimeline,
                    items: _timelines,
                    onChanged: (v) => setState(() => _selectedTimeline = v!),
                  ),
                ),
              ],
            )
          else ...[
            _buildDropdown(
              label: 'ESTIMATED BUDGET RANGE',
              value: _selectedBudget,
              items: _budgets,
              onChanged: (v) => setState(() => _selectedBudget = v!),
            ),
            const SizedBox(height: 16),
            _buildDropdown(
              label: 'TARGET TIMELINE',
              value: _selectedTimeline,
              items: _timelines,
              onChanged: (v) => setState(() => _selectedTimeline = v!),
            ),
          ],
          const SizedBox(height: 16),

          // Row 4: Details TextArea
          _buildTextField(
            label: 'PROJECT DETAILS & OBJECTIVES',
            hint: "Briefly describe what you're building, key features, target platforms, or existing pain points...",
            controller: _detailsController,
            maxLines: 4,
          ),
          const SizedBox(height: 20),

          // Success Notification
          if (_isSubmitted) ...[
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.secondaryFixed.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.secondary, width: 1),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle_rounded, color: AppColors.secondary, size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Thank you! Your project inquiry has been queued. We will review and reach out shortly.',
                      style: AppTextStyles.labelMd(color: AppColors.secondary),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],

          // Footer & Submit Button
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            runSpacing: 12,
            children: [
              Text(
                'Strict NDA confidentiality assured.',
                style: AppTextStyles.labelSm(color: AppColors.onSurfaceVariant),
              ),
              _HoverSendButton(
                onPressed: _handleSubmit,
                label: 'Send Project Inquiry',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.labelCaps(
            color: AppColors.onSurfaceVariant,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          validator: validator,
          style: AppTextStyles.bodySm(color: AppColors.primary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.bodySm(color: AppColors.onSurfaceVariant.withValues(alpha: 0.5)),
            filled: true,
            fillColor: AppColors.surfaceContainer,
            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.secondary, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.labelCaps(
            color: AppColors.onSurfaceVariant,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: value,
              icon: const Icon(Icons.arrow_drop_down, color: AppColors.onSurfaceVariant),
              style: AppTextStyles.bodySm(color: AppColors.primary),
              items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}

class _HoverSendButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String label;

  const _HoverSendButton({required this.onPressed, required this.label});

  @override
  State<_HoverSendButton> createState() => _HoverSendButtonState();
}

class _HoverSendButtonState extends State<_HoverSendButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, _isHovered ? -3 : 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: AppColors.secondary.withValues(alpha: _isHovered ? 0.45 : 0.25),
                blurRadius: _isHovered ? 16 : 8,
                offset: Offset(0, _isHovered ? 6 : 3),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: AppTextStyles.labelMd(color: AppColors.onSecondary),
              ),
              const SizedBox(width: 8),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform: Matrix4.translationValues(
                  _isHovered ? 3 : 0,
                  _isHovered ? -2 : 0,
                  0,
                ),
                child: const Icon(Icons.send_rounded, size: 16, color: AppColors.onSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
