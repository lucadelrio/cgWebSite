import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ===== HERO SECTION =====
          Stack(
            children: [
              Container(
                height: 520,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/hero_volunteers.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppTheme.primaryNavy.withOpacity(0.7), AppTheme.primaryNavy.withOpacity(0.9)],
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 120),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(color: AppTheme.primaryAmber, borderRadius: BorderRadius.circular(20)),
                            child: const Text('ODV – Organizzazione di Volontariato', style: TextStyle(color: AppTheme.primaryNavy, fontWeight: FontWeight.bold, fontSize: 13)),
                          ),
                          const SizedBox(height: 20),
                          const Text('Croce Gialla Ploaghe', style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                          const SizedBox(height: 12),
                          const Text('Dal 1978 al servizio della comunità.\nEmergenza, trasporto, formazione e solidarietà.', style: TextStyle(color: Colors.white70, fontSize: 20, height: 1.5), textAlign: TextAlign.center),
                          const SizedBox(height: 32),
                          Wrap(alignment: WrapAlignment.center, spacing: 16, runSpacing: 12, children: [
                            ElevatedButton.icon(onPressed: () => context.go('/support'), icon: const Icon(Icons.volunteer_activism), label: const Text('Diventa Volontario'), style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryAmber, foregroundColor: AppTheme.primaryNavy, padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16), textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                            OutlinedButton.icon(onPressed: () => context.go('/services'), icon: const Icon(Icons.arrow_forward), label: const Text('I Nostri Servizi'), style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white), padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16), textStyle: const TextStyle(fontSize: 16))),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ===== NUMERI CHIAVE =====
          Container(
            color: AppTheme.primaryNavy,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                  _statCard('46+', 'Anni di servizio'),
                  _statCard('40+', 'Volontari attivi'),
                  _statCard('24/7', 'Emergenza 118'),
                  _statCard('5', 'Comuni serviti'),
                ]),
              ),
            ),
          ),

          // ===== CHI SIAMO =====
          Padding(
            padding: const EdgeInsets.all(40),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(flex: 5, child: ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.asset('assets/images/community_team.jpg', height: 340, fit: BoxFit.cover))),
                  const SizedBox(width: 40),
                  Expanded(flex: 5, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Chi Siamo', style: Theme.of(context).textTheme.displaySmall),
                    const SizedBox(height: 4),
                    Container(width: 50, height: 4, decoration: BoxDecoration(color: AppTheme.primaryAmber, borderRadius: BorderRadius.circular(2))),
                    const SizedBox(height: 20),
                    const Text('La Croce Gialla Ploaghe è un\'associazione di volontariato che dal 1978 opera nel territorio dell\'Anglona per garantire servizi di emergenza, trasporto sanitario e assistenza alla popolazione.', style: TextStyle(fontSize: 16, height: 1.7)),
                    const SizedBox(height: 20),
                    Wrap(spacing: 12, runSpacing: 8, children: [
                      _badge(Icons.favorite, 'Volontariato'),
                      _badge(Icons.health_and_safety, 'Emergenza 118'),
                      _badge(Icons.school, 'Formazione'),
                      _badge(Icons.shield, 'Protezione Civile'),
                    ]),
                    const SizedBox(height: 24),
                    ElevatedButton(onPressed: () => context.go('/about'), child: const Text('Scopri di più')),
                  ])),
                ]),
              ),
            ),
          ),

          // ===== SERVIZI =====
          Container(
            color: Colors.grey.shade50,
            padding: const EdgeInsets.all(40),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Column(children: [
                  Text('I Nostri Servizi', style: Theme.of(context).textTheme.displaySmall, textAlign: TextAlign.center),
                  const SizedBox(height: 4),
                  Container(width: 50, height: 4, decoration: BoxDecoration(color: AppTheme.primaryAmber, borderRadius: BorderRadius.circular(2))),
                  const SizedBox(height: 32),
                  Wrap(spacing: 20, runSpacing: 20, alignment: WrapAlignment.center, children: [
                    _serviceCard(context, 'assets/images/medical_care.jpg', Icons.local_hospital, 'Soccorso 118', 'Servizio di emergenza H24 con ambulanza attrezzata e personale qualificato.', '/services'),
                    _serviceCard(context, 'assets/images/community_service.jpg', Icons.accessible, 'Trasporto Sociale', 'Servizio porta-porta per anziani e persone con difficoltà di mobilità.', '/services'),
                    _serviceCard(context, 'assets/images/medical_training.jpg', Icons.school, 'Formazione BLSD', 'Corsi di primo soccorso e defibrillazione per cittadini e professionisti.', '/services'),
                  ]),
                  const SizedBox(height: 24),
                  ElevatedButton(onPressed: () => context.go('/services'), child: const Text('Tutti i servizi')),
                ]),
              ),
            ),
          ),

          // ===== PROGETTI =====
          Padding(
            padding: const EdgeInsets.all(40),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Column(children: [
                  Text('Progetti in Corso', style: Theme.of(context).textTheme.displaySmall, textAlign: TextAlign.center),
                  const SizedBox(height: 4),
                  Container(width: 50, height: 4, decoration: BoxDecoration(color: AppTheme.primaryAmber, borderRadius: BorderRadius.circular(2))),
                  const SizedBox(height: 32),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(child: _projectCard(context, 'assets/images/emergency_response.jpg', 'A Ritmo di Cuore', 'Prevenzione cardiovascolare e formazione BLSD', 'a-ritmo-di-cuore')),
                    const SizedBox(width: 20),
                    Expanded(child: _projectCard(context, 'assets/images/teamwork.jpg', 'Protezione Civile', 'Emergenze e prevenzione del territorio', 'protezione-civile')),
                  ]),
                  const SizedBox(height: 24),
                  ElevatedButton(onPressed: () => context.go('/projects'), child: const Text('Tutti i progetti')),
                ]),
              ),
            ),
          ),

          // ===== CTA VOLONTARIATO =====
          Stack(
            children: [
              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage('assets/images/volunteer_group.jpg'), fit: BoxFit.cover),
                ),
                child: Container(decoration: BoxDecoration(color: AppTheme.primaryNavy.withOpacity(0.85))),
              ),
              Positioned.fill(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Unisciti a Noi', style: TextStyle(color: AppTheme.primaryAmber, fontSize: 36, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 16),
                          const Text('Il volontariato è un\'esperienza che arricchisce. Diventa parte della famiglia della Croce Gialla Ploaghe e aiutaci a fare la differenza.', style: TextStyle(color: Colors.white70, fontSize: 18, height: 1.5), textAlign: TextAlign.center),
                          const SizedBox(height: 24),
                          Wrap(alignment: WrapAlignment.center, spacing: 16, runSpacing: 12, children: [
                            ElevatedButton.icon(onPressed: () => context.go('/support'), icon: const Icon(Icons.volunteer_activism), label: const Text('Diventa Volontario'), style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryAmber, foregroundColor: AppTheme.primaryNavy, padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14))),
                            OutlinedButton.icon(onPressed: () => context.go('/support#donazioni'), icon: const Icon(Icons.favorite), label: const Text('Dona Ora'), style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white), padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14))),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ===== FORMAZIONE =====
          Padding(
            padding: const EdgeInsets.all(40),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(flex: 5, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Formazione e Corsi', style: Theme.of(context).textTheme.displaySmall),
                    const SizedBox(height: 4),
                    Container(width: 50, height: 4, decoration: BoxDecoration(color: AppTheme.primaryAmber, borderRadius: BorderRadius.circular(2))),
                    const SizedBox(height: 20),
                    const Text('Organizziamo corsi di primo soccorso, BLSD e formazione specialistica per volontari e cittadini. La formazione è la base della qualità dei nostri servizi.', style: TextStyle(fontSize: 16, height: 1.7)),
                    const SizedBox(height: 20),
                    ...['Corsi BLSD per cittadini', 'Formazione volontari operativi', 'Aggiornamenti per soccorritori', 'Corso primo soccorso aziendale'].map((c) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(children: [const Icon(Icons.check_circle, color: AppTheme.primaryAmber, size: 20), const SizedBox(width: 10), Expanded(child: Text(c, style: const TextStyle(fontSize: 15)))])
                    )),
                    const SizedBox(height: 20),
                    ElevatedButton(onPressed: () => context.go('/services'), child: const Text('Scopri i corsi')),
                  ])),
                  const SizedBox(width: 40),
                  Expanded(flex: 5, child: ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.asset('assets/images/first_aid_training.jpg', height: 340, fit: BoxFit.cover))),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statCard(String value, String label) {
    return Column(children: [
      Text(value, style: const TextStyle(color: AppTheme.primaryAmber, fontSize: 32, fontWeight: FontWeight.bold)),
      const SizedBox(height: 4),
      Text(label, style: const TextStyle(color: Colors.white70, fontSize: 14), textAlign: TextAlign.center),
    ]);
  }

  Widget _badge(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(color: AppTheme.primaryAmber.withOpacity(0.1), borderRadius: BorderRadius.circular(20), border: Border.all(color: AppTheme.primaryAmber.withOpacity(0.3))),
      child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(icon, color: AppTheme.primaryNavy, size: 16), const SizedBox(width: 6), Text(label, style: const TextStyle(color: AppTheme.primaryNavy, fontWeight: FontWeight.w600, fontSize: 13))]),
    );
  }

  Widget _serviceCard(BuildContext context, String imageUrl, IconData icon, String title, String subtitle, String route) {
    return SizedBox(
      width: 260,
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () => context.go(route),
          borderRadius: BorderRadius.circular(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(16)), child: Image.asset(imageUrl, height: 160, fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [Icon(icon, color: AppTheme.primaryAmber, size: 24), const SizedBox(width: 8), Expanded(child: Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)))],),
                const SizedBox(height: 8),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5)),
              ]),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _projectCard(BuildContext context, String imageUrl, String title, String subtitle, String slug) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: () => context.go('/projects/$slug'),
        borderRadius: BorderRadius.circular(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(16)), child: Image.asset(imageUrl, height: 200, fit: BoxFit.cover)),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(subtitle, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6))),
              const SizedBox(height: 12),
              Row(children: [Text('Scopri il progetto', style: TextStyle(color: AppTheme.primaryAmber, fontWeight: FontWeight.w600)), const SizedBox(width: 6), const Icon(Icons.arrow_forward, color: AppTheme.primaryAmber, size: 16)]),
            ]),
          ),
        ]),
      ),
    );
  }
}