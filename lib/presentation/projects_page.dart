import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/theme.dart';

class Project {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final List<String> highlights;
  final String status;
  final String imageUrl;

  const Project({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.highlights,
    required this.status,
    required this.imageUrl,
  });
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  static const projects = [
    Project(
      id: 'a-ritmo-di-cuore',
      title: 'A Ritmo di Cuore',
      subtitle: 'Prevenzione cardiovascolare e formazione',
      description: 'Progetto di sensibilizzazione e formazione sulla prevenzione delle malattie cardiovascolari e sul primo soccorso, rivolto alla cittadinanza e alle scuole.',
      icon: Icons.favorite,
      highlights: ['Corsi BLSD per la popolazione', 'Defibrillatori pubblici', 'Formazione nelle scuole', 'Campagne di sensibilizzazione'],
      status: 'Attivo',
      imageUrl: 'assets/images/medical_training.jpg',
    ),
    Project(
      id: 'nuova-ambulanza',
      title: 'Nuova Ambulanza',
      subtitle: 'Rinnovo del parco mezzi',
      description: 'Acquisto e inaugurazione di una nuova ambulanza attrezzata per il soccorso avanzato, a garanzia di interventi sempre più rapidi ed efficienti sul territorio.',
      icon: Icons.local_hospital,
      highlights: ['Mezzo di soccorso avanzato', 'Dotazione completa', 'Sistema di navigazione integrato', 'Servizio H24'],
      status: 'Completato',
      imageUrl: 'assets/images/hero_volunteers.jpg',
    ),
    Project(
      id: 'protezione-civile',
      title: 'Protezione Civile',
      subtitle: 'Emergenze e prevenzione del territorio',
      description: 'Il nostro gruppo di Protezione Civile è pronto a intervenire in caso di emergenze, calamità naturali e per la sicurezza del territorio.',
      icon: Icons.shield,
      highlights: ['Risposta alle emergenze', 'Antincendio boschivo', 'Ricerca dispersi', 'Prevenzione e monitoraggio'],
      status: 'Attivo',
      imageUrl: 'assets/images/emergency_response.jpg',
    ),
    Project(
      id: 'trasporto-sociale',
      title: 'Trasporto Sociale',
      subtitle: 'Mobilità per tutti',
      description: 'Servizio di trasporto dedicato alle fasce deboli del territorio: anziani, disabili e persone con difficoltà di mobilità, per garantire l\'accesso ai servizi essenziali.',
      icon: Icons.accessible,
      highlights: ['Convenzioni comunali', 'Trasporto dialisi', 'Accompagnamento visite', 'Servizio porta-porta'],
      status: 'Attivo',
      imageUrl: 'assets/images/community_service.jpg',
    ),
    Project(
      id: 'formazione-volontari',
      title: 'Formazione Volontari',
      subtitle: 'Crescere insieme, servire meglio',
      description: 'Percorso formativo completo per i nuovi volontari e aggiornamento continuo per i volontari operativi. La formazione è il cuore della nostra efficienza.',
      icon: Icons.school,
      highlights: ['Corso base volontari', 'Formazione BLSD', 'Aggiornamenti periodici', 'Esercitazioni pratiche'],
      status: 'Attivo',
      imageUrl: 'assets/images/first_aid_training.jpg',
    ),
  ];

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
                      const Text('Progetti & Iniziative', style: TextStyle(color: Colors.white, fontSize: 44, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(color: AppTheme.primaryAmber, borderRadius: BorderRadius.circular(20)),
                        child: const Text('L\'impegno dei nostri volontari al servizio della comunità', style: TextStyle(color: AppTheme.primaryNavy, fontWeight: FontWeight.bold, fontSize: 14)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ===== INTRO =====
          Padding(
            padding: const EdgeInsets.all(40),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Scopri i progetti e le iniziative che animano la vita della Croce Gialla Ploaghe. Ogni progetto nasce dall\'impegno dei nostri volontari e dalla necessità di rispondere ai bisogni della comunità.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18, height: 1.6),
                    ),
                    const SizedBox(height: 48),
                    ...projects.map((p) => _ProjectCard(project: p)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;
  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: InkWell(
        onTap: () => context.go('/projects/${project.id}'),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Theme.of(context).dividerColor.withOpacity(0.15)),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 16, offset: const Offset(0, 6))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image header
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Stack(
                  children: [
                    Image.asset(
                      project.imageUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 24,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(color: AppTheme.primaryAmber.withOpacity(0.9), borderRadius: BorderRadius.circular(10)),
                            child: Icon(project.icon, color: AppTheme.primaryNavy, size: 22),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(project.title, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                              Text(project.subtitle, style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 13)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: project.status == 'Attivo' ? Colors.green.shade50 : Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          project.status,
                          style: TextStyle(
                            color: project.status == 'Attivo' ? Colors.green.shade700 : Colors.blue.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(project.description, style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.6)),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: project.highlights.map((h) => Chip(
                        label: Text(h, style: const TextStyle(fontSize: 12)),
                        backgroundColor: AppTheme.primaryAmber.withOpacity(0.1),
                        side: BorderSide.none,
                      )).toList(),
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => context.go('/projects/${project.id}'),
                        child: const Text('Scopri di più →', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}