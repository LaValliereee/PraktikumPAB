import 'package:flutter/material.dart';
import 'doctor_detail_screen.dart';
import 'models/doctor.dart';

class DoctorListScreen extends StatelessWidget {
  const DoctorListScreen({super.key});

  static final List<Doctor> _doctors = [
    Doctor(
      id: '1',
      name: 'dr. Tirta Mandira Hudhi',
      specialty: 'Dokter Umum',
      icon: '🏥',
      schedule: 'Senin - Jumat, 07.00 - 15.00',
      biography:
          'Dokter umum yang dikenal luas di Indonesia, terutama melalui media sosial, dengan gaya komunikasinya yang lugas dan blak-blakan. Selain praktik kedokteran, ia juga aktif sebagai pembuat konten kesehatan dan olahraga.',
      rating: 4.3,
      imageUrl: 'assets/images/dokter_tirta.jpg',
    ),
    Doctor(
      id: '2',
      name: 'drg. Oktri Manessa',
      specialty: 'Dokter Gigi',
      icon: '🦷',
      schedule: 'Senin - Sabtu, 08.00 - 16.00',
      biography:
          'Pendiri jaringan klinik gigi OMDC (Oktri Manessa Dental Center) yang terkenal dengan konsep kliniknya yang unik, ramah anak, dan menjadi langganan banyak artis.',
      rating: 4.7,
      imageUrl: 'assets/images/dokter_oktri.jpg',
    ),
    Doctor(
      id: '3',
      name: 'dr. Miza Afrizal, Sp.A',
      specialty: 'Dokter Anak',
      icon: '👶',
      schedule: 'Senin - Jumat, 08.00 - 17.00',
      biography:
          'Dokter anak yang sangat populer di media sosial. Ia terkenal dengan gaya edukasinya yang santai, modern, dan mudah dipahami oleh orang tua muda.',
      rating: 4.5,
      imageUrl: 'assets/images/dokter_miza.jpg',
    ),
    Doctor(
      id: '4',
      name: 'drh. Habyb Palyoga',
      specialty: 'Dokter Hewan',
      icon: '🐾',
      schedule: 'Selasa - Minggu, 09.00 - 18.00',
      biography:
          'Dikenal luas di TikTok dan Instagram melalui konten edukasi satwa eksotis dan domestik dengan pembawaan yang ramah and informatif.',
      rating: 4.6,
      imageUrl: 'assets/images/dokter_habyb.jpg',
    ),
    Doctor(
      id: '5',
      name: 'dr. Deddy Hernanto, Sp.J',
      specialty: 'Dokter Jantung',
      icon: '❤️',
      schedule: 'Senin - Jumat, 08.00 - 16.00',
      biography:
          'Spesialis jantung yang berpengalaman lebih dari 15 tahun. Ahli dalam penanganan penyakit kardiovaskular dan memberikan edukasi kesehatan jantung.',
      rating: 4.8,
      imageUrl: 'assets/images/dokter_deddy.jpg',
    ),
    Doctor(
      id: '6',
      name: 'drg. Siti Nur Amalia, Sp.Ortho',
      specialty: 'Dokter Gigi Spesialis Ortho',
      icon: '😁',
      schedule: 'Senin - Kamis, 10.00 - 17.00',
      biography:
          'Spesialis ortodontik yang terkenal dengan teknik perawatan gigi rapi yang modern dan nyaman tanpa rasa sakit.',
      rating: 4.7,
      imageUrl: 'assets/images/dokter_siti.jpg',
    ),
    Doctor(
      id: '7',
      name: 'dr. Andri Setiawan, Sp.KJ',
      specialty: 'Dokter Psikiatri',
      icon: '🧠',
      schedule: 'Senin - Jumat, 09.00 - 17.00',
      biography:
          'Spesialis kesehatan mental dengan fokus pada gangguan kecemasan dan depresi. Memberikan konsultasi dan terapi yang mendalam.',
      rating: 4.6,
      imageUrl: 'assets/images/dokter_andri.jpg',
    ),
    Doctor(
      id: '8',
      name: 'dr. Rina Marlina, Sp.KK',
      specialty: 'Dokter Dermatologi',
      icon: '✨',
      schedule: 'Selasa - Sabtu, 10.00 - 18.00',
      biography:
          'Dokter kulit dengan spesialisasi dalam perawatan kulit estetik dan medis. Terkenal dengan hasil perawatan yang memuaskan.',
      rating: 4.5,
      imageUrl: 'assets/images/dokter_rina.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF7ED5A0).withOpacity(0.1),
              const Color(0xFFE0F7F0),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // AppBar Custom
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF7ED5A0), Color(0xFF5ABF7F)],
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'HealthHub',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.0,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Your health partner',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Doctor Categories
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: List.generate(
                    _doctors.length,
                    (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DoctorDetailScreen(doctor: _doctors[index]),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF7ED5A0).withOpacity(0.15),
                              blurRadius: 15,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFF7ED5A0).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  _doctors[index].icon,
                                  style: const TextStyle(fontSize: 28),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _doctors[index].name,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _doctors[index].specialty,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${_doctors[index].rating}',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
