import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubae/screens/view/constants.dart';

class TermsAndConditionsPage extends StatefulWidget {
  @override
  _TermsAndConditionsPageState createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    final height = getHeight(context);

    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text("Terms and Conditions"),
      ),
      backgroundColor: Colors.black,
      body: Container(
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        height: height,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "California subscribers: You may cancel your subscription, without penalty or obligation, at any time prior to midnight of the third business day following the date you subscribed. If you subscribed using an External Service (e.g., Apple ID, Google Play), you must cancel through your External Service, as set forth in more detail in Section 8a.  If you subscribed through your Apple ID, refunds are handled by Apple/Google, not Nubae. You can request a refund from Apple through your Apple ID account on your phone or at https://getsupport.apple.com.  All other users may request a refund by contacting Nubae Customer Service at by clicking here, or by mailing or delivering a signed and dated notice that states that you, the buyer, are canceling this agreement, or words of similar effect. Please also include your name and the email address, phone number, or other unique identifier you used to sign up for your account. This notice shall be sent to: Nubae, getnubae111@gmail.com The Company’s business is conducted.  In accordance with Cal. Civ. Code §1789.3, you may report complaints to the Complaint Assistance Unit of the Division of Consumer Services of the California Department of Consumer Affairs by contacting them in writing at Consumer Information Division, 1625 North Market Blvd., Suite N112 Sacramento, CA 95834, or by telephone at (800) 952-5210.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "INTRODUCTION",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "By accessing or using Nubae services, you agree to be bound by these terms, including our Privacy Policy, so it is important that you read this agreement carefully before you create an account. We may update the terms from time to time, so you should check this page regularly for updates.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  . By accessing or using our Services on the Nubae mobile application (the “App”), (the “Website”), or any other platforms or services Nubae may offer (collectively, the “Service” or our “Services”), you agree to, and are bound by, these Terms of Use (the “Terms” or “Agreement”). This Agreement applies to anyone who accesses or uses our Services, regardless of registration or subscription status.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  .  We reserve the right to modify, amend, or change the Terms at any time. Notice of any material change will be posted on this page with an updated effective date. In certain circumstances, we may notify you of a change to the Terms via email or other means, as appropriate under the circumstances; however, you are responsible for regularly checking this page for notice of any changes. We agree that future changes will not be retroactive without your consent. Your continued use of our Services constitutes your acceptance of any change, and you will be legally bound by the updated Terms. If you do not accept a change to the terms, you should stop using our Services immediately.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "2.     ACCOUNT ELIGIBILITY; YOUR RESPONSIBILITIES",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Before you create an account on Nubae, make sure you are eligible to use our Services.  This Section also details what you can and can’t do when using the Services, as well as the rights you grant Nubae.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "By using our Services, you represent and warrant that:",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "You are at least 18 years old;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "  2.     You are legally qualified to enter a binding contract with Nuabe;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  3.     You are single or separated from your spouse;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  4.     You are not located in a country that is subject to a U.S. Government embargo, or that has been designated by the U.S. Government as a “terrorist supporting” country;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  5.     You are not on any list of individuals prohibited from conducting business with the United States;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  6.     You are not prohibited by law from using our services;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  7.     You have not have been convicted of or pled no contest to a felony or indictable offense (or crime of similar severity), a sex crime, or any crime involving violence;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  8.     You are not required to register as a sex offender with any state, federal or local sex offender registry;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  9.     You do not have more than one account on our Services; and",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  10. You have not previously been removed from our Services by us, unless you have our express written permission to create a new account.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  If at any time you cease to meet these requirements, you must immediately delete your account.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "You agree to: ",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "  •        Comply with these Terms, and check this page from time to time to ensure you are aware of any change;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Comply with all applicable laws, including without limitation, privacy laws, intellectual property laws, anti-spam laws, and regulatory requirements;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Use the latest version of the Website and/or App:",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Treat other users in a courteous and respectful manner, both on and off our Services;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Be respectful when communicating with any of our customer care representatives or other employees;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Review the Safety Tips;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Maintain a strong password and take reasonable measures to protect the security of your login information.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "You agree that you will not: ",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "  •        Misrepresent your identity, age, current or previous positions, qualifications, or affiliations with a person or entity;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Use the Services in a way that damages the Services or prevents their use by other users;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Use our Services in a way to interfere with, disrupt or negatively affect the platform, the servers, or our Services’ networks;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Use our Services for any harmful, illegal, or nefarious purpose;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Harass, bully, stalk, intimidate, assault, defame, harm or otherwise mistreat any person;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Post or share Prohibited Content (see below);",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Solicit passwords for any purpose, or personal identifying information for commercial or unlawful purposes from other users or disseminate another person’s personal information without his or her permission;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Solicit money or other items of value from another user, whether as a gift, loan, or form of compensation;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Use another user’s account;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Use our Services in relation to fraud, a pyramid scheme, or other similar practice; or",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Violate the terms of the license granted to you by Nubae(see Section 6 below).",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Disclose private or proprietary information that you do not have the right to disclose;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Copy, modify, transmit, distribute, or create any derivative works from, any Member Content or Our Content, or any copyrighted material, images, trademarks, trade names, service marks, or other intellectual property, content or proprietary information accessible through our Services without Nubae’s prior written consent;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Express or imply that any statements you make are endorsed by Nubae;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Use any robot, crawler, site search/retrieval application, proxy or other manual or automatic device, method or process to access, retrieve, index, “data mine,” or in any way reproduce or circumvent the navigational structure or presentation of our Services or its contents;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Upload viruses or other malicious code or otherwise compromise the security of our Services;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Forge headers or otherwise manipulate identifiers to disguise the origin of any information transmitted to or through our Services;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        “Frame” or “mirror” any part of our Services without Nubae's prior written authorization;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Use meta tags or code or other devices containing any reference to Nubae or the platform (or any trademark, trade name, service mark, logo or slogan of Nubae) to direct any person to any other website for any purpose;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Modify, adapt, sublicense, translate, sell, reverse engineer, decipher, decompile or otherwise disassemble any portion of our Services, or cause others to do so;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Use or develop any third-party applications that interact with our Services or Member Content or information without our written consent;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Use, access, or publish the Nubae application programming interface without our written consent;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Probe, scan or test the vulnerability of our Services or any system or network; or",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Encourage, promote, or agree to engage in any activity that violates these Terms.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Prohibited Content—Nubae prohibits uploading or sharing content that: ",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "  •        Is likely to be deemed offensive or to harass, upset, embarrass, alarm or annoy any other person;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Is obscene, pornographic, violent or otherwise may offend human dignity, or contains nudity;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Is abusive, insulting or threatening, discriminatory or that promotes or encourages racism, sexism, hatred or bigotry;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Encourages or facilitates any illegal activity including, without limitation, terrorism, inciting racial hatred or the submission of which in itself constitutes committing a criminal offense;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Is defamatory, libelous, or untrue;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Relates to commercial activities (including, without limitation, sales, competitions, promotions, and advertising, solicitation for services, “sugar daddy” or “sugar baby” relationships, links to other websites or premium line telephone numbers);",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Involves the transmission of 'junk' mail or 'spam';",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Contains any spyware, adware, viruses, corrupt files, worm programs or other malicious code designed to interrupt, damage or limit the functionality of or disrupt any software, hardware, telecommunications, networks, servers or other equipment, Trojan horse or any other material designed to damage, interfere with, wrongly intercept or expropriate any data or personal information whether from Nubae or otherwise;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Infringes upon any third party’s rights (including, without limitation, intellectual property rights and privacy rights);",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Was not written by you or was automatically generated, unless expressly authorized by Nubae;",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        Is inconsistent with the intended use of the Services; or",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "  •        May harm the reputation of Nubae or its affiliates.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                Text(
                  "The uploading or sharing of content that violates these terms (“Prohibited Content”) may result in the immediate suspension or termination of your account",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "3.     CONTENT",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "It is important that you understand your rights and responsibilities with regard to the content on our Services, including any content you provide or post.  You are expressly prohibited from posting inappropriate content",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "While using our Services, you will have access to: (i) content that you upload or provide while using our Services (“Your Content”); (ii) content that other users upload or provide while using our Services (“Member Content”); and (iii) content that Nubae provides on and through our Services (“Our Content”). In this agreement, “content” includes, without limitation, all text, images, video, audio, or other material on our Services, including information on users’ profiles and in direct messages between users.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "3a.     YOUR CONTENT",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "You are responsible for Your Content. Don’t share anything that you wouldn’t want others to see, that would violate this Agreement, or that may expose you or us to legal liability.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "You are solely responsible and liable for Your Content, and, therefore, you agree to indemnify, defend, release, and hold us harmless from any claims made in connection with Your Content.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "You represent and warrant to us that the information you provide to us or any other user is accurate, including any information submitted through Facebook or other third-party sources (if applicable), and that you will update your account information as necessary to ensure its accuracy.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "The content included on your individual profile should be relevant to the intended use of our Services. You may not display any personal contact or banking information, whether in relation to you or any other person (for example, names, home addresses or postcodes, telephone numbers, email addresses, URLs, credit/debit card or other banking details). If you choose to reveal any personal information about yourself to other users, you do so at your own risk. We encourage you to use caution in disclosing any personal information online.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Your individual profile will be visible to other people around the world, so be sure that you are comfortable sharing Your Content before you post. You acknowledge and agree that Your Content may be viewed by other users, and, notwithstanding these Terms, other users may share Your Content with third parties. By uploading Your Content, you represent and warrant to us that you have all necessary rights and licenses to do so and automatically grant us a license to use Your Content as provided under Section 7 below.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "You understand and agree that we may monitor or review Your Content, and we have the right to remove, delete, edit, limit, or block or prevent access to any of Your Content at any time in our sole discretion. Furthermore, you understand agree that we have no obligation to display or review Your Content. ",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "3b.    MEMBER CONTENT",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "While you will have access to Member Content, it is not yours and you may not copy or use Member Content for any purpose except as contemplated by these Terms.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Other users will also share content on our Services. Member Content belongs to the user who posted the content and is stored on our servers and displayed at the direction of that user.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "You do not have any rights in relation to Member Content, and you may only use Member Content to the extent that your use is consistent with our Services’ purpose of allowing use to communicate with and meet one another. You may not copy the Member Content or use Member Content for commercial purposes, to spam, to harass, or to make unlawful threats. We reserve the right to terminate your account if you misuse Member Content.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "3c.     OUR CONTENT",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Nubae⁹ owns all other content on our Services.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Any other text, content, graphics, user interfaces, trademarks, logos, sounds, artwork, images, and other intellectual property appearing on our Services is owned, controlled or licensed by us and protected by copyright, trademark and other intellectual property law rights. All rights, title, and interest in and to Our Content remains with us at all times.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "We grant you a limited license to access and use Our Content as provided under Section 6 below, and we reserve all other rights.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Member Content is subject to the terms and conditions of Sections 512(c) and/or 512(d) of the Digital Millennium Copyright Act 1998. To submit a complaint regarding Member Content that may constitute intellectual property infringement, see Section 12 (Digital Millennium Copyright Act) below",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "5.     PRIVACY",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Privacy is important to us. We have a separate policy about it that you should read.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "For information about how Nubae  collect, use, and share your personal data, please read our Privacy Policy. By using our Services, you agree that we may use your personal data in accordance with our Privacy Policy.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "6.     RIGHTS YOU ARE GRANTED BY NUBAE",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Nubae grants you the right to use and enjoy our Services, subject to these Terms.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "For as long as you comply with these Terms, Nubae grants you a personal, worldwide, royalty-free, non-assignable, non-exclusive, revocable, and non-sublicensable license to access and use our Services for purposes as intended by Nubae and permitted by these Terms and applicable laws.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "7.     RIGHTS YOU GRANT NUBAE",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "You own all of the content you provide to Nubae, but you also grant us the right to use Your Content as provided in this Agreement.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "By creating an account, you grant to Nubae a worldwide, perpetual, transferable, sub-licensable, royalty-free right and license to host, store, use, copy, display, reproduce, adapt, edit, publish, translate, modify, and distribute Your Content, including any information you authorize us to access from Facebook or other third-party source (if applicable), in whole or in part, and in any format or medium currently known or developed in the future. Nubae’s license to Your Content shall be non-exclusive, except that Nubae’s license shall be exclusive with respect to derivative works created through use of our Services. For example, Nubae would have an exclusive license to screenshots of our Services that include Your Content.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "In addition, so that Nubae can prevent the use of Your Content outside of our Services, you authorize Nubae to act on your behalf with respect to infringing uses of Your Content taken from our Services by other users or third parties. This expressly includes the authority, but not the obligation, to send notices pursuant to 17 U.S.C. § 512(c)(3) (i.e., DMCA Takedown Notices) on your behalf if Your Content is taken and used by third parties outside of our Services. Nubae is not obligated to take any action with regard to use of Your Content by other users or third parties. Nubae’s license to Your Content is subject to your rights under applicable law (for example, laws regarding personal data protection to the extent the content contains personal information as defined by those laws).",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "In consideration for Nubae allowing you to use our Services, you agree that we, our affiliates, and our third-party partners may place advertising on our Services. By submitting suggestions or feedback to Nubae regarding our Services, you agree that Nubae may use and share such feedback for any purpose without compensating you.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  " You agree that Nubae may access, preserve, and disclose your account information, including Your Content, if required to do so by law or upon a good faith belief that such access, preservation, or disclosure is reasonably necessary to: (i) comply with legal process; (ii) enforce these Terms; (iii) respond to claims that any content violates the rights of third parties; (iv) respond to your requests for customer service; or (v) protect the rights, property or personal safety of the Company or any other person.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "8.     PURCHASES AND AUTOMATICALLY RENEWING SUBSCRIPTIONS",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "You will have the opportunity to purchase products and services from Nubae. If you purchase a subscription, it will automatically renew—and you will be charged—until you cancel.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Nubae may offer products and services for purchase through iTunes, Google Play or other external services authorized by Nubae (each, an “External Service,” and any purchases made thereon, an “External Service Purchase”). Nubae may also offer products and services for purchase via credit card or other payment processors on the Website or inside the App (“Internal Purchases”). If you purchase a subscription, it will automatically renew until you cancel, in accordance with the terms disclosed to you at the time of purchase, as further described below.  If you cancel your subscription, you will continue to have access to your subscription benefits until the end of your subscription period, at which point it will expire.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Because our Services may be utilized without a subscription, canceling your subscription does not remove your profile from our Services.  If you wish to fully terminate your membership, you must terminate your membership as set forth in Section 9.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "8a. EXTERNAL SERVICE PURCHASES AND SUBSCRIPTIONS",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "External Service Purchases, including subscriptions, may be processed through the External Service, in which case those purchases must be managed through your External Service Account.  Subscriptions automatically renew until you cancel.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "When making a purchase on the Service, you may have the option to pay through an External Service, such as with your Apple ID or Google account (“your External Service Account”), and your External Service Account will be charged for the purchase in accordance with the terms disclosed to you at the time of purchase and the general terms applicable to your External Service Account. Some External Services may charge you sales tax, depending on where you live, which may change from time to time.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "If your External Service Purchase includes an automatically renewing subscription, your External Service Account will continue to be periodically charged for the subscription until you cancel. After your initial subscription commitment period, and again after any subsequent subscription period, the subscription will automatically continue for the price and time period you agreed to when subscribing.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "To cancel a subscription: If you do not want your subscription to renew automatically, or if you want to change or terminate your subscription, you must log in to your External Service Account and follow instructions to manage or cancel your subscription, even if you have otherwise deleted your account with us or if you have deleted the App from your device.  For example, if you subscribed using your Apple ID, cancellation is handled by Apple, not Nubae. To cancel a purchase made with your Apple ID, go to Settings > iTunes & App Stores > [click on your Apple ID] > View Apple ID > Subscriptions, then find your Nubae subscription and follow the instructions to cancel. You can also request assistance at https://getsupport.apple.com. Similarly, if you subscribed on Google Play, cancellation is handled by Google.  To cancel a purchase made through Google Play, launch the Google Play app on your mobile device and go to Menu > My Apps > Subscriptions, then find your Nubae subscription and follow the instructions to cancel. You can also request assistance at https://play.google.com.  If you cancel a subscription, you may continue to use the cancelled service until the end of your then-current subscription term. The subscription will not be renewed when your then-current term expires.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "If you initiate a chargeback or otherwise reverse a payment made with your External Service Account, Nubae may terminate your account immediately in its sole discretion, on the basis that you have determined that you do not want a Nubae subscription.  In the event that your chargeback or other payment reversal is overturned, please contact Customer Care. Nubae will retain all funds charged to your External Service Account until you cancel your subscription through your External Service Account. Certain users may be entitled to request a refund. See Section 8d below for more information.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                Text(
                  "8b. INTERNAL PURCHASES AND SUBSCRIPTIONS",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Internal Purchases, including subscriptions, are processed using the Payment Method you provide on the Website or App.  Subscriptions automatically renew until you cancel.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "If you make an Internal Purchase, you agree to pay the prices displayed to you for the Services you’ve selected as well as any sales or similar taxes that may be imposed on your payments (and as may change from time to time), and you authorize Nubae to charge the payment method you provide (your “Payment Method”). Nubae may correct any billing errors or mistakes even if we have already requested or received payment. If you initiate a chargeback or otherwise reverse a payment made with your Payment Method, Nubae may terminate your account immediately in its sole discretion, on the basis that you have determined that you do not want a Nubae subscription.  In the event that your chargeback or other payment reversal is overturned, please contact Getnubae111@gmail.com.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "If your Internal Purchase includes an automatically renewing subscription, your Payment Method will continue to be periodically charged for the subscription until you cancel. After your initial subscription commitment period, and again after any subsequent subscription period, your subscription will automatically continue for the price and time period you agreed to when subscribing, until you cancel.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "To cancel a subscription, log in to the App and go to Settings. If you cancel a subscription, you may continue to use the cancelled service until the end of your then-current subscription term. The subscription will not be renewed when your then-current term expires.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "You may edit your Payment Method information by using the Settings. If a payment is not successfully processed, due to expiration, insufficient funds, or otherwise, you remain responsible for any uncollected amounts and authorize us to continue billing the Payment Method, as it may be updated. This may result in a change to your payment billing dates.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "In addition, you authorize us to obtain updated or replacement expiration dates and card numbers for your credit or debit card as provided by your credit or debit card issuer. The terms of your payment will be based on your Payment Method and may be determined by agreements between you and the financial institution, credit card issuer, or other provider of your chosen Payment Method. Certain users may be entitled to request a refund. See Section 8d below for more information.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "8c. REFUNDS",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Generally, all purchases are nonrefundable. Special terms apply in Arizona, California, Connecticut, Illinois, Iowa, Minnesota, New York, North Carolina, Ohio, Rhode Island, and Wisconsin.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  " Generally, all purchases are final and nonrefundable, and there are no refunds or credits for partially used periods, except if the laws applicable in your jurisdiction provide for refunds.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "For subscribers residing in Arizona, California, Connecticut, Illinois, Iowa, Minnesota, New York, North Carolina, Ohio, Rhode Island, and Wisconsin:",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Your Right to Cancel—You may cancel your subscription, without penalty or obligation, at any time prior to midnight of the third business day following the date you subscribed. ",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "In the event that you die before the end of your subscription period, your estate shall be entitled to a refund of that portion of any payment you had made for your subscription which is allocable to the period after your death. In the event that you become disabled (such that you are unable to use our Services) before the end of your subscription period, you shall be entitled to a refund of that portion of any payment you had made for your subscription which is allocable to the period after your disability by providing the company notice in the same manner as you request a refund as described below.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "If any of the above apply to you and you subscribed using your Apple ID, your refund requests are handled by Apple, not Nubae. To request a refund, please contact your External Service directly; for example using your Apple device, go to Settings > iTunes & App Stores > [click on your Apple ID] > View Apple ID > Purchase History. Find the transaction and select “Report a Problem.” You can also request a refund at https://getsupport.apple.com.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "9.     ACCOUNT TERMINATION",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "If you no longer wish to use our Services, or if we terminate your account for any reason, here’s what you need to know.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "You can delete your account  at any time in the app, and following the instructions to cancel your membership.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "However, you will need to cancel / manage any External Service Purchases through your External Service Account (e.g., iTunes, Google Play) to avoid additional billing.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Nubae reserves the right to investigate and, if appropriate, suspend or terminate your account without a refund if you have violated these Terms, misused our Services, or behaved in a way that Nubae regards as inappropriate or unlawful, on or off our Services.  We reserve the right to make use of any personal, technological, legal, or other means available to enforce the Terms, at any time without liability and without the obligation to give you prior notice, including, but not limited to, preventing you from accessing the Services.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "If your account is terminated by you or by Nubae for any reason, these Terms continue and remain enforceable between you and Nubae, and you will not be entitled to any refund for purchases made.  Your information will be maintained and deleted in accordance with our Privacy Policy. ",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "10.   NO CRIMINAL BACKGROUND OR IDENTITY VERIFICATION CHECKS Nubae does not conduct criminal background or identity verification checks on its users. Use your best judgment when interacting with others.",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "YOU UNDERSTAND THAT NUBAE DOES NOT CONDUCT CRIMINAL BACKGROUND OR IDENTITY VERIFICATION CHECKS ON ITS USERS OR OTHERWISE INQUIRE INTO THE BACKGROUND OF ITS USERS.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "NUBAE MAKES NO REPRESENTATIONS OR WARRANTIES AS TO THE CONDUCT, IDENTITY, INTENTIONS, LEGITIMACY, OR VERACITY OF USERS. NUBAE RESERVES THE RIGHT TO CONDUCT—AND YOU AUTHORIZE NUBAE TO CONDUCT—ANY CRIMINAL BACKGROUND CHECK OR OTHER SCREENINGS (SUCH AS SEX OFFENDER REGISTER SEARCHES) AT ANY TIME USING AVAILABLE PUBLIC RECORDS, AND YOU AGREE THAT ANY INFORMATION YOU PROVIDE MAY BE USED FOR THAT PURPOSE.  IF THE COMPANY DECIDES TO CONDUCT ANY SCREENING THROUGH A CONSUMER REPORTING AGENCY, YOU HEREBY AUTHORIZE THE COMPANY TO OBTAIN AND USE A CONSUMER REPORT ABOUT YOU TO DETERMINE YOUR ELIGIBILITY UNDER THESE TERMS.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "YOU ARE SOLELY RESPONSIBLE FOR YOUR INTERACTIONS WITH OTHER USERS. SEX OFFENDER SCREENINGS AND OTHER TOOLS DO NOT GUARANTEE YOUR SAFETY AND ARE NOT A SUBSTITUTE FOR FOLLOWING THE SAFETY AND OTHER SENSIBLE SAFE PRECAUTIONS. ALWAYS USE YOUR BEST JUDGMENT AND TAKE APPROPRIATE SAFETY PRECAUTIONS WHEN COMMUNICATING WITH OR MEETING NEW PEOPLE.  COMMUNICATIONS RECEIVED THROUGH THE SERVICE, INCLUDING AUTOMATIC NOTIFICATIONS SENT BY NUBAE, MAY RESULT FROM USERS ENGAGING WITH THE SERVICE FOR IMPROPER PURPOSES, INCLUDING FRAUD, ABUSE, HARASSMENT, OR OTHER SUCH IMPROPER BEHAVIOR.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Though Nubae strives to encourage a respectful user experience, it is not responsible for the conduct of any user on or off the Service. You agree to use caution in all interactions with other users, particularly if you decide to communicate off the Service or meet in person.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "11. DISCLAIMER",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Nubae's Services are provided “as is” and we do not make, and cannot make, any representations about the content or features of our Services.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "NUBAE PROVIDES OUR SERVICES ON AN “AS IS” AND “AS AVAILABLE” BASIS AND TO THE EXTENT PERMITTED BY APPLICABLE LAW, GRANTS NO WARRANTIES OF ANY KIND, WHETHER EXPRESS, IMPLIED, STATUTORY OR OTHERWISE WITH RESPECT TO OUR SERVICES (INCLUDING ALL CONTENT CONTAINED THEREIN), INCLUDING, WITHOUT LIMITATION, ANY IMPLIED WARRANTIES OF SATISFACTORY QUALITY, MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR NON-INFRINGEMENT. NUBAE DOES NOT REPRESENT OR WARRANT THAT (A) OUR SERVICES WILL BE UNINTERRUPTED, SECURE, OR ERROR FREE, (B) ANY DEFECTS OR ERRORS IN OUR SERVICES WILL BE CORRECTED, OR (C) THAT ANY CONTENT OR INFORMATION YOU OBTAIN ON OR THROUGH OUR SERVICES WILL BE ACCURATE. FURTHERMORE, NUBAE MAKES NO GUARANTEES AS TO THE NUMBER OF ACTIVE USERS AT ANY TIME; USERS’ ABILITY OR DESIRE TO COMMUNICATE WITH OR MEET YOU, OR THE ULTIMATE COMPATIBILITY WITH OR CONDUCT BY USERS YOU MEET THROUGH THE SERVICES.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "NUBAE TAKES NO RESPONSIBILITY FOR ANY CONTENT THAT YOU OR ANOTHER USER OR THIRD PARTY POSTS, SENDS, OR RECEIVES THROUGH OUR SERVICES NOR DOES NUBAE TAKE ANY RESPONSIBILITY FOR THE IDENTITY, INTENTIONS, LEGITIMACY, OR VERACITY OF ANY USERS WITH WHOM YOU MAY COMMUNICATION THROUGH NUBAE. ANY MATERIAL DOWNLOADED OR OTHERWISE OBTAINED THROUGH THE USE OF OUR SERVICES IS ACCESSED AT YOUR OWN DISCRETION AND RISK. NUBAE IS NOT RESPONSIBLE FOR ANY DAMAGE TO YOUR COMPUTER HARDWARE, COMPUTER SOFTWARE, OR OTHER EQUIPMENT OR TECHNOLOGY INCLUDING, BUT WITHOUT LIMITATION, DAMAGE FROM ANY SECURITY BREACH OR FROM ANY VIRUS, BUGS, TAMPERING, FRAUD, ERROR, OMISSION, INTERRUPTION, DEFECT, DELAY IN OPERATION OR TRANSMISSION, COMPUTER LINE OR NETWORK FAILURE, OR ANY OTHER TECHNICAL OR OTHER MALFUNCTION.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "12. DIGITAL MILLENNIUM COPYRIGHT ACT",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "We take copyright infringement very seriously. We ask you to help us to ensure we address it promptly and effectively. ",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Nubae has adopted the following policy towards copyright infringement in accordance with the Digital Millennium Copyright Act (the “DMCA”). If you believe any Member Content or Our Content infringes upon your intellectual property rights, please submit a notification alleging such infringement (“DMCA Takedown Notice”) including the following:",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "1.     A physical or electronic signature of a person authorized to act on behalf of the owner of an exclusive right that is allegedly infringed;",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "2.     Identification of the copyrighted work claimed to have been infringed, or, if multiple copyrighted works at a single online site are covered by a single notification, a representative list of such works;",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "3.     Identification of the material claimed to be infringing or to be the subject of infringing activity and that is to be removed or access disabled and information reasonably sufficient to permit the service provider to locate the material;",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "4.     Information reasonably sufficient to permit the service provider to contact you, such as an address, telephone number, and, if available, an electronic mail;",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "5.     A statement that you have a good faith belief that use of the material in the manner complained of is not authorized by the copyright owner, its agent, or the law; and",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "6.     A statement that, under penalty of perjury, the information in the notification is accurate and you are authorized to act on behalf of the owner of the exclusive right that is allegedly infringed.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "14. LIMITATION OF LIABILITY.",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Nubae’s liability is limited to the maximum extent by applicable law.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "TO THE FULLEST EXTENT PERMITTED BY APPLICABLE LAW, IN NO EVENT WILL NUBAE, ITS AFFILIATES, EMPLOYEES, LICENSORS, OR SERVICE PROVIDERS BE LIABLE FOR ANY INDIRECT, CONSEQUENTIAL, EXEMPLARY, INCIDENTAL, SPECIAL OR PUNITIVE DAMAGES, INCLUDING, WITHOUT LIMITATION, LOSS OF PROFITS, WHETHER INCURRED DIRECTLY OR INDIRECTLY, OR ANY LOSS OF DATA, USE, GOODWILL, OR OTHER INTANGIBLE LOSSES, RESULTING FROM: (I) YOUR ACCESS TO OR USE OF OR INABILITY TO ACCESS OR USE THE SERVICES, (II) THE CONDUCT OR CONTENT OF OTHER USERS OR THIRD PARTIES ON, THROUGH, OR FOLLOWING USE OF THE SERVICES; OR (III) UNAUTHORIZED ACCESS, USE, OR ALTERATION OF YOUR CONTENT, EVEN IF NUBAE HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. IN NO EVENT WILL NUBAE’S AGGREGATE LIABILITY TO YOU FOR ALL CLAIMS RELATING TO THE SERVICES EXCEED THE AMOUNT PAID, IF ANY, BY YOU TO NUBAE FOR THE SERVICES WHILE YOU HAVE AN ACCOUNT.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "THE LIMITATION OF LIABILITY PROVISIONS SET FORTH IN THIS SECTION 14 SHALL APPLY EVEN IF YOUR REMEDIES UNDER THIS AGREEMENT FAIL WITH RESPECT TO THEIR ESSENTIAL PURPOSE.SOME JURISDICTIONS DO NOT ALLOW THE EXCLUSION OR LIMITATION OF CERTAIN DAMAGES, SO SOME OR ALL OF THE EXCLUSIONS AND LIMITATIONS IN THIS SECTION MAY NOT APPLY TO YOU.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "15. DISPUTE RESOLUTION",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "In the unlikely event that we have a legal dispute, here is what you need to know.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "If you are dissatisfied with our Services for any reason, please contact Nubae at Getnubae111@gmail.com first so that we can try to resolve your concerns without the need of outside assistance. If you choose to pursue a claim against Nubae, these terms will apply.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  " 16. INDEMNITY BY YOU",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "You agree to indemnify Nubae if a claim is made against Nubae due to your actions.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "You agree, to the extent permitted under applicable law, to indemnify, defend, and hold harmless Nubae, our affiliates, and their and our respective officers, directors, agents, and employees from and against any and all complaints, demands, claims, damages, losses, costs, liabilities, and expenses, including attorney’s fees, due to, arising out of, or relating in any way to your access to or use of our Services, Your Content, Your conduct toward other users, or your breach of this Agreement",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "17. ACCEPTANCE OF TERMS",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "By using our Services, you accept the Terms of this Agreement.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "By using our Services, whether through a mobile device, mobile application, or computer, you agree to be bound by (i) these Terms, which we may amend from time to time, (ii) our Privacy Policy and (iii) any Additional Terms Upon Purchase. If you do not accept and agree to be bound by all of the terms of this Agreement, please do not use our Services.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "18. ENTIRE AGREEMENT",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "This Agreement supersedes any previous agreements or representations.  ",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "These Terms, with the Privacy Policy, Cookie Policy, and any Additional Terms Upon Purchase, contain the entire agreement between you and Nubae regarding the use of our Services. The Terms supersede all previous agreements, representations, and arrangements between us, written or oral. If any provision of these Terms is held invalid, illegal, or otherwise unenforceable, the remainder of the Terms shall continue in full force and effect. The failure of the Company to exercise or enforce any right or provision of these Terms shall not constitute a waiver of such right or provision. You agree that your Nubae account is non-transferable and all of your rights to your account and its content terminate upon your death, unless otherwise provided by law. Any rights and licenses granted hereunder, may not be transferred or assigned by you, but may be assigned by us without restriction. No agency, partnership, joint venture, fiduciary or other special relationship or employment is created as a result of these Terms, and you may not make any representations on behalf of or bind Nubae in any manner.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Your Right to Cancel—You may cancel your subscription, without penalty or obligation, at any time prior to midnight of the third business day following the date you subscribed. In the event that you die before the end of your subscription period, your estate shall be entitled to a refund of that portion of any payment you had made for your subscription which is allocable to the period after your death. In the event that you become disabled (such that you are unable to use our Services) before the end of your subscription period, you shall be entitled to a refund of that portion of any payment you had made for your subscription which is allocable to the period after your disability by providing the company notice in the same manner as you request a refund as described above in Section 8.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white60),
                ),
              ]),
        ),
      ),
    );
  }
}
