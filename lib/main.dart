import 'package:flutter/material.dart';
import 'theme/app_colors.dart';
import 'theme/app_text_styles.dart';
import 'widgets/navbar.dart';
import 'widgets/hero_section.dart';
import 'widgets/services_section.dart';
import 'widgets/flutter_focus_section.dart';
import 'widgets/design_meets_code_section.dart';
import 'widgets/solutions_section.dart';
import 'widgets/process_section.dart';
import 'widgets/why_section.dart';
import 'widgets/tech_and_models_section.dart';
import 'widgets/faq_section.dart';
import 'widgets/contact_section.dart';
import 'widgets/footer_section.dart';
import 'widgets/fade_slide_in.dart';

void main() {
  runApp(const BytestackedApp());
}

class BytestackedApp extends StatelessWidget {
  const BytestackedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bytestacked. — Official Website',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.surface,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.secondary,
          surface: AppColors.surface,
          onSurface: AppColors.onSurface,
          primary: AppColors.primary,
          secondary: AppColors.secondary,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _flutterEngineeringKey = GlobalKey();
  final GlobalKey _designKey = GlobalKey();
  final GlobalKey _solutionsKey = GlobalKey();
  final GlobalKey _processKey = GlobalKey();
  final GlobalKey _whyKey = GlobalKey();
  final GlobalKey _techKey = GlobalKey();
  final GlobalKey _faqKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  bool _isMobileMenuOpen = false;
  String _activeSection = 'home';
  bool _showScrollToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!mounted) return;
    final offset = _scrollController.offset;
    final showTop = offset > 360;
    if (showTop != _showScrollToTop) {
      setState(() {
        _showScrollToTop = showTop;
      });
    }

    String newSection = 'home';
    final sectionKeys = [
      MapEntry('contact', _contactKey),
      MapEntry('faq', _faqKey),
      MapEntry('tech', _techKey),
      MapEntry('why', _whyKey),
      MapEntry('process', _processKey),
      MapEntry('solutions', _solutionsKey),
      MapEntry('design', _designKey),
      MapEntry('flutter-engineering', _flutterEngineeringKey),
      MapEntry('services', _servicesKey),
      MapEntry('home', _homeKey),
    ];

    for (final entry in sectionKeys) {
      final ctx = entry.value.currentContext;
      if (ctx != null) {
        final box = ctx.findRenderObject() as RenderBox?;
        if (box != null && box.hasSize) {
          final pos = box.localToGlobal(Offset.zero);
          if (pos.dy <= 200) {
            newSection = entry.key;
            break;
          }
        }
      }
    }

    if (newSection != _activeSection) {
      setState(() {
        _activeSection = newSection;
      });
    }
  }

  void _scrollToSection(String section) {
    setState(() {
      _isMobileMenuOpen = false;
    });

    GlobalKey? targetKey;
    switch (section) {
      case 'home':
        targetKey = _homeKey;
        break;
      case 'services':
        targetKey = _servicesKey;
        break;
      case 'flutter-engineering':
      case 'our-work':
        targetKey = _flutterEngineeringKey;
        break;
      case 'design':
        targetKey = _designKey;
        break;
      case 'solutions':
        targetKey = _solutionsKey;
        break;
      case 'process':
        targetKey = _processKey;
        break;
      case 'why':
      case 'about':
        targetKey = _whyKey;
        break;
      case 'tech':
        targetKey = _techKey;
        break;
      case 'faq':
        targetKey = _faqKey;
        break;
      case 'contact':
        targetKey = _contactKey;
        break;
    }

    if (targetKey?.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey!.currentContext!,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  Widget _buildSectionTransition() {
    return Container(
      height: 1,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            AppColors.secondary.withValues(alpha: 0.18),
            AppColors.primary.withValues(alpha: 0.08),
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;

    return Scaffold(
      body: Stack(
        children: [
          // Scrollable Content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Spacer for fixed navbar
                const SizedBox(height: 72),

                // Hero Section
                Container(
                  key: _homeKey,
                  child: HeroSection(
                    onExploreTap: _scrollToSection,
                    onStartProjectTap: _scrollToSection,
                  ),
                ),

                _buildSectionTransition(),

                // Services Section
                Container(
                  key: _servicesKey,
                  child: const FadeSlideIn(
                    offset: Offset(0, 36),
                    child: ServicesSection(),
                  ),
                ),

                _buildSectionTransition(),

                // Specialized Flutter Engineering Showcase
                Container(
                  key: _flutterEngineeringKey,
                  child: FadeSlideIn(
                    offset: const Offset(0, 36),
                    child: FlutterFocusSection(
                      onDiscussTap: _scrollToSection,
                    ),
                  ),
                ),

                _buildSectionTransition(),

                // Design Meets Code Visual Break
                Container(
                  key: _designKey,
                  child: const FadeSlideIn(
                    offset: Offset(0, 36),
                    child: DesignMeetsCodeSection(),
                  ),
                ),

                _buildSectionTransition(),

                // Solutions Section
                Container(
                  key: _solutionsKey,
                  child: FadeSlideIn(
                    offset: const Offset(0, 36),
                    child: SolutionsSection(
                      onExploreSolution: _scrollToSection,
                    ),
                  ),
                ),

                _buildSectionTransition(),

                // Development Process Section
                Container(
                  key: _processKey,
                  child: const FadeSlideIn(
                    offset: Offset(0, 36),
                    child: ProcessSection(),
                  ),
                ),

                _buildSectionTransition(),

                // Why Bytestacked Section
                Container(
                  key: _whyKey,
                  child: const FadeSlideIn(
                    offset: Offset(0, 36),
                    child: WhySection(),
                  ),
                ),

                _buildSectionTransition(),

                // Technology Stack & Engagement Models Section
                Container(
                  key: _techKey,
                  child: FadeSlideIn(
                    offset: const Offset(0, 36),
                    child: TechAndModelsSection(
                      onSelectModel: _scrollToSection,
                    ),
                  ),
                ),

                _buildSectionTransition(),

                // FAQ Section
                Container(
                  key: _faqKey,
                  child: FadeSlideIn(
                    offset: const Offset(0, 36),
                    child: FaqSection(
                      onContactTap: _scrollToSection,
                    ),
                  ),
                ),

                _buildSectionTransition(),

                // Contact Section
                Container(
                  key: _contactKey,
                  child: const FadeSlideIn(
                    offset: Offset(0, 36),
                    child: ContactSection(),
                  ),
                ),

                // Footer Section
                FooterSection(
                  onNavTap: _scrollToSection,
                ),

                // Padding at bottom for mobile nav bar if visible
                if (!isDesktop) const SizedBox(height: 70),
              ],
            ),
          ),

          // Fixed Top Navbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              onNavTap: _scrollToSection,
              onMobileMenuToggle: () {
                setState(() {
                  _isMobileMenuOpen = !_isMobileMenuOpen;
                });
              },
              isMobileMenuOpen: _isMobileMenuOpen,
              activeSection: _activeSection,
            ),
          ),

          // Floating Back to Top Button
          Positioned(
            right: 28,
            bottom: isDesktop ? 28 : 74,
            child: AnimatedScale(
              scale: _showScrollToTop ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 240),
              curve: Curves.easeOutBack,
              child: AnimatedOpacity(
                opacity: _showScrollToTop ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: _BackToTopButton(
                  onTap: () {
                    _scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeInOutCubic,
                    );
                  },
                ),
              ),
            ),
          ),

          // Mobile Drawer overlay if open
          if (!isDesktop && _isMobileMenuOpen)
            Positioned(
              top: 72,
              left: 0,
              right: 0,
              child: Container(
                color: AppColors.surface.withValues(alpha: 0.98),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'NAVIGATION MENU',
                          style: AppTextStyles.labelCaps(
                            color: AppColors.outline,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'v2026.1',
                          style: AppTextStyles.labelCaps(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildMobileNavItem('Home', 'home'),
                    _buildMobileNavItem('Services', 'services'),
                    _buildMobileNavItem('Solutions', 'solutions'),
                    _buildMobileNavItem('Our Work', 'flutter-engineering'),
                    _buildMobileNavItem('About', 'why'),
                    _buildMobileNavItem('Contact', 'contact', isAccent: true),
                  ],
                ),
              ),
            ),

          // Mobile Bottom Navigation Bar (Matching Stitch Mobile Spec)
          if (!isDesktop)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surface.withValues(alpha: 0.92),
                  border: Border(
                    top: BorderSide(
                      color: AppColors.onSurface.withValues(alpha: 0.05),
                      width: 1,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildBottomBarItem(Icons.home_rounded, 'Home', 'home'),
                    _buildBottomBarItem(Icons.dashboard_customize_rounded, 'Services', 'services'),
                    _buildBottomBarItem(Icons.terminal_rounded, 'Solutions', 'solutions'),
                    _buildBottomBarItem(Icons.grid_view_rounded, 'Work', 'flutter-engineering'),
                    _buildBottomBarItem(Icons.info_outline_rounded, 'About', 'why'),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMobileNavItem(String title, String section, {bool isAccent = false}) {
    return InkWell(
      onTap: () => _scrollToSection(section),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.labelMd(
                color: isAccent ? AppColors.secondary : AppColors.onSurface,
                fontWeight: isAccent ? FontWeight.w700 : FontWeight.w600,
              ),
            ),
            Icon(
              isAccent ? Icons.mail_rounded : Icons.north_east_rounded,
              size: 18,
              color: isAccent ? AppColors.secondary : AppColors.outline,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBarItem(IconData icon, String label, String section) {
    return InkWell(
      onTap: () => _scrollToSection(section),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 22, color: AppColors.onSurfaceVariant),
            const SizedBox(height: 2),
            Text(
              label,
              style: AppTextStyles.labelSm(
                color: AppColors.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ).copyWith(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}

class _BackToTopButton extends StatefulWidget {
  final VoidCallback onTap;

  const _BackToTopButton({required this.onTap});

  @override
  State<_BackToTopButton> createState() => _BackToTopButtonState();
}

class _BackToTopButtonState extends State<_BackToTopButton> {
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
          transform: Matrix4.translationValues(0, _isHovered ? -3 : 0, 0),
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.secondary : AppColors.surface.withValues(alpha: 0.92),
            shape: BoxShape.circle,
            border: Border.all(
              color: _isHovered ? AppColors.secondary : AppColors.outline.withValues(alpha: 0.2),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? AppColors.secondary.withValues(alpha: 0.40)
                    : Colors.black.withValues(alpha: 0.08),
                blurRadius: _isHovered ? 16 : 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            Icons.keyboard_arrow_up_rounded,
            size: 24,
            color: _isHovered ? AppColors.onSecondary : AppColors.onSurface,
          ),
        ),
      ),
    );
  }
}
