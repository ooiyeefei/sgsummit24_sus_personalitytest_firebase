import 'package:sgsummit24_sus_personalitytest/models/quiz_questions_model.dart';
import 'package:flutter/cupertino.dart';

const Color cardColor = Color(0xFF4993FA);

class SusHeroes {
  final int id;
  final String heroName;
  final Image heroImage;
  final Color topicColor;
  final String heroTagline;
  final String heroDescription;

  SusHeroes({
    required this.id,
    required this.topicColor,
    required this.heroImage,
    required this.heroName,
    required this.heroTagline,
    required this.heroDescription,
  });
}

final List<SusHeroes> susHeroesList = [
  SusHeroes(
    id: 0,
    topicColor: cardColor,
    heroImage: Image(image: AssetImage("assets/truth_talker.gif")),
    heroName: "Truth Talker\n(Conservative)",
    heroTagline: '"Has the facts about sustainability and tells others about it"',
    heroDescription: "Truth Talker relies on facts and science to combat misinformation about climate change. They focus on spreading accurate information and dispelling myths, believing clear communication is key to solving the problem.\n\nIn cloud sustainability: Truth Talker educates on the environmental impact of cloud services. Spreads awareness about cloud sustainability initiatives and best practices.",
  ),
  SusHeroes(
    id: 1,
    topicColor: cardColor,
    heroImage: Image(image: AssetImage("assets/green_guide.gif")),
    heroName: "Green Guide\n(Visionary)",
    heroTagline: '"Keeps green energy sources in check and doesn\'t let go of potential green solutions"',
    heroDescription: "Green Guide inspires others to envision a sustainable future. They look beyond current challenges and promote innovative solutions like green technology and eco-friendly lifestyles.\n\nIn cloud sustainability: Green Guide promotes adoption of sustainable cloud solutions. Advocates for using cloud providers with renewable energy sources and energy-efficient data centers.",
  ),
  SusHeroes(
    id: 2,
    topicColor: cardColor,
    heroImage: Image(image: AssetImage("assets/fume_fighter.gif")),
    heroName: "Fume Fighter\n(Ambitious)",
    heroTagline: '"Defender of green energy and protecting the atmosphere from carbon waste"',
    heroDescription: "Fume Fighter tackles air pollution with ambitious goals. They focus on reducing harmful emissions from vehicles and industries, working tirelessly to create cleaner air for everyone.\n\nIn cloud sustainability: Fume Fighter pushes for cloud innovation for a sustainable future. Looks for ways to reduce the carbon footprint of cloud services through technological advancements.",
  ),
  SusHeroes(
    id: 3,
    topicColor: cardColor,
    heroImage: Image(image: AssetImage("assets/energy_expert.gif")),
    heroName: "Energy Expert\n(Pragmatic)",
    heroTagline: '"Never wastes on energy consumption, always turn off resources when they are not needed."',
    heroDescription: "Energy Expert champions efficient energy use. They promote conservation methods and responsible consumption, advocating for making small changes in daily habits to create a big impact.\n\nIn cloud sustainability: Energy Expert optimizes existing cloud resources to reduce energy consumption. Focuses on using cloud services efficiently and avoiding unnecessary usage.",
  ),
];
