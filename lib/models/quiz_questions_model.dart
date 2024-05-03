class QuizQuestion {
  final int id;
  final String text;
  final List<QuizOption> options;
  bool isLocked;
  QuizOption? selectedQuizOption;


  QuizQuestion({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedQuizOption,
    required this.id,
  });

  QuizQuestion copyWith() {
    return QuizQuestion(
      id: id,
      text: text,
      options: options
          .map((option) =>
              QuizOption(text: option.text, points: option.points))
          .toList(),
      isLocked: isLocked,
      selectedQuizOption: selectedQuizOption,
    );
  }
}

class QuizOption {
  final String? text;
  final int? points;

  const QuizOption({
    this.text,
    this.points,
  });

  @override
  String toString() {
    return '{option: $text, points: $points}';
  }
}

final questionsList = [
  QuizQuestion(
    text:
        "Which of the following carbon optimization strategies do you find interesting?",
    options: [
      const QuizOption(text: "Shut down what you don't need", points: 2),
      const QuizOption(text: "Choose a location that is mostly powered by\n   renewable energy", points: 1),
      const QuizOption(text: "Switch to ARM-based Graviton instances", points: 3),
      const QuizOption(text: "Use serverless", points: 4),
    ],
    id: 0,
    // correctAnswer: const QuizOption(text: "ListView", points: true),
  ),
  QuizQuestion(
      text:
          "How do you know which resources can be safely shutdown to reduce carbon footprint?",
      options: [
        const QuizOption(text: "I know my IT estate like the back of my hand", points: 4),
        const QuizOption(text: "Check the utilization metrics & access logs", points: 2),
        const QuizOption(text: "Ask the application owners", points: 1),
        const QuizOption(text: "Shutdown first.. if nobody complains then\n   it's cool!", points: 3),
      ],
      id: 1,
      // correctAnswer: const QuizOption(text: "Expanded", points: true)
      ),
  QuizQuestion(
      text:
          "How will you choose a location that is mostly powered by renewable energy?",
      options: [
        const QuizOption(text: "Refer to the Amazon Sustainability website", points: 2),
        const QuizOption(text: "Invest in renewable energy projects to\n   offset carbon footprint", points: 1),
        const QuizOption(text: "Ask an AWS Solutions Architect", points: 3),
        const QuizOption(text: "Install my own Solar Panels", points: 4),
      ],
      id: 2,
          ),
  QuizQuestion(
      text:
          "What can you use ARM-based Graviton instances for?",
      options: [
        const QuizOption(text: "All of my Linux-based applications", points: 4),
        const QuizOption(text: "Only the managed services like RDS &\n   MSK", points: 1),
        const QuizOption(text: "For applications written in interpreted\n   languages like Python", points: 2),
        const QuizOption(text: "I can port all my .NET Core applications\n   to .NET Core containers on Linux", points: 3),
      ],
      id: 3,
      // correctAnswer: const QuizOption(text: "IconButton", points: true)
      ),
  QuizQuestion(
      text:
          "Which of the following serverless services will you use first?",
      options: [
        const QuizOption(text: "AWS Lambda", points: 4),
        const QuizOption(text: "Amazon Aurora Serverless", points: 2),
        const QuizOption(text: "Amazon DynamoDB", points: 3),
        const QuizOption(text: "Amazon S3", points: 1),
      ],
      id: 4,
      ),
  QuizQuestion(
      text:
          "How do you use choose instance types on AWS Cloud?",
      options: [
        const QuizOption(text: "I only use x86 instances", points: 1),
        const QuizOption(text: "I use one family of instances", points: 2),
        const QuizOption(text: "I use recommendations from AWS right sizing\n   tools such as AWS Compute Optimizer", points: 3),
        const QuizOption(text: "I evaluate energy-efficient types such\n   as Graviton", points: 4),
      ],
      id: 5,
          ),
  QuizQuestion(
      text:
          "How do you run machine learning workloads?",
      options: [
        const QuizOption(text: "I run on on-premises", points: 1),
        const QuizOption(text: "I use instances that comes with Nvidia\n   GPUs", points: 2),
        const QuizOption(text: "I use GPUs for tasks where they’re more\n   efficient using CPU-based alternatives.", points: 3),
        const QuizOption(text: "I evaluate purpose-built silicon such as\n   AWS Trainium, Inferentia & Graviton", points: 4),
      ],
      id: 6,
      ),
  QuizQuestion(
      text:
          "How do you meet users demand?",
      options: [
        const QuizOption(text: "My workloads are statically defined", points: 1),
        const QuizOption(text: "I manually scale the number of machines", points: 2),
        const QuizOption(text: "I have autoscaling groups", points: 3),
        const QuizOption(text: "My workloads are containerized and work\n   with scaling policies", points: 4),
      ],
      id: 7,
      ),
  QuizQuestion(
      text:
          "How do you manage the life cycle of your data?",
      options: [
        const QuizOption(text: "I delete data regularly", points: 1),
        const QuizOption(text: "I expand storage when required", points: 2),
        const QuizOption(text: "I move data to storage tiers based on\n   retention & access requirements", points: 3),
        const QuizOption(text: "I monitor the IOPs required", points: 4),
      ],
      id: 8,
      ),
  QuizQuestion(
      text:
          "What are the strategy you will choose to modernize your application stack?",
      options: [
        const QuizOption(text: "Modernize legacy application with more\n   efficient coding practices & language", points: 2),
        const QuizOption(text: "Migrate applications to cloud platform(s)\n   that prioritize renewable energy sources.", points: 1),
        const QuizOption(text: "Explore optimization ways e.g.right\n   sizing / autoscaling / containerization.", points: 4),
        const QuizOption(text: "Integrate sustainability considerations into\n   development practices & lifecycle.", points: 3),
      ],
      id: 9,
      ),

];
