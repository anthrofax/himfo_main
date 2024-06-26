import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyView extends GetView {
  _launch() async {
    const url = 'https://www.google.com/policies/privacy/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Himtika builds the HIMFO app as a Free app. This SERVICE is provided by Himtika at no charge and is intended for internal use by University of Singaperbangsa Karawang students.\n\nThis page is used to inform visitors about my policy by collecting campus email information, only campus email information will be used in the application\n\nOther people outside the campus environment and do not have the campus email provided cannot use this application, because this application is internal and can only be used by students on campus.\n\nThe terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at HIMFO unless otherwise defined in this Privacy Policy.',
                  style: GoogleFonts.ptSerif(),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16),
                Text(
                  'Information Collection and Use',
                  style: GoogleFonts.ptSerif(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Our services will only use information in the form of campus email data and is owned by each student to be able to use our services.\n\nThis application uses third party services that may collect information used to identify you.\n\nLinks to the privacy policies of third-party service providers used by',
                  style: GoogleFonts.ptSerif(),
                  textAlign: TextAlign.justify,
                ),
                GestureDetector(
                  onTap: () => _launch(),
                  child: Text(
                    '\u2022 Google Play Services',
                    style: GoogleFonts.ptSerif(color: Colors.blue),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Log Data',
                  style: GoogleFonts.ptSerif(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'I want to let you know that whenever you use my Service, if an error occurs in the application, I collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, application configuration while using my Service, time and date of your use of the Service, and other statistics.',
                  style: GoogleFonts.ptSerif(),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16),
                Text(
                  'Cookies',
                  style: GoogleFonts.ptSerif(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  "Cookies are files with a small amount of data that is usually used as an anonymous unique identifier. These are sent to your browser from the websites you visit and are stored on your device's internal memory.\n\nThis service does not use these “cookies” explicitly. However, applications may use third party code and libraries that use cookies; to collect information and improve their services. You have the choice to accept or reject these cookies and know when a cookie is sent to your device. If you choose to refuse our cookies, you may not be able to use some parts of the Service.",
                  style: GoogleFonts.ptSerif(),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16),
                Text(
                  'Service providers',
                  style: GoogleFonts.ptSerif(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  "This service is created by the community for the needs of internal campus organizations and is not traded or used by users who come from outside the campus.\n\nOur party may obtain data or information about the user's campus email account and it will be used only for application development purposes and will not be published.",
                  style: GoogleFonts.ptSerif(),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16),
                Text(
                  'Security',
                  style: GoogleFonts.ptSerif(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  "I value your trust in providing us with your Personal Information, therefore we strive to use commercially acceptable means to protect it. But remember that no method of transmission over the internet, or method of electronic storage is 100% safe and reliable, and I cannot guarantee its absolute security.",
                  style: GoogleFonts.ptSerif(),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16),
                Text(
                  'Links to Other Sites',
                  style: GoogleFonts.ptSerif(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  "This Service may contain links to other sites. If you click on a third party link, you will be redirected to that site. Note that this external site is not operated by me. Therefore, I strongly advise you to review the Privacy Policy of this website. I have no control over and are not responsible for the content, privacy policies, or practices of any third party sites or services.",
                  style: GoogleFonts.ptSerif(),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16),
                Text(
                  "Children's Privacy",
                  style: GoogleFonts.ptSerif(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  "This service is not directed at anyone under the age of 13. I do not knowingly collect personally identifiable information from children under the age of 13. If I find that a child under 13 has provided me with personal information, I immediately delete it from our servers. If you are a parent or guardian and you become aware that your child has provided personal information to us, please contact me so that I can take the necessary action.",
                  style: GoogleFonts.ptSerif(),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16),
                Text(
                  "Changes to This Privacy Policy",
                  style: GoogleFonts.ptSerif(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  "I may update our Privacy Policy from time to time. Therefore, it is recommended that you periodically review this page for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.\n\nThis policy is effective from 2022-06-04",
                  style: GoogleFonts.ptSerif(),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16),
                Text(
                  "Contact us",
                  style: GoogleFonts.ptSerif(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  "If you have any questions or suggestions about my Privacy Policy, please feel free to contact me at himtika@unsika.ac.id.\n\n",
                  style: GoogleFonts.ptSerif(),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
