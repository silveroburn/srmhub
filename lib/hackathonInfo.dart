class Hackathoninfo {
  String name;
  String info;

  Hackathoninfo({
    required this.name,
    required this.info
  });

  static List<Hackathoninfo> getInfo(){
    List<Hackathoninfo> info = [];
    info.add(
      Hackathoninfo(name: "DESCRIPTION", info: "This is a hackathon that aims to change the world as we see it.\n We are aiming for the head by holding the world's first open-end machine learning hackathon. \nSo, Join us and be part of the FUTURE.")
    );
    info.add(
      Hackathoninfo(name: "REWARDS", info: "WINNER: \$100000\n1st RUNNER UP: \$50000\n2nd RUNNER UP: \$25000")
    );
    info.add(
      Hackathoninfo(name: "ELIGIBILITY", info: "Max size: 4 members\nMin CGPA: 7.0\nAt least one female member in the team")
    );
    return info;
  }
}

class OrganizationInfo {
  String name;
  String info;

  OrganizationInfo({
    required this.name,
    required this.info
  });

  static List<OrganizationInfo> getInfo(){
    List<OrganizationInfo> info = [];
    info.add(
      OrganizationInfo(name: "Hackathon Stats", info: "stats of all hackathons organized")
    );
    info.add(
      OrganizationInfo(name: "Create Hackathon", info: "Create a new hackathon")
    );
    info.add(
      OrganizationInfo(name: "Settings", info: "Configure the properties")
    );
    info.add(
      OrganizationInfo(name: "Leader board", info: "Placement of all clubs")
    );
    return info;
  }
}

List<String> userMainInfo = ['Personal\nInfo', 'Browse\nHackathon', 'Past\nParticipations', 'Ranking', 'Skillset'];