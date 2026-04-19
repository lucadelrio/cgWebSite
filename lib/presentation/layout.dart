import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/theme.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDesktop = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () => context.go('/'),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.local_hospital, color: AppTheme.primaryAmber, size: 28),
              const SizedBox(width: 8),
              Text(
                'CROCE GIALLA PLOAGHE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Theme.of(context).appBarTheme.foregroundColor,
                ),
              ),
            ],
          ),
        ),
        actions: [
          if (isDesktop) ...[
            _NavButton(label: 'Home', route: '/'),
            _NavButton(label: 'Chi Siamo', route: '/about'),
            _NavButton(label: 'Servizi', route: '/services'),
            _NavButton(label: 'Progetti', route: '/projects'),
            _NavButton(label: 'Sostienici', route: '/support'),
            _NavButton(label: 'Contatti', route: '/contact'),
          ],
          IconButton(
            icon: Icon(themeProvider.themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => themeProvider.toggleTheme(),
            tooltip: 'Cambia Tema',
          ),
          const SizedBox(width: 8),
        ],
      ),
      drawer: isDesktop ? null : _AppDrawer(),
      body: Column(
        children: [
          Expanded(child: child),
          _Footer(),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final String route;

  const _NavButton({required this.label, required this.route});

  @override
  Widget build(BuildContext context) {
    final isActive = GoRouterState.of(context).uri.toString() == route;
    return TextButton(
      onPressed: () => context.go(route),
      style: TextButton.styleFrom(
        foregroundColor: isActive ? AppTheme.primaryAmber : Theme.of(context).appBarTheme.foregroundColor,
        textStyle: TextStyle(
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      child: Text(label),
    );
  }
}

class _AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppTheme.primaryNavy,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.local_hospital, color: AppTheme.primaryAmber, size: 40),
                const SizedBox(height: 8),
                const Text(
                  'Croce Gialla Ploaghe ODV',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Dal 1981 al servizio della comunità',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          _DrawerItem(icon: Icons.home, label: 'Home', route: '/'),
          _DrawerItem(icon: Icons.info, label: 'Chi Siamo', route: '/about'),
          _DrawerItem(icon: Icons.medical_services, label: 'Servizi', route: '/services'),
          _DrawerItem(icon: Icons.emoji_objects, label: 'Progetti', route: '/projects'),
          _DrawerItem(icon: Icons.volunteer_activism, label: 'Sostienici', route: '/support'),
          _DrawerItem(icon: Icons.contact_mail, label: 'Contatti', route: '/contact'),
          const Divider(),
          _DrawerItem(icon: Icons.phone, label: 'Chiama: 079 840 030', route: null, url: 'tel:+39079840030'),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? route;
  final String? url;

  const _DrawerItem({required this.icon, required this.label, this.route, this.url});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {
        Navigator.pop(context);
        if (route != null) context.go(route!);
        if (url != null) launchUrl(Uri.parse(url!));
      },
    );
  }
}

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 800;

    return Container(
      width: double.infinity,
      color: AppTheme.primaryNavy,
      padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 24.0),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _FooterInfo(),
                _FooterLinks(context),
                _FooterContacts(),
                _FooterSocial(),
              ],
            )
          : Column(
              children: [
                _FooterInfo(),
                const SizedBox(height: 32),
                _FooterLinks(context),
                const SizedBox(height: 32),
                _FooterContacts(),
                const SizedBox(height: 32),
                _FooterSocial(),
              ],
            ),
    );
  }
}

class _FooterInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.local_hospital, color: AppTheme.primaryAmber, size: 24),
            const SizedBox(width: 8),
            Text(
              'CROCE GIALLA PLOAGHE ODV',
              style: TextStyle(
                color: AppTheme.primaryAmber,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Text(
          'Associazione di volontariato\nsenza scopo di lucro',
          style: TextStyle(color: Colors.white70, height: 1.5),
        ),
        const SizedBox(height: 16),
        Text(
          'CF: 92004810906',
          style: TextStyle(color: Colors.white54, fontSize: 12),
        ),
      ],
    );
  }
}

class _FooterLinks extends StatelessWidget {
  final BuildContext parentContext;
  const _FooterLinks(this.parentContext);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('LINK UTILI', style: TextStyle(color: AppTheme.primaryAmber, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 13)),
        const SizedBox(height: 16),
        _footerLink(parentContext, 'Chi Siamo', '/about'),
        _footerLink(parentContext, 'Servizi', '/services'),
        _footerLink(parentContext, 'Progetti', '/projects'),
        _footerLink(parentContext, 'Sostienici', '/support'),
        _footerLink(parentContext, 'Contatti', '/contact'),
      ],
    );
  }

  Widget _footerLink(BuildContext ctx, String label, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () => ctx.go(route),
        child: Text(label, style: TextStyle(color: Colors.white70, fontSize: 13)),
      ),
    );
  }
}

class _FooterContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('CONTATTI', style: TextStyle(color: AppTheme.primaryAmber, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 13)),
        const SizedBox(height: 16),
        InkWell(
          onTap: () => launchUrl(Uri.parse('tel:+39079840030')),
          child: _contactLine(Icons.phone, '079 840 030'),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () => launchUrl(Uri.parse('mailto:crocegiallaploaghe@gmail.com')),
          child: _contactLine(Icons.email, 'crocegiallaploaghe@gmail.com'),
        ),
        const SizedBox(height: 8),
        _contactLine(Icons.location_on, 'Via Luigi Camboni, 45\n07017 Ploaghe (SS)'),
      ],
    );
  }

  Widget _contactLine(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppTheme.primaryAmber, size: 16),
        const SizedBox(width: 8),
        Text(text, style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.4)),
      ],
    );
  }
}

class _FooterSocial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('SEGUICI', style: TextStyle(color: AppTheme.primaryAmber, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 13)),
        const SizedBox(height: 16),
        Row(
          children: [
            _socialButton(Icons.facebook, 'https://facebook.com/crocegiallaploaghe'),
            const SizedBox(width: 12),
            _socialButton(Icons.camera_alt, 'https://instagram.com/crocegiallaploaghe'),
          ],
        ),
        const SizedBox(height: 32),
        Text(
          '© ${DateTime.now().year} Croce Gialla Ploaghe ODV - Tutti i diritti riservati.',
          style: TextStyle(color: Colors.white38, fontSize: 11),
        ),
      ],
    );
  }

  Widget _socialButton(IconData icon, String url) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white24),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(icon, color: Colors.white70, size: 20),
      ),
    );
  }
}