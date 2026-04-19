import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/theme.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ===== HERO =====
          Stack(
            children: [
              Container(
                height: 280,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://images.unsplash.com/photo-1423666638847-77007387d139?w=1600&q=80'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppTheme.primaryNavy.withOpacity(0.5), AppTheme.primaryNavy.withOpacity(0.9)],
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Contatti', style: TextStyle(color: Colors.white, fontSize: 44, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(color: AppTheme.primaryAmber, borderRadius: BorderRadius.circular(20)),
                        child: const Text('Siamo a tua disposizione', style: TextStyle(color: AppTheme.primaryNavy, fontWeight: FontWeight.bold, fontSize: 14)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ===== CONTENT =====
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Siamo a tua disposizione per qualsiasi informazione. Non esitare a contattarci!',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18, height: 1.6),
                    ),
                    const SizedBox(height: 40),

                    // Sede Operativa
                    _contactCard(context, Icons.location_on, 'Sede Operativa', [
                      _contactItem('Indirizzo', 'Via Nazionale, 52 – 07017 Ploaghe (SS)'),
                      _contactItem('Telefono', '079 840 030'),
                      _contactItem('PEC', 'crocegiallaploaghe@pec.it'),
                      _contactItem('Email', 'info@crocegiallaploaghe.it'),
                    ], actions: [
                      ElevatedButton.icon(onPressed: () => launchUrl(Uri.parse('tel:+39079840030')), icon: const Icon(Icons.phone), label: const Text('Chiama ora')),
                      OutlinedButton.icon(onPressed: () => launchUrl(Uri.parse('mailto:info@crocegiallaploaghe.it')), icon: const Icon(Icons.email), label: const Text('Invia email')),
                    ]),
                    const SizedBox(height: 24),

                    // Emergenza
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.red.shade200)),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(children: [
                          const Icon(Icons.emergency, color: Colors.red, size: 28),
                          const SizedBox(width: 12),
                          Text('Emergenza 118', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.red.shade800)),
                        ]),
                        const SizedBox(height: 12),
                        Text('Per emergenze sanitarie, chiama subito il numero unico europeo:', style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5)),
                        const SizedBox(height: 8),
                        Center(child: Text('118', style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.red.shade800, fontWeight: FontWeight.bold))),
                        const SizedBox(height: 8),
                        Center(child: Text('oppure 112 – Numero Unico Europeo delle Emergenze', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.red.shade700))),
                      ]),
                    ),
                    const SizedBox(height: 24),

                    // Orari
                    _contactCard(context, Icons.schedule, 'Orari', [
                      _contactItem('Sede operativa', 'Lunedì – Venerdì: 9:00 – 13:00'),
                      _contactItem('Trasporto programmato', 'Lunedì – Sabato: 7:00 – 20:00'),
                      _contactItem('Trasporto sociale', 'Lunedì – Venerdì: 8:00 – 18:00'),
                      _contactItem('Emergenza 118', 'Servizio H24 – 365 giorni/anno'),
                    ]),
                    const SizedBox(height: 24),

                    // Social
                    _contactCard(context, Icons.share, 'Seguici', [
                      _contactItem('Facebook', '/crocegiallaploaghe'),
                      _contactItem('Instagram', '@crocegiallaploaghe'),
                      _contactItem('YouTube', 'Croce Gialla Ploaghe'),
                    ], actions: [
                      OutlinedButton.icon(onPressed: () => launchUrl(Uri.parse('https://facebook.com/crocegiallaploaghe')), icon: const Icon(Icons.facebook), label: const Text('Facebook')),
                      OutlinedButton.icon(onPressed: () => launchUrl(Uri.parse('https://instagram.com/crocegiallaploaghe')), icon: const Icon(Icons.camera_alt), label: const Text('Instagram')),
                    ]),
                    const SizedBox(height: 24),

                    // Mappa
                    _contactCard(context, Icons.map, 'Dove Siamo', [
                      _contactItem('', 'La nostra sede si trova a Ploaghe, in provincia di Sassari, nel cuore dell\'Anglona.'),
                    ], actions: [
                      ElevatedButton.icon(onPressed: () => launchUrl(Uri.parse('https://maps.google.com/?q=Croce+Gialla+Ploaghe')), icon: const Icon(Icons.directions), label: const Text('Apri in Google Maps')),
                    ]),
                    const SizedBox(height: 32),

                    // Form semplificato
                    Text('Scrivici', style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: 4),
                    Container(width: 40, height: 4, decoration: BoxDecoration(color: AppTheme.primaryAmber, borderRadius: BorderRadius.circular(2))),
                    const SizedBox(height: 16),
                    Text('Compila il modulo e ti risponderemo il prima possibile.', style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5)),
                    const SizedBox(height: 16),
                    _contactForm(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactCard(BuildContext context, IconData icon, String title, List<Widget> items, {List<Widget>? actions}) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor.withOpacity(0.15)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [Icon(icon, color: AppTheme.primaryNavy, size: 24), const SizedBox(width: 12), Text(title, style: Theme.of(context).textTheme.titleLarge)]),
        const SizedBox(height: 16),
        ...items,
        if (actions != null && actions.isNotEmpty) ...[const SizedBox(height: 16), Wrap(spacing: 12, runSpacing: 8, children: actions)],
      ]),
    );
  }

  Widget _contactItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: label.isEmpty ? Text(value, style: const TextStyle(height: 1.6)) : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(width: 160, child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13))),
        Expanded(child: Text(value, style: const TextStyle(fontSize: 13))),
      ]),
    );
  }

  Widget _contactForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: AppTheme.primaryNavy.withOpacity(0.03), borderRadius: BorderRadius.circular(16), border: Border.all(color: AppTheme.primaryNavy.withOpacity(0.1))),
      child: Column(children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(child: TextField(decoration: InputDecoration(labelText: 'Nome e Cognome', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),)),
          const SizedBox(width: 16),
          Expanded(child: TextField(decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),)),
        ]),
        const SizedBox(height: 16),
        TextField(decoration: InputDecoration(labelText: 'Oggetto', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)))),
        const SizedBox(height: 16),
        TextField(decoration: InputDecoration(labelText: 'Messaggio', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))), maxLines: 5),
        const SizedBox(height: 16),
        SizedBox(width: double.infinity, child: ElevatedButton.icon(onPressed: () => launchUrl(Uri.parse('mailto:info@crocegiallaploaghe.it?subject=Contatto%20dal%20sito')), icon: const Icon(Icons.send), label: const Text('Invia messaggio'), style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryNavy, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16)))),
      ]),
    );
  }
}