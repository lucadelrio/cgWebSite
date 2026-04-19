import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/theme.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

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
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://images.unsplash.com/photo-1559027615-cd4628902d4a?w=1600&q=80'),
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
                      const Text('Sostienici', style: TextStyle(color: Colors.white, fontSize: 44, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(color: AppTheme.primaryAmber, borderRadius: BorderRadius.circular(20)),
                        child: const Text('Ogni gesto conta, ogni contributo salva vite', style: TextStyle(color: AppTheme.primaryNavy, fontWeight: FontWeight.bold, fontSize: 14)),
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
                      'La Croce Gialla Ploaghe ODV è un\'associazione di volontariato che opera grazie al contributo di chi crede nella solidarietà. Ci sono tanti modi per sostenerci: ogni gesto conta.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18, height: 1.6),
                    ),
                    const SizedBox(height: 48),

                    // Diventa Volontario
                    _sectionTitle(context, Icons.volunteer_activism, 'Diventa Volontario'),
                    const SizedBox(height: 16),
                    Text(
                      'Diventare volontari della Croce Gialla significa mettere le proprie capacità e il proprio tempo al servizio degli altri. Non servono competenze specifiche: la formazione è a nostro carico. Serve solo la volontà di fare la differenza.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.6),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        _benefitChip(Icons.school, 'Formazione gratuita'),
                        _benefitChip(Icons.people, 'Squadra coesa'),
                        _benefitChip(Icons.health_and_safety, 'Assicurazione'),
                        _benefitChip(Icons.verified, 'Certificazioni BLSD'),
                        _benefitChip(Icons.directions_car, 'Patente gratuita CRI'),
                        _benefitChip(Icons.military_tech, 'Servizio civile'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text('Requisiti per diventare volontario:', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    ...[
                      'Età minima: 18 anni (16 con consenso dei genitori per il settore giovanile)',
                      'Idoneità psico-fisica (certificato medico)',
                      'Non aver subito condanne penali',
                      'Disponibilità oraria e motivazione al servizio',
                      'Residenza o domicilio nel territorio di competenza',
                    ].map((r) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(children: [
                        const Icon(Icons.check_circle, color: AppTheme.primaryAmber, size: 18),
                        const SizedBox(width: 10),
                        Expanded(child: Text(r, style: Theme.of(context).textTheme.bodyMedium)),
                      ]),
                    )),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () => launchUrl(Uri.parse('mailto:info@crocegiallaploaghe.it?subject=Richiesta%20informazioni%20volontariato')),
                      icon: const Icon(Icons.email),
                      label: const Text('Scrivici per informazioni'),
                      style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryNavy, foregroundColor: Colors.white),
                    ),
                    const SizedBox(height: 48),

                    // Donazioni
                    _sectionTitle(context, Icons.favorite, 'Dona Ora'),
                    const SizedBox(height: 16),
                    Text(
                      'Le donazioni sono il motore che ci permette di operare ogni giorno. Ogni euro viene interamente reinvestito per migliorare i servizi, acquistare attrezzature e formare i volontari. Le donazioni alla Croce Gialla Ploaghe ODV sono deducibili fiscalmente.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.6),
                    ),
                    const SizedBox(height: 24),

                    // IBAN e Bonifico
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryNavy.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppTheme.primaryNavy.withOpacity(0.1)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            const Icon(Icons.account_balance, color: AppTheme.primaryNavy, size: 24),
                            const SizedBox(width: 12),
                            Text('Bonifico Bancario', style: Theme.of(context).textTheme.titleLarge),
                          ]),
                          const SizedBox(height: 16),
                          _dataRow('Intestato a', 'Croce Gialla Ploaghe ODV'),
                          _dataRow('IBAN', 'IT60X07601169000000920048109'),
                          _dataRow('Banca', 'Cassa di Risparmio di Sassari – Filiale di Ploaghe'),
                          _dataRow('Causale', 'Donazione libera – Croce Gialla Ploaghe ODV'),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(color: AppTheme.primaryAmber.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                            child: Row(children: [
                              const Icon(Icons.info, color: AppTheme.primaryNavy, size: 18),
                              const SizedBox(width: 8),
                              Expanded(child: Text(
                                'Le donazioni a favore di ONLUS/ODV sono deducibili dalla dichiarazione dei redditi fino al limite del 10% del reddito complessivo.',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.primaryNavy),
                              )),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 5x1000
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryAmber.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppTheme.primaryAmber.withOpacity(0.2)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            const Icon(Icons.calculate, color: AppTheme.primaryNavy, size: 24),
                            const SizedBox(width: 12),
                            Text('5 per mille', style: Theme.of(context).textTheme.titleLarge),
                          ]),
                          const SizedBox(height: 12),
                          Text(
                            'Nella tua dichiarazione dei redditi, firma nel riquadro "Sostegno alle organizzazioni di volontariato" e inserisci il nostro Codice Fiscale:',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.6),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: AppTheme.primaryNavy.withOpacity(0.2))),
                            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                              Text('92004810906', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppTheme.primaryNavy, fontWeight: FontWeight.bold, letterSpacing: 2)),
                            ]),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Codice Fiscale della Croce Gialla Ploaghe ODV',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6)),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 48),

                    // Diventa Socio Sostenitore
                    _sectionTitle(context, Icons.card_membership, 'Socio Sostenitore'),
                    const SizedBox(height: 16),
                    Text(
                      'Diventare Socio Sostenitore significa partecipare attivamente alla vita dell\'associazione con un contributo annuale. Il Socio Sostenitore ha diritto a partecipare all\'Assemblea e ricevere aggiornamenti sulle attività.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.6),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Theme.of(context).dividerColor.withOpacity(0.15)),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            const Icon(Icons.star, color: AppTheme.primaryAmber, size: 24),
                            const SizedBox(width: 12),
                            Text('Socio Sostenitore', style: Theme.of(context).textTheme.titleLarge),
                          ]),
                          const SizedBox(height: 16),
                          ...[
                            'Quota associativa annuale di sostenimento',
                            'Diritto di voto in Assemblea',
                            'Aggiornamenti periodici sulle attività',
                            'Invito agli eventi e alle iniziative',
                            'Attestato di Socio Sostenitore',
                            'Agevolazioni fiscali sulla quota versata',
                          ].map((b) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Row(children: [
                              const Icon(Icons.check_circle, color: AppTheme.primaryAmber, size: 18),
                              const SizedBox(width: 10),
                              Expanded(child: Text(b, style: Theme.of(context).textTheme.bodyMedium)),
                            ]),
                          )),
                          const SizedBox(height: 16),
                          ElevatedButton.icon(
                            onPressed: () => launchUrl(Uri.parse('mailto:info@crocegiallaploaghe.it?subject=Richiesta%20socio%20sostenitore')),
                            icon: const Icon(Icons.email),
                            label: const Text('Richiedi informazioni'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 48),

                    // Agevolazioni Fiscali
                    _sectionTitle(context, Icons.receipt_long, 'Agevolazioni Fiscali'),
                    const SizedBox(height: 16),
                    Text(
                      'Come ente del Terzo Settore (ODV), le donazioni a favore della Croce Gialla Ploaghe godono di importanti agevolazioni fiscali:',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.6),
                    ),
                    const SizedBox(height: 12),
                    ...[
                      'Detrazione IRPEF del 30% delle donazioni, fino a un massimo di 30.000€ annui',
                      'Deduzione dal reddito fino al 10% del reddito complessivo per le imprese',
                      'Esenzione dalle imposte di successione e donazione per i lasciti testamentari',
                      'Quota soci deducibile come onere deducibile',
                    ].map((b) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(children: [
                        const Icon(Icons.check_circle, color: AppTheme.primaryAmber, size: 18),
                        const SizedBox(width: 10),
                        Expanded(child: Text(b, style: Theme.of(context).textTheme.bodyMedium)),
                      ]),
                    )),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(8)),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        const Icon(Icons.info, color: Colors.orange, size: 18),
                        const SizedBox(width: 8),
                        Expanded(child: Text(
                          'Per ricevere la ricevata ai fini fiscali, specificare sempre i propri dati nella causale del bonifico.',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.orange.shade900),
                        )),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, IconData icon, String title) {
    return Row(children: [
      Icon(icon, color: AppTheme.primaryNavy, size: 28),
      const SizedBox(width: 12),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: Theme.of(context).textTheme.headlineMedium),
        Container(width: 40, height: 3, decoration: BoxDecoration(color: AppTheme.primaryAmber, borderRadius: BorderRadius.circular(2))),
      ]),
    ]);
  }

  Widget _benefitChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.primaryAmber.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.primaryAmber.withOpacity(0.3)),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, color: AppTheme.primaryNavy, size: 16),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(color: AppTheme.primaryNavy, fontWeight: FontWeight.w600, fontSize: 13)),
      ]),
    );
  }

  Widget _dataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(width: 140, child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13))),
        Expanded(child: Text(value, style: const TextStyle(fontSize: 13))),
      ]),
    );
  }
}