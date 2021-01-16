import 'dart:convert';

class EventModel {
  EventModel eventModelFromJson(String str) =>
      EventModel.fromJson(json.decode(str));

  String eventModelToJson(EventModel data) => json.encode(data.toJson());
  EventModel(
      {this.id,
      this.eventName,
      this.eventTitle,
      this.eventHashTag,
      this.eventDesc,
      this.eventDate,
      this.eventTime,
      this.eventMoreInfoLink,
      this.eventPoster,
      this.eventDay,
      this.eventURL,
      this.secondPageHeading,
      this.secondPageSubHeading,
      this.thirdPageHeading,
      this.thirdPageSubHeading,
      this.secondPagePoints,
      this.thirdPagePoints});

  int id;
  String eventName;
  String eventTitle;
  String eventHashTag;
  String eventDesc;
  String eventDate;
  String eventTime;
  String eventMoreInfoLink;
  String eventPoster;
  String eventDay;
  String eventURL;
  String secondPageHeading;
  String secondPageSubHeading;
  String thirdPageHeading;
  String thirdPageSubHeading;
  List<String> secondPagePoints;
  List<String> thirdPagePoints;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        eventName: json["eventName"],
        eventTitle: json["eventTitle"],
        eventHashTag: json["eventHashTag"],
        eventDesc: json["eventDesc"],
        eventDate: json["eventDate"],
        eventTime: json["eventTime"],
        eventMoreInfoLink: json["eventMoreInfoLink"],
        eventPoster: json["eventPoster"],
        eventDay: json["eventDay"],
        secondPageHeading: json["secondPageHeading"],
        secondPageSubHeading: json["secondPageSubHeading"],
        thirdPageHeading: json["thirdPageHeading"],
        thirdPageSubHeading: json["thirdPageSubHeading"],
        eventURL: json['eventURL'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "eventName": eventName,
        "eventTitle": eventTitle,
        "eventHashTag": eventHashTag,
        "eventDesc": eventDesc,
        "eventDate": eventDate,
        "eventTime": eventTime,
        "eventMoreInfoLink": eventMoreInfoLink,
        "eventPoster": eventPoster,
        "eventDay": [eventDay],
        "secondPageHeading": [secondPageHeading],
        "secondPageSubHeading": [secondPageSubHeading],
        "thirdPageHeading": [thirdPageHeading],
        "thirdPageSubHeading": [thirdPageSubHeading],
        "eventURL": [eventURL],
      };
}

final List<EventModel> eventsTestData = [
  EventModel(
    id: 1,
    eventName: "Develop Your First Game Using JavaScript",
    eventTitle: "Develop Your First Game Using JavaScript",
    eventDesc:
        "Web Development still remains to be an important element of not only marketing a business, but also the way we want to portray ourselves through our portfolios, to host projects, and innumerable more uses.\n\nFor you to express yourself on the internet, DSC VIT Bhopal delivers Develop your first game using JavaScript. We will ponder over frontend and backend development to give you foundational proficiency of Web Development. Further, coming to the most exciting part, we will teach you to build and deploy your first web game using Javascript..!\n\nThe session will be conducted by our very own Web Lead, Smit along with the Technical Lead, Sarthak. Tune in on 22nd November, 3:00 pm",
    eventDate: "22nd November",
    eventTime: "3:00 PM",
    eventPoster: null,
    eventMoreInfoLink: "https://youtu.be/-E9wT3ZAdzg",
    eventHashTag: "firstGameWithJavaScript",
    eventDay: "Sun",
    secondPageHeading: null,
    secondPageSubHeading:
        "Phase 1 - Introduction to Web Development (30 minutes)",
    thirdPageHeading: null,
    thirdPageSubHeading:
        "Phase 2 - Develop your first game using JavaScript (60 minutes)",
    secondPagePoints: [
      "Tools",
      "Building Blocks",
      "Package Managers",
      "Module Bundlers",
      "Linters and Formatters",
      "Frameworks and Libraries",
      "Modern CSS",
      "CSS Frameworks",
      "Type Checking",
      "TypeScript over JavaScript",
      "Static Site Generators",
      "Server-Side Rendering",
      "Mobile Apps",
      "Desktop Apps",
      "Server-Side Languages and Framework",
      "Databases",
    ],
    thirdPagePoints: [
      "1. Develop your first game using JavaScript",
      "2. Git in VSCode",
      "3. Pushing code to GitHub",
      "4. Publishing to Github pages",
      "5. Activity!",
    ],
    eventURL:
        "https://dsc.community.dev/events/details/developer-student-clubs-vellore-institute-of-technology-bhopal-presents-develop-your-first-game-using-javascript/",
  ),
  EventModel(
    id: 2,
    eventName: "Get it Done with the Experts",
    eventTitle: "Get it Done with the Experts",
    eventDesc:
        "Competitive Programming is quite the buzzword these days, and for a good reason. The main objective of Competitive Programming is to encourage problem-solving in a logical and mathematical way, which is an incredibly desirable skill in programmers.\n\nGetting into it though, can be intimidating, especially as a beginner.\n\nIf you are someone who is struggling with how to start Competitive Coding or even if someone who has started with it but lost the way ahead, this is just what you need.\n\n💡 The Coding Culture, an initiative by 50+ DSC all across India, brings to you a webinar on \"Get it done with the experts\". Get ready to know how to kick-start your journey in the world of Competitive Programming! 💡\n\nThe webinar is going to be on best practices, learning resources and much more.",
    eventDate: "15th November 2020",
    eventTime: "5:00 PM",
    eventPoster: null,
    eventMoreInfoLink: "https://youtu.be/8qSgEL_as4Q",
    eventHashTag: "GetitDonewiththeExperts",
    secondPageSubHeading: "The webinar is going to be a panel discussion with",
    secondPagePoints: [
      "Aanshul Sadaria",
      "Software Engineer II at Google; Institute Gold Medalist; Patent Holder (Internship at Adobe)",
      "Kunal Kushwaha",
      "CNCF Intern | Co-Founder at Code for Cause | MLH Fellowship Team Leader | GSoC Mentor",
      "Aarnav Jindal",
      "Google Kickstart top 3 percentile | CodeChef 6 star | CodeForces 1932 | SDE Cure.Fit",
      "Date: 15th November 2020",
      "Time: 5 PM",
    ],
    eventURL:
        "https://dsc.community.dev/events/details/developer-student-clubs-vellore-institute-of-technology-bhopal-presents-get-it-done-with-the-experts/",
  ),
  EventModel(
    id: 3,
    eventName: "Getting started with Google Actions",
    eventTitle: "Getting started with Google Actions",
    eventDesc:
        "Web Development still remains to be an important element of not only marketing a business, but also the way we want to portray ourselves through our portfolios, to host projects, and innumerable more uses. For you to express yourself on the internet, DSC VIT Bhopal delivers Develop your first game using JavaScript. We will ponder over frontend and backend development to give you foundational proficiency of Web Development. Further, coming to the most exciting part, we will teach you to build and deploy your first web game using Javascript..! The session will be conducted by our very own Web Lead, Smit along with the Technical Lead, Sarthak. Tune in on 22nd November, 3:00 pm",
    eventDate: "8th October",
    eventTime: "8:00 PM (IST)",
    eventDay: "Fri",
    eventPoster: null,
    eventMoreInfoLink: "https://youtu.be/-E9wT3ZAdzg",
    eventHashTag: "Assistant / Actions on Google",
    eventURL:
        "https://dsc.community.dev/events/details/developer-student-clubs-vellore-institute-of-technology-bhopal-presents-inaugural-ceremony-of-dsc-vit-bhopal/",
  ),
  EventModel(
    id: 4,
    eventName: "Information Session, DSC VIT BHOPAL",
    eventTitle: "Information Session, DSC VIT BHOPAL",
    eventDesc:
        "Developer Student Clubs are university based community groups for students interested in Google developer technologies. Students from all undergraduate or graduate programs with an interest in growing as a developer are welcome. By joining a DSC, students grow their knowledge in a peer-to-peer learning environment and build solutions for local businesses and their community.",
    eventDate: "4th October",
    eventTime: "12:00 PM",
    eventDay: "Sun",
    eventPoster: null,
    eventMoreInfoLink: "https://youtu.be/-E9wT3ZAdzg",
    eventHashTag: "InformationSession",
    secondPageSubHeading: "The Event will walk you through the following:",
    secondPagePoints: [
      "What is DSC",
      "Why you should join DSC",
      "Rules at Developer Student Club VIT",
      "Meet the Team",
      "Opportunities DSCs provide to students",
      "Topics we plan to incorporate in our sessions",
      "Events and Activities",
      "Working Methodology",
      "Perks of Joining DSC",
      "And a fun activity - Kahoot Session",
    ],
    eventURL:
        "https://dsc.community.dev/events/details/developer-student-clubs-vellore-institute-of-technology-bhopal-presents-introduction-to-open-source-and-git/",
  ),
];
