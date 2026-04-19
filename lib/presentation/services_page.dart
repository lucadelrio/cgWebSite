import 'package:flutter/material.dart';
import '../core/theme.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

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
                    image: AssetImage('assets/images/medical_care.jpg'),
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
                      const Text('I Nostri Servizi', style: TextStyle(color: Colors.white, fontSize: 44, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(color: AppTheme.primaryAmber, borderRadius: BorderRadius.circular(20)),
                        child: const Text('Professionalità e dedizione al servizio della comunità', style: TextStyle(color: AppTheme.primaryNavy, fontWeight: FontWeight.bold, fontSize: 14)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ===== EMERGENZA 118 =====
          Padding(
            padding: const EdgeInsets.all(40),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset('assets/images/hero_volunteers.jpg', height: 320, fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _badgeTag(context, Icons.local_hospital, 'Emergenza', Colors.red),
                          const SizedBox(height: 12),
                          Text('Soccorso 118', style: Theme.of(context).textTheme.displaySmall),
                          const SizedBox(height: 4),
                          Container(width: 50, height: 4, decoration: BoxDecoration(color: AppTheme.primaryAmber, borderRadius: BorderRadius.circular(2))),
                          const SizedBox(height: 16),
                          const Text('Il servizio di emergenza 118 è il cuore dell\'attività operativa della Croce Gialla Ploaghe. I nostri volontari garantiscono risposta H24 alle chiamate di emergenza nel territorio dell\'Anglona.', style: TextStyle(fontSize: 15, height: 1.7)),
                          const SizedBox(height: 12),
                          _bulletPoint('Ambulanza attrezzata con defibrillatore e presidi medici'),
                          _bulletPoint('Personale formato e costantemente aggiornato'),
                          _bulletPoint('Copertura 24 ore su 24, 365 giorni l\'anno'),
                          _bulletPoint('Connessione diretta con la Centrale Operativa 118'),
                          _bulletPoint('Interventi di urgenza e emergenza territoriale'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ===== TRASPORTO SOCIALE =====
          Container(
            color: Colors.grey.shade50,
            padding: const EdgeInsets.all(40),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _badgeTag(context, Icons.accessible, 'Sociale', Colors.blue),
                          const SizedBox(height: 12),
                          Text('Trasporto Sociale', style: Theme.of(context).textTheme.displaySmall),
                          const SizedBox(height: 4),
                          Container(width: 50, height: 4, decoration: BoxDecoration(color: AppTheme.primaryAmber, borderRadius: BorderRadius.circular(2))),
                          const SizedBox(height: 16),
                          const Text('Servizio di trasporto porta-porta per anziani e persone con difficoltà di mobilità, per garantire l\'accesso alle cure mediche e ai servizi essenziali.', style: TextStyle(fontSize: 15, height: 1.7)),
                          const SizedBox(height: 12),
                          _bulletPoint('Trasporto ospedaliero per visite specialistiche'),
                          _bulletPoint('Servizio porta-porta per anziani e disabili'),
                          _bulletPoint('Accompagnamento a centri di riabilitazione'),
                          _bulletPoint('Trasporto dialisi e terapie periodiche'),
                          _bulletPoint('Convenzioni con il Comune e la ASL'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset('assets/images/community_service.jpg', height: 320, fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ===== FORMAZIONE =====
          Padding(
            padding: const EdgeInsets.all(40),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset('assets/images/first_aid_training.jpg', height: 320, fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _badgeTag(context, Icons.school, 'Formazione', Colors.green),
                          const SizedBox(height: 12),
                          Text('Corsi e Formazione', style: Theme.of(context).textTheme.displaySmall),
                          const SizedBox(height: 4),
                          Container(width: 50, height: 4, decoration: BoxDecoration(color: AppTheme.primaryAmber, borderRadius: BorderRadius.circular(2))),
                          const SizedBox(height: 16),
                          const Text('Organizziamo corsi di primo soccorso, BLSD e formazione specialistica rivolti a cittadini, aziende e volontari.', style: TextStyle(fontSize: 15, height: 1.7)),
                          const SizedBox(height: 12),
                          _bulletPoint('Corso BLSD (Basic Life Support Defibrillation)'),
                          _bulletPoint('Primo Soccorso per cittadini'),
                          _bulletPoint('Formazione aziendale D.Lgs. 81/08'),
                          _bulletPoint('Corso PBLSD per scuole'),
                          _bulletPoint('Aggiornamento continuo per volontari soccorritori'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ===== PROTEZIONE CIVILE =====
          Container(
            color: Colors.grey.shade50,
            padding: const EdgeInsets.all(40),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _badgeTag(context, Icons.shield, 'Emergenza', Colors.orange),
                          const SizedBox(height: 12),
                          Text('Protezione Civile', style: Theme.of(context).textTheme.displaySmall),
                          const SizedBox(height: 4),
                          Container(width: 50, height: 4, decoration: BoxDecoration(color: AppTheme.primaryAmber, borderRadius: BorderRadius.circular(2))),
                          const SizedBox(height: 16),
                          const Text('La Croce Gialla Ploaghe è attiva nel settore della Protezione Civile, partecipando a esercitazioni e intervenendo in caso di calamità naturali e emergenze territoriali.', style: TextStyle(fontSize: 15, height: 1.7)),
                          const SizedBox(height: 12),
                          _bulletPoint('Intervento in caso di emergenze ambientali'),
                          _bulletPoint('Esercitazioni periodiche con enti locali'),
                          _bulletPoint('Gestione eventi e ordine pubblico'),
                          _bulletPoint('Supporto logistico alla Protezione Civile'),
                          _bulletPoint('Prevenzione e monitoraggio del territorio'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset('assets/images/teamwork.jpg', height: 320, fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ===== CTA =====
          Stack(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/volunteer_group.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(decoration: BoxDecoration(color: AppTheme.primaryNavy.withOpacity(0.85))),
              ),
              Positioned.fill(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Hai Bisogno di Aiuto?', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      const Text('Per emergenze chiama il 118.\nPer informazioni contattaci direttamente.', style: TextStyle(color: Colors.white70, fontSize: 18, height: 1.5), textAlign: TextAlign.center),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.phone),
                        label: const Text('Contattaci'),
                        style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryAmber, foregroundColor: AppTheme.primaryNavy, padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16), textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _badgeTag(BuildContext context, IconData icon, String label, MaterialColor color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(color: color.shade50, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color.shade700, size: 16),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(color: color.shade700, fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _bulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: AppTheme.primaryAmber, size: 18),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}