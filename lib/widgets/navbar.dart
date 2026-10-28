import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class Navbar extends StatelessWidget {
  final Function(String section) onNavTap;
  final VoidCallback onMobileMenuToggle;
  final bool isMobileMenuOpen;
  final String activeSection;

  const Navbar({
    super.key,
    required this.onNavTap,
    required this.onMobileMenuToggle,
    required this.isMobileMenuOpen,
    this.activeSection = 'home',
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 992;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surface.withValues(alpha: 0.85),
            border: Border(
              bottom: BorderSide(
                color: AppColors.onSurface.withValues(alpha: 0.04),
                width: 1,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 8,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1360),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 48.0 : 20.0,
                  vertical: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left: Logo + Mobile Hamburger
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (!isDesktop) ...[
                          IconButton(
                            icon: Icon(
                              isMobileMenuOpen ? Icons.close : Icons.menu,
                              color: AppColors.onSurface,
                            ),
                            onPressed: onMobileMenuToggle,
                            splashRadius: 20,
                          ),
                          const SizedBox(width: 8),
                        ],
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => onNavTap('home'),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'bytestacked',
                                    style: AppTextStyles.headlineMd(
                                      color: const Color(0xFF171717),
                                    ).copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: isDesktop ? 24 : 20,
                                      letterSpacing: -0.5,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '.',
                                    style: AppTextStyles.headlineMd(
                                      color: AppColors.primary,
                                    ).copyWith(
                                      fontWeight: FontWeight.w900,
                                      fontSize: isDesktop ? 24 : 20,
                                    ),
                                  ),
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.top,
                                    child: Transform.translate(
                                      offset: const Offset(2, -4),
                                      child: Text(
                                        '®',
                                        style: TextStyle(
                                          fontSize: isDesktop ? 12 : 10,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF171717),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Center: Navigation links for desktop
                    if (isDesktop)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _InteractiveNavLink(
                            title: 'Home',
                            onTap: () => onNavTap('home'),
                            isActive: activeSection == 'home',
                          ),
                          const SizedBox(width: 28),
                          _InteractiveNavLink(
                            title: 'Services',
                            onTap: () => onNavTap('services'),
                            isActive: activeSection == 'services',
                          ),
                          const SizedBox(width: 28),
                          _InteractiveNavLink(
                            title: 'Solutions',
                            onTap: () => onNavTap('solutions'),
                            isActive: activeSection == 'solutions',
                          ),
                          const SizedBox(width: 28),
                          _InteractiveNavLink(
                            title: 'Our Work',
                            onTap: () => onNavTap('flutter-engineering'),
                            isActive: activeSection == 'flutter-engineering',
                          ),
                          const SizedBox(width: 28),
                          _InteractiveNavLink(
                            title: 'About',
                            onTap: () => onNavTap('why'),
                            isActive: activeSection == 'why',
                          ),
                          const SizedBox(width: 28),
                          _InteractiveNavLink(
                            title: 'Contact',
                            onTap: () => onNavTap('contact'),
                            isActive: activeSection == 'contact',
                          ),
                        ],
                      ),

                    // Right: "Let's Talk" CTA + Profile Avatar
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _HoverCta(
                          onTap: () => onNavTap('contact'),
                          isDesktop: isDesktop,
                        ),
                        const SizedBox(width: 14),
                        // Avatar Badge
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.surfaceVariant,
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/avatar.png',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                color: AppColors.surfaceContainerHigh,
                                child: const Icon(
                                  Icons.person,
                                  size: 18,
                                  color: AppColors.onSurfaceVariant,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InteractiveNavLink extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool isActive;

  const _InteractiveNavLink({
    required this.title,
    required this.onTap,
    this.isActive = false,
  });

  @override
  State<_InteractiveNavLink> createState() => _InteractiveNavLinkState();
}

class _InteractiveNavLinkState extends State<_InteractiveNavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isHighlighted = widget.isActive || _isHovered;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 180),
              style: AppTextStyles.labelMd(
                color: isHighlighted ? AppColors.secondary : AppColors.onSurfaceVariant,
                fontWeight: widget.isActive ? FontWeight.w700 : (_isHovered ? FontWeight.w600 : FontWeight.w500),
              ),
              child: Text(widget.title),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 240),
              curve: Curves.easeOutCubic,
              width: widget.isActive ? 20 : (_isHovered ? 12 : 0),
              height: 2,
              decoration: BoxDecoration(
                color: widget.isActive ? AppColors.secondary : AppColors.secondary.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HoverCta extends StatefulWidget {
  final VoidCallback onTap;
  final bool isDesktop;

  const _HoverCta({required this.onTap, required this.isDesktop});

  @override
  State<_HoverCta> createState() => _HoverCtaState();
}

class _HoverCtaState extends State<_HoverCta> {
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
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, _isHovered ? -2 : 0, 0),
          padding: EdgeInsets.symmetric(
            horizontal: widget.isDesktop ? 20 : 14,
            vertical: widget.isDesktop ? 12 : 10,
          ),
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: AppColors.secondary.withValues(alpha: _isHovered ? 0.45 : 0.25),
                blurRadius: _isHovered ? 14 : 6,
                offset: Offset(0, _isHovered ? 4 : 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Let's Talk",
                style: AppTextStyles.labelMd(
                  color: AppColors.onSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 6),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform: Matrix4.translationValues(_isHovered ? 3 : 0, 0, 0),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  size: 16,
                  color: AppColors.onSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
