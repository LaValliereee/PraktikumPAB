import 'package:flutter/material.dart';
import 'doctor_detail_screen.dart';
import 'models/doctor.dart';

class DoctorListScreen extends StatelessWidget {
  const DoctorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Doctor> doctors = [
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
            'Dikenal luas di TikTok dan Instagram melalui konten edukasi satwa eksotis dan domestik dengan pembawaan yang ramah dan informatif.',
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

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text('HealthHub', style: TextStyle(color: Colors.black)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Banner
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF2E8B7E),
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage('assets/images/rumah_sakit.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.3,
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'HealthHub:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Your health partner',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
            // Doctor Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: List.generate(
                  doctors.length,
                  (index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DoctorDetailScreen(doctor: doctors[index]),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFB3E5D8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Text(
                            doctors[index].icon,
                            style: const TextStyle(fontSize: 24),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            doctors[index].specialty,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
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
    );
  }
}
