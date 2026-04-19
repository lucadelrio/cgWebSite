import 'package:flutter/material.dart';
import '../core/theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
                height: 320,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/community_team.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppTheme.primaryNavy.withOpacity(0.6), AppTheme.primaryNavy.withOpacity(0.9)],
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Chi Siamo', style: TextStyle(color: Colors.white, fontSize: 44, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(color: AppTheme.primaryAmber, borderRadius: BorderRadius.circular(20)),
                        child: const Text('Dal 1978 al servizio della comunità', style: TextStyle(color: AppTheme.primaryNavy, fontWeight: FontWeight.bold, fontSize: 14)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ===== STORIA =====
          Padding(
            padding: const EdgeInsets.all(40),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(flex: 5, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('La Nostra Storia', style: Theme.of(context).textTheme.displaySmall),
                    const SizedBox(height: 4),
                    Container(width: 50, height: 4, decoration: BoxDecoration(color: AppTheme.primaryAmber, borderRadius: BorderRadius.circular(2))),
                    const SizedBox(height: 20),
                    const Text('La Croce Gialla Ploaghe nasce nel 1978 dall\'impegno di un gruppo di cittadini animati dalla volontà di garantire assistenza sanitaria e soccorso nel territorio dell\'Anglona.', style: TextStyle(fontSize: 16, height: 1.7)),
                    const SizedBox(height: 16),
                    const Text('In oltre 46 anni di attività, l\'associazione è cresciuta fino a contare oltre 40 volontari operativi, diventando un punto di riferimento per i comuni di Ploaghe, Chiaramonti, Nulvi, Tergu e Ardara.', style: TextStyle(fontSize: 16, height: 1.7)),
                    const SizedBox(height: 16),
                    const Text('Oggi la Croce Gialla Ploaghe è un\'Organizzazione di Volontariato (ODV) iscritta al Registro Regionale delle Organizzazioni di Volontariato e svolge un ruolo fondamentale nel sistema dell\'emergenza-urgenza territoriale.', style: TextStyle(fontSize: 16, height: 1.7)),
                  ])),
                  const SizedBox(width: 40),
                  Expanded(flex: 5, child: ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.asset('assets/images/volunteer_group.jpg', height: 320, fit: BoxFit.cover))),
                ]),
              ),
            ),
          ),

          // ===== MISSIONE E VALORI =====
          Container(
            color: Colors.grey.shade50,
            padding: const EdgeInsets.all(40),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Column(children: [
                  Text('Missione e Valori', style: Theme.of(context).textTheme.displaySmall, textAlign: TextAlign.center),
                  const SizedBox(height: 4),
                  Container(width: 50, height: 4, decoration: BoxDecoration(color: AppTheme.primaryAmber, borderRadius: BorderRadius.circular(2))),
                  const SizedBox(height: 32),
                  Wrap(spacing: 20, runSpacing: 20, alignment: WrapAlignment.center, children: [
                    _valueCard(context, Icons.favorite, 'Solidarietà', 'Al centro del nostro operato c\'è il rispetto e la cura delle persone, con attenzione alle fasce più deboli.'),
                    _valueCard(context, Icons.groups, 'Volontariato', 'Il volontariato è la forza motrice della nostra associazione, ogni gesto conta.'),
                    _valueCard(context, Icons.verified, 'Professionalità', 'Formazione continua e aggiornamento per garantire servizi di qualità.'),
                    _valueCard(context, Icons.handshake, 'Comunità', 'Siamo radicati nel territorio e lavoriamo per il bene comune dell\'Anglona.'),
                  ]),
                ]),
              ),
            ),
          ),

          // ===== ORGANIGRAMMA =====
          Padding(
            padding: const EdgeInsets.all(40),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(flex: 5, child: ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.asset('assets/images/teamwork.jpg', height: 360, fit: BoxFit.cover))),
                  const SizedBox(width: 40),
                  Expanded(flex: 5, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Il Nostro Team', style: Theme.of(context).textTheme.displaySmall),
                    const SizedBox(height: 4),
                    Container(width: 50, height: 4, decoration: BoxDecoration(color: AppTheme.primaryAmber, borderRadius: BorderRadius.circular(2))),
                    const SizedBox(height: 20),
                    _teamMember(Icons.account_circle, 'Presidente', 'Guida l\'associazione e rappresenta la Croce Gialla nelle istituzioni'),
                    _teamMember(Icons.local_hospital, 'Vicepresidente', 'Supporta il presidente e coordina le attività operative'),
                    _teamMember(Icons.receipt_long, 'Segretario', 'Gestisce la burocrazia, la corrispondenza e gli atti ufficiali'),
                    _teamMember(Icons.account_balance_wallet, 'Tesoriere', 'Amministra il patrimonio e cura la gestione finanziaria'),
                    _teamMember(Icons.group, 'Consiglieri', 'Collaborano alle decisioni strategiche e allo sviluppo dell\'associazione'),
                    const Divider(height: 32),
                    _teamMember(Icons.directions_run, 'Volontari Operativi', 'Il cuore pulsante della Croce Gialla, sempre in prima linea'),
                  ])),
                ]),
              ),
            ),
          ),

          // ===== AFFILIAZIONI =====
          Stack(
            children: [
              Container(
                height: 380,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/helping_hands.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(decoration: BoxDecoration(color: AppTheme.primaryNavy.withOpacity(0.88))),
              ),
              Positioned.fill(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Affiliazioni e Riconoscimenti', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 32),
                          Wrap(spacing: 24, runSpacing: 24, alignment: WrapAlignment.center, children: [
                            _affiliationCard('Croce Rossa Italiana', 'Ente di appartenenza', Icons.favorite),
                            _affiliationCard('ANS – Associazione\nNazionale Soci', 'Società di Mutuo Soccorso', Icons.shield),
                            _affiliationCard('Regione Autonoma\ndella Sardegna', 'Registro Regionale ODV', Icons.account_balance),
                            _affiliationCard('Comune di Ploaghe', 'Convenzione servizi', Icons.location_city),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ===== CODICE FISCALE =====
          Container(
            color: AppTheme.primaryAmber,
            padding: const EdgeInsets.all(40),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Icon(Icons.verified, size: 48, color: AppTheme.primaryNavy),
                  const SizedBox(width: 24),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text('Codice Fiscale', style: TextStyle(color: AppTheme.primaryNavy, fontSize: 14, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 4),
                    SelectableText('92004810906', style: TextStyle(color: AppTheme.primaryNavy, fontSize: 28, fontWeight: FontWeight.bold)),
                  ]),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _valueCard(BuildContext context, IconData icon, String title, String desc) {
    return SizedBox(
      width: 190,
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: AppTheme.primaryAmber.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, color: AppTheme.primaryNavy, size: 32),
            ),
            const SizedBox(height: 12),
            Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(desc, style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5), textAlign: TextAlign.center),
          ]),
        ),
      ),
    );
  }

  Widget _teamMember(IconData icon, String role, String desc) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(children: [
        Icon(icon, color: AppTheme.primaryAmber, size: 28),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(role, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          Text(desc, style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
        ])),
      ]),
    );
  }

  Widget _affiliationCard(String title, String subtitle, IconData icon) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white24)),
      child: Column(children: [
        Icon(icon, color: AppTheme.primaryAmber, size: 36),
        const SizedBox(height: 12),
        Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14), textAlign: TextAlign.center),
        const SizedBox(height: 4),
        Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 12), textAlign: TextAlign.center),
      ]),
    );
  }
}