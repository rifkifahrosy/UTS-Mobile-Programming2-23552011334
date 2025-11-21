import 'package:flutter/material.dart';

import '../models/profile.dart';
import '../widgets/info_card.dart';
import '../widgets/skill_item.dart';
import '../widgets/hobby_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilPage extends StatelessWidget {
  final bool darkMode;
  final VoidCallback onToggleTheme;

  const ProfilPage({
    super.key,
    required this.darkMode,
    required this.onToggleTheme,
  });

  Widget socialIcon(IconData icon) {
  return IconButton(
    icon: FaIcon(icon, size: 30),
    onPressed: () async {},
  );
}


  @override
  Widget build(BuildContext context) {
    final profile = Profile(
      nama: "Muhammad Rifki Fahrosy",
      nim: "23552011334",
      jurusan: "Teknik Informatika",
      email: "xxfahrosy@gmail.com",
      telepon: "+62 812-3456-7890",
      hobi: ["Gaming", "Cooking", "Editing Video"],
      skill: ["Flutter", "Java", "UI/UX", "Video Editing"],
      status: Status.aktif,
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(        
        slivers: [
          SliverAppBar(
            pinned: true,
            stretch: true,
            automaticallyImplyLeading: false,
            expandedHeight: 300,
            backgroundColor: Colors.transparent,
            elevation: 0,

            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                final maxHeight = constraints.biggest.height;

                final t = (maxHeight - kToolbarHeight) / (300 - kToolbarHeight);
                final clampedT = t.clamp(0.0, 1.0);

                final avatarSize = 30 + (60 - 30) * clampedT;
                final parallaxOffset = (1 - clampedT) * 40;
                final nameOpacity = clampedT;

                return Stack(
                  fit: StackFit.expand,
                  children: [
                    // Background gradient
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff4facfe), Color(0xff00f2fe)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),

                    // PARALLAX + SHRINK ANIMATION
                    Positioned(
                      top: 80 - parallaxOffset,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: avatarSize,
                            backgroundImage: const AssetImage("assets/images/profile_picture.jpg"),
                          ),

                          const SizedBox(height: 10),

                          Opacity(
                            opacity: nameOpacity,
                            child: Column(
                              children: [
                                Text(
                                  profile.nama,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "${profile.nim} • ${profile.jurusan}",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),


            // AppBar actions (toggle)
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  children: [
                    const Icon(Icons.dark_mode, color: Colors.white70),
                    Switch(
                      value: darkMode,
                      onChanged: (_) => onToggleTheme(),
                      activeColor: Colors.white,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.white54,
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Isi halaman
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  // Info cards
                  InfoCard(label: "Email", value: profile.email),
                  InfoCard(label: "Telepon", value: profile.telepon),
                  InfoCard(label: "Status", value: profile.getStatusText()),

                  const SizedBox(height: 18),
                  const Text(
                    "Skill",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  

                  // Grid skill
                  SizedBox(
                    height: 160,
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: profile.skill.length,
                      itemBuilder: (context, index) {
                        return SkillItem(skill: profile.skill[index]);
                      },
                    ),
                  ),

                  const SizedBox(height: 20),
                  const Text(
                    "Hobi",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  // Hobi list
                  ...profile.hobi.map((h) => HobbyItem(hobi: h)).toList(),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      socialIcon(FontAwesomeIcons.instagram),
                      socialIcon(FontAwesomeIcons.github),
                      socialIcon(FontAwesomeIcons.youtube),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
