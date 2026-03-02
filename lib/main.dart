import 'package:flutter/material.dart';

void main() {
  runApp(const ImpexZoneApp());
}

class ImpexZoneApp extends StatelessWidget {
  const ImpexZoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Impex Zone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0A4DBA)),
        useMaterial3: true,
      ),
      home: const HomeShell(),
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _selectedIndex = 0;

  static const _pages = [
    _HomePage(),
    _AboutPage(),
    _ServicesPage(),
    _ProductsPage(),
    _ContactPage(),
  ];

  static const _labels = ['Home', 'About', 'Services', 'Products', 'Contact'];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 850;

        if (isMobile) {
          return Scaffold(
            appBar: AppBar(title: Text(_labels[_selectedIndex])),
            body: _pages[_selectedIndex],
            bottomNavigationBar: NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (value) => setState(() => _selectedIndex = value),
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
                NavigationDestination(icon: Icon(Icons.info_outline), label: 'About'),
                NavigationDestination(
                  icon: Icon(Icons.local_shipping_outlined),
                  label: 'Services',
                ),
                NavigationDestination(icon: Icon(Icons.inventory_2_outlined), label: 'Products'),
                NavigationDestination(icon: Icon(Icons.contact_mail_outlined), label: 'Contact'),
              ],
            ),
          );
        }

        return Scaffold(
          body: Row(
            children: [
              NavigationRail(
                selectedIndex: _selectedIndex,
                labelType: NavigationRailLabelType.all,
                onDestinationSelected: (value) => setState(() => _selectedIndex = value),
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home_outlined),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.info_outline),
                    label: Text('About'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.local_shipping_outlined),
                    label: Text('Services'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.inventory_2_outlined),
                    label: Text('Products'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.contact_mail_outlined),
                    label: Text('Contact'),
                  ),
                ],
              ),
              const VerticalDivider(width: 1),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Text(
                            _labels[_selectedIndex],
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: _pages[_selectedIndex]),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({
    required this.title,
    required this.subtitle,
    required this.children,
  });

  final String title;
  final String subtitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(subtitle, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 20),
        ...children,
      ],
    );
  }
}

class _HighlightCard extends StatelessWidget {
  const _HighlightCard({
    required this.title,
    required this.text,
    required this.icon,
  });

  final String title;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(child: Icon(icon)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 6),
                  Text(text),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    return const _Section(
      title: 'Import and Export Service Providers',
      subtitle:
          'Impex Zone is now rebuilt as a Flutter application with a mobile-first layout and touch-friendly navigation.',
      children: [
        _HighlightCard(
          title: 'International Business Consultants',
          text: 'End-to-end guidance for global trade expansion and sourcing.',
          icon: Icons.public,
        ),
        _HighlightCard(
          title: 'Exporter Services',
          text: 'Document support, compliance checks, and shipment coordination.',
          icon: Icons.flight_takeoff,
        ),
        _HighlightCard(
          title: 'Importer Services',
          text: 'Procurement assistance and customs-ready import workflows.',
          icon: Icons.flight_land,
        ),
      ],
    );
  }
}

class _AboutPage extends StatelessWidget {
  const _AboutPage();

  @override
  Widget build(BuildContext context) {
    return const _Section(
      title: 'Trusted Import & Export Since 2020',
      subtitle:
          'We provide quality-first import and export operations backed by experienced specialists and reliable partners.',
      children: [
        _HighlightCard(
          title: '10+ Specialists',
          text: 'Dedicated trade professionals focused on smooth execution.',
          icon: Icons.groups_2_outlined,
        ),
        _HighlightCard(
          title: 'Quality Service',
          text: 'Structured workflows ensure dependable delivery and communication.',
          icon: Icons.verified_outlined,
        ),
      ],
    );
  }
}

class _ServicesPage extends StatelessWidget {
  const _ServicesPage();

  @override
  Widget build(BuildContext context) {
    return const _Section(
      title: 'Our Services',
      subtitle:
          'From consultancy to shipment handling, our services are organized for speed and confidence in global trade.',
      children: [
        _HighlightCard(
          title: 'Global Partnership',
          text: 'Connect with local and international suppliers that fit your needs.',
          icon: Icons.handshake_outlined,
        ),
        _HighlightCard(
          title: 'Business Growth',
          text: 'Scale sourcing and distribution through structured trade operations.',
          icon: Icons.trending_up,
        ),
        _HighlightCard(
          title: 'Reliable Support',
          text: 'Responsive assistance for logistics, paperwork, and planning.',
          icon: Icons.support_agent,
        ),
      ],
    );
  }
}

class _ProductsPage extends StatelessWidget {
  const _ProductsPage();

  @override
  Widget build(BuildContext context) {
    return const _Section(
      title: 'Comprehensive Product Categories',
      subtitle:
          'Explore our core product verticals handled through our import and export network.',
      children: [
        _HighlightCard(
          title: 'General Trading Products',
          text: 'Multi-category distribution products for regional markets.',
          icon: Icons.shopping_bag_outlined,
        ),
        _HighlightCard(
          title: 'Agro Commodities',
          text: 'Agricultural goods sourced with quality and consistency.',
          icon: Icons.agriculture_outlined,
        ),
        _HighlightCard(
          title: 'FMCG, Machinery, Metals and More',
          text: 'A broad portfolio tailored to client requests and local demand.',
          icon: Icons.precision_manufacturing_outlined,
        ),
      ],
    );
  }
}

class _ContactPage extends StatelessWidget {
  const _ContactPage();

  @override
  Widget build(BuildContext context) {
    return const _Section(
      title: 'Feel Free to Contact Us',
      subtitle:
          'Reach our team for quote requests and partnership opportunities.',
      children: [
        _HighlightCard(
          title: 'Call Us Anytime',
          text: '+880 1621-101508',
          icon: Icons.phone,
        ),
        _HighlightCard(
          title: 'Send E-mail',
          text: 'support@impex-zone.com',
          icon: Icons.email_outlined,
        ),
        _HighlightCard(
          title: 'Our Location',
          text: 'Dhaka, Bangladesh',
          icon: Icons.location_on_outlined,
        ),
      ],
    );
  }
}
