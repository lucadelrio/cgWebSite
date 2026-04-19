import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/theme.dart';

class ProjectDetailPage extends StatelessWidget {
  final String projectId;
  const ProjectDetailPage({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    final project = _getProjectData(projectId);
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(project.imageUrl),
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
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton.icon(
                            onPressed: () => context.go('/projects'),
                            icon: const Icon(Icons.arrow_back, color: Colors.white70),
                            label: const Text('Torna ai progetti', style: TextStyle(color: Colors.white70)),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(color: AppTheme.primaryAmber.withOpacity(0.9), borderRadius: BorderRadius.circular(12)),
                                child: Icon(project.icon, color: AppTheme.primaryNavy, size: 28),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(project.title, style: const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 4),
                                    Text(project.subtitle, style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16)),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                decoration: BoxDecoration(
                                  color: project.status == 'Attivo' ? Colors.green.shade50 : Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(project.status, style: TextStyle(
                                  color: project.status == 'Attivo' ? Colors.green.shade700 : Colors.blue.shade700,
                                  fontWeight: FontWeight.bold, fontSize: 13,
                                )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
                constraints: const BoxConstraints(maxWidth: 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    // Description
                    Text('Il Progetto', style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: 4),
                    Container(width: 40, height: 4, decoration: BoxDecoration(color: AppTheme.primaryAmber, borderRadius: BorderRadius.circular(2))),
                    const SizedBox(height: 16),
                    ...project.descriptionParagraphs.map((p) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(p, style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.7)),
                    )),
                    const SizedBox(height: 32),
                    // Obiettivi
                    Text('Obiettivi', style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: 4),
                    Container(width: 40, height: 4, decoration: BoxDecoration(color: AppTheme.primaryAmber, borderRadius: BorderRadius.circular(2))),
                    const SizedBox(height: 16),
                    ...project.goals.map((g) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        const Icon(Icons.check_circle, color: AppTheme.primaryAmber, size: 18),
                        const SizedBox(width: 10),
                        Expanded(child: Text(g, style: Theme.of(context).textTheme.bodyMedium)),
                      ]),
                    )),
                    const SizedBox(height: 32),
                    // Destinatari
                    Text('Destinatari', style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: 4),
                    Container(width: 40, height: 4, decoration: BoxDecoration(color: AppTheme.primaryAmber, borderRadius: BorderRadius.circular(2))),
                    const SizedBox(height: 16),
                    Wrap(spacing: 12, runSpacing: 12, children: project.targets.map((t) => Chip(
                      label: Text(t),
                      backgroundColor: AppTheme.primaryAmber.withOpacity(0.1),
                      side: BorderSide.none,
                    )).toList()),
                    const SizedBox(height: 40),
                    // CTA
                    Container(
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(color: AppTheme.primaryNavy, borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Vuoi contribuire a questo progetto?', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppTheme.primaryAmber)),
                          const SizedBox(height: 8),
                          const Text('Scopri come puoi aiutarci: diventa volontario o sostienici con una donazione.', style: TextStyle(color: Colors.white70, fontSize: 15)),
                          const SizedBox(height: 16),
                          Wrap(spacing: 12, runSpacing: 12, children: [
                            ElevatedButton.icon(onPressed: () => context.go('/support'), icon: const Icon(Icons.volunteer_activism), label: const Text('Diventa Volontario'), style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryAmber, foregroundColor: AppTheme.primaryNavy)),
                            OutlinedButton.icon(onPressed: () => context.go('/support'), icon: const Icon(Icons.favorite), label: const Text('Dona Ora'), style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white))),
                          ]),
                        ],
                      ),
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

  _ProjectData _getProjectData(String id) {
    switch (id) {
      case 'a-ritmo-di-cuore':
        return _ProjectData(
          icon: Icons.favorite, title: 'A Ritmo di Cuore', subtitle: 'Prevenzione cardiovascolare e formazione', status: 'Attivo',
          imageUrl: 'https://images.unsplash.com/photo-1576091160550-2173dba999ef?w=800&q=80',
          descriptionParagraphs: [
            '"A Ritmo di Cuore" è il progetto di prevenzione cardiovascolare della Croce Gialla Ploaghe, nato con l\'obiettivo di sensibilizzare la comunità sull\'importanza del primo soccorso e della formazione BLSD.',
            'Il progetto prevede l\'organizzazione di corsi di formazione rivolti alla cittadinanza, l\'installazione di defibrillatori pubblici (DAE) nel territorio e campagne di informazione sulla prevenzione delle malattie cardiovascolari.',
            'Un progetto che salva vite: ogni persona formata è un potenziale salvavita nella catena della sopravvivenza.',
          ],
          goals: ['Formare 500 cittadini al BLSD', 'Installare 5 nuovi DAE sul territorio', 'Sensibilizzare le scuole sul primo soccorso', 'Creare una rete di primo soccorritore'],
          targets: ['Cittadini di Ploaghe e comuni limitrofi', 'Studenti delle scuole', 'Operatori sportivi', 'Volontari dell\'associazione'],
        );
      case 'nuova-ambulanza':
        return _ProjectData(
          icon: Icons.local_hospital, title: 'Nuova Ambulanza', subtitle: 'Rinnovo del parco mezzi', status: 'Completato',
          imageUrl: 'https://images.unsplash.com/photo-1538108149393-fbbd8181379a?w=800&q=80',
          descriptionParagraphs: [
            'L\'acquisto della nuova ambulanza rappresenta un traguardo importante per la Croce Gialla Ploaghe, garantendo al territorio un mezzo moderno e pienamente attrezzato per il soccorso avanzato.',
            'Il nuovo mezzo è dotato di tutte le attrezzature necessarie per il trasporto sanitario d\'urgenza e il soccorso avanzato, conforme agli standard della convenzione 118.',
            'Questo investimento è stato possibile grazie al contributo della comunità, delle istituzioni e di tutti i sostenitori.',
          ],
          goals: ['Garantire un servizio di soccorso efficiente', 'Ridurre i tempi di intervento', 'Avere un mezzo conforme agli standard', 'Migliorare il comfort durante il trasporto'],
          targets: ['Comunità di Ploaghe', 'Comuni del territorio', 'Pazienti trasportati', 'Sistema 118 regionale'],
        );
      case 'protezione-civile':
        return _ProjectData(
          icon: Icons.shield, title: 'Protezione Civile', subtitle: 'Emergenze e prevenzione del territorio', status: 'Attivo',
          imageUrl: 'https://images.unsplash.com/photo-1551076805-e186903474e0?w=800&q=80',
          descriptionParagraphs: [
            'Il gruppo di Protezione Civile della Croce Gialla Ploaghe è parte integrante del sistema nazionale di risposta alle emergenze.',
            'Operiamo in stretto coordinamento con la Prefettura di Sassari, la Regione Autonoma della Sardegna e il Comune di Ploaghe.',
            'Il gruppo è dotato di attrezzature specifiche per interventi di ricerca, soccorso e supporto logistico.',
          ],
          goals: ['Mantenere un gruppo operativo pronto all\'intervento', 'Partecipare a esercitazioni interforze', 'Monitorare il territorio per la prevenzione', 'Supportare la popolazione in emergenza'],
          targets: ['Popolazione del territorio', 'Comune di Ploaghe', 'Prefettura e Regione', 'Comunità montana'],
        );
      case 'trasporto-sociale':
        return _ProjectData(
          icon: Icons.accessible, title: 'Trasporto Sociale', subtitle: 'Mobilità per tutti', status: 'Attivo',
          imageUrl: 'https://images.unsplash.com/photo-1628595351029-c2bf1751145c?w=800&q=80',
          descriptionParagraphs: [
            'Il servizio di Trasporto Sociale è dedicato a tutti i cittadini con difficoltà di mobilità che necessitano di accompagnamento per raggiungere visite mediche e servizi essenziali.',
            'Grazie a convenzioni con i Comuni del territorio, garantiamo un servizio porta-porta con attenzione particolare agli anziani e alle persone con disabilità.',
            'Il servizio si occupa anche del trasporto per terapie dialitiche, garantendo regolarità e sicurezza.',
          ],
          goals: ['Garantire la mobilità alle fasce deboli', 'Assicurare il trasporto per terapie essenziali', 'Stipulare convenzioni con i comuni', 'Migliorare i mezzi accessibili'],
          targets: ['Anziani con difficoltà di mobilità', 'Persone con disabilità', 'Pazienti in terapia dialitica', 'Cittadini con esigenze sociali'],
        );
      case 'formazione-volontari':
        return _ProjectData(
          icon: Icons.school, title: 'Formazione Volontari', subtitle: 'Crescere insieme, servire meglio', status: 'Attivo',
          imageUrl: 'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=800&q=80',
          descriptionParagraphs: [
            'La formazione è il pilastro su cui si fonda la qualità dei servizi della Croce Gialla Ploaghe. Ogni volontario segue un percorso formativo completo.',
            'Il percorso prevede una fase teorica e una pratica, con stages in affiancamento ai volontari esperti.',
            'Investire nella formazione significa investire nella sicurezza della comunità.',
          ],
          goals: ['Formare nuovi volontari ogni anno', 'Garantire aggiornamenti periodici', 'Mantenere certificazioni BLSD aggiornate', 'Promuovere il volontariato tra i giovani'],
          targets: ['Aspiranti volontari', 'Volontari operativi', 'Giovani under 30', 'Cittadini motivati'],
        );
      default:
        return _ProjectData(
          icon: Icons.article, title: 'Progetto', subtitle: '', status: 'Attivo',
          imageUrl: 'https://images.unsplash.com/photo-1559027615-cd4628902d4a?w=800&q=80',
          descriptionParagraphs: ['Dettagli del progetto in fase di aggiornamento.'],
          goals: [],
          targets: [],
        );
    }
  }
}

class _ProjectData {
  final IconData icon;
  final String title;
  final String subtitle;
  final String status;
  final String imageUrl;
  final List<String> descriptionParagraphs;
  final List<String> goals;
  final List<String> targets;

  const _ProjectData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.imageUrl,
    required this.descriptionParagraphs,
    required this.goals,
    required this.targets,
  });
}