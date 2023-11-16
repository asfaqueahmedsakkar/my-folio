Map<String, dynamic> data = {
  "bio":
      '''// Whether it's Flutter's fast development cycle or native's platform-specific 
// optimizations, I am driven by the art of crafting mobile experiences 
// that leave a lasting impact. Let's collaborate and transform your vision 
// into an extraordinary app.
      
// Harnessing the power of Flutter for more than half a decade, 
// I've brought countless ideas to life with its rich widget library and 
// expressive design. My proficiency extends from creating responsive 
// layouts to integrating APIs and third-party plugins, delivering apps that 
// excel in both aesthetics and functionality.

// I thrive in collaborative environments, seamlessly integrating with
// cross-functional teams of designers, product managers, and fellow developers. 
// My effective communication and adaptability contribute to a harmonious 
// development process, resulting in top-notch apps that exceed expectations.

// I thrive in collaborative environments, seamlessly integrating with 
// cross-functional teams of designers, product managers, and fellow developers. 
// My effective communication and adaptability contribute to a harmonious 
// development process, resulting in top-notch apps that exceed expectations.''',
  "higher_secondary": '''class HigherSecondary extends Education{
        
        @override
        String degree="Higher secondary school certificate";
        
        @override
        String institute="Rajshahi City college";
        
        String section="Science";
        
        @override
        int year=2011;
        
        @override
        double result=5.0;
  }''',
  "under_graduation": '''class UnderGraduation extends Education{
        
        @override
        String degree="BSc Engineering";
        
        @override
        String institute="Rajshahi University";
        
        String subject="Information and communication engineering";
        
        @override
        int year=2016;
        
        @override
        double result=3.52;
  }''',
  "debugBD": '''class DebugBDAsIntern extends Experience{
        
        @override
        String company="DebugBD";
        
        @override
        String jobTitle="Intern Android Application Developer";
        
        @override
        String startDate="August 2017";
        
        @override
        String endDate="October 2017";
        
        @override
        List<String> responsibility=[
          "Get familiar with the work environment", 
          "Becoming team player and developing android application"
        ];
  }
  
  
  class DebugBDAsJuniorDeveloper extends Experience{
        
        @override
        String company="DebugBD";
        
        @override
        String jobTitle="Mobile Application And Game Developer";
        
        @override
        String startDate="November 2017";
        
        @override
        String endDate="November 2019";
        
        @override
        String responsibility=[
            "Android application in android studio",
            "Cross platform mobile application development using Flutter",
            "Cross platform game development using unity"
        ];
  }''',
  "codersbucket": '''class CodersBucket extends Experience{
        
        @override
        String company="CodersBucket Ltd.";
        
        @override
        String jobTitle="Software Engineer(Mobile)";
        
        @override
        String startDate="December 2019";
        
        @override
        String currentlyWorkingHere=true;
        
        @override
        List<String> responsibility=[
          "Cross platform mobile application development using Flutter", 
          "Collaborate with web development team",
          "Develop high performance and scalable mobile app",
          "Firebase function development with node js.",
        ];
  }''',
  "cross_platform_app_development":
      '''class CrossPlatformAppDevelopment extends Expertise{
        
        @override
        String frameWorkOrEngine="Flutter";
        
        @override
        String language ="Dart";
        
        @override
        String experience ="5 years";
        
        @override
        String proficiency ="Very good";
        
  }''',
  "game_development": '''class GameDevelopment extends Expertise{
        
        @override
        String frameWorkOrEngine="Unity";
        
        @override
        String language ="C#";
        
        @override
        String experience ="1 year";
        
        @override
        String proficiency ="Moderate";
        
  }''',
  "android_native": '''class AndroidNative extends Expertise{
        
        @override
        String frameWorkOrEngine="Android";
        
        @override
        String language ="Java/Kotlin";
        
        @override
        String experience ="1.5 year";
        
        @override
        String proficiency ="Good";
        
  }''',
  "backend_development": '''class BackendDevelopment extends Expertise{
        
        @override
        String frameWorkOrEngine="Node.js";
        
        @override
        String language ="JavaScript/TypeScript";
        
        @override
        String experience ="0 year";
        
        @override
        bool selfStudy=true;
        
        @override
        String proficiency ="Moderate";
        
  }''',
  "interest":
      '''// I am keen on immersing myself in the latest technological advancements,
// constantly striving to enhance my expertise in this ever-evolving domain. 
// Novels have a special place in my heart, as I find great joy in delving
// into their narratives. 

// Sports and films are my sources of entertainment and inspiration, 
// as I take pleasure in both watching and engaging in these activities.''',
};

List<Map<String, dynamic>> projects = [
  {
    "name": "Surokkha",
    "image": "surokkha",
    "details":
        "Surokkha is providing the facility to register for vaccination for the people of Bangladesh. This application was developed to provide all the services from single place.",
  },
  {
    "name": "Simply Eloped:Vendor",
    "image": "simplyeloped",
    "details":
        "Simply Eloped is the leading elopement company in USA.\nThis application to help Simply Eloped vendors to manege their daily elopements.",
  },
  {
    "name": "Surokkha Distribution",
    "image": "surokkha",
    "details":
        "Surokkha Distribution app is for Vaccinator to verify the person's information, track the vaccination state and record vaccination status.",
  },
  {
    "name": "HelloHRM",
    "image": "hellohrm",
    "details":
        "Hellohrm is a cloud-based HR software providing a simple experience to employees. It helps you accommodate quickly to the changes and make your HR process robust and effective. Build a high-performance team with our elegant features.",
  },
  {
    "name": "Gym City",
    "image": "gymcity",
    "details":
        "GymCity helps the gym owners manage their daily gym activities. It also let them connect to their gym members and track daily workouts, body measurement, invoicing etc. Users can use it for perfornal fitness tracking too.",
  },
  {
    "name": "e-ONIGIRI英単語",
    "image": "onigiri",
    "details":
        'An English vocabulary app provided by Iizuna Bookstore, which has sold over 1.8 million copies of "English Grammar and Grammar Reference Book Vintage".',
  },
  {
    "name": "Tutor fleet",
    "image": "tutorfleet",
    "details":
        "TutorFleet is a tuition management mobile Application where tutors can manage students in an easy and efficient way. Here Tutor can create students’ profiles and can Schedule/Re-Schedule time/dates and can trace payment history as well.",
  },
  {
    "name": "Game Changer",
    "image": "gamechanger",
    "details":
        "Game Changer is the oldest fantasy sports platform in Bangladesh where users can showcase their sports knowledge to create their own fantasy sports team of real-life players from upcoming matches and score points based on their on-field performance, and compete with other fans to be a winner in every match. Users can also showcase their gaming skill by competing against others on various casual games.",
  },
];
