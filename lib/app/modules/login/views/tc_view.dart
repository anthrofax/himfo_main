import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class terms_conditionView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms & Conditions'),
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
                  'Welcome to HIMFO!',
                  style: GoogleFonts.ptSerif(),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'These terms and conditions outline the rules and regulations for the use of HIMFO.\nBy using this app we assume you accept these terms and conditions. Do not continue to use HIMFO if you do not agree to take all of the terms and conditions stated on this page.\n\nThe following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: "Client", "You" and "Your" refers to you, the person log on this website and compliant to the Company’s terms and conditions. "The Company", "Ourselves", "We", "Our" and "Us", refers to our Company. "Party", "Parties", or "Us", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client’s needs in respect of provision of the Company’s stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same. ',
                  style: GoogleFonts.ptSerif(),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'License',
                  style: GoogleFonts.ptSerif(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Unless otherwise stated, HIMFO and/or its licensors own the intellectual property rights for all material on HIMFO. All intellectual property rights are reserved. You may access this from HIMFO for your own personal use subjected to restrictions set in these terms and conditions.\n\nYou must not:\n\n\u2022 Republish material from HIMFO\n\u2022 Sell, rent or sub-license material from HIMFO\n\u2022 Reproduce, duplicate or copy material from HIMFO\n\u2022 Redistribute content from HIMFO\n\nThis Agreement shall begin on the date here of.\n\nParts of this app offer an opportunity for users to post and exchange opinions and information in certain areas of the website. HIMFO does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of HIMFO, its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, HIMFO shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.\n\nHIMFO reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.\n\nYou warrant and represent that:\n\n\u2022 You are entitled to post the Comments on our App and have all necessary licenses and consents to do so;\n\u2022 The Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party;\n\u2022 The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy\n\u2022 The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.\n\nYou hereby grant HIMFO a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.',
                  style: GoogleFonts.ptSerif(),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Hyperlinking to our App',
                  style: GoogleFonts.ptSerif(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'The following organizations may link to our App without prior written approval:\n\n\u2022 Government agencies;\n\u2022 Search engines;\n\u2022 News organizations;\n\u2022 Online directory distributors may link to our App in the same manner as they hyperlink to the Websites of other listed businesses; and\n\u2022 System wide Accredited Businesses except soliciting non-profit organizations, charity shopping malls, and charity fundraising groups which may not hyperlink to our Web site.\n\nThese organizations may link to our home page, to publications or to other App information so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products and/or services; and (c) fits within the context of the linking party’s site.\n\nWe may consider and approve other link requests from the following types of organizations:\n\n\u2022 commonly-known consumer and/or business information sources;\n\u2022 dot.com community sites;\n\u2022 associations or other groups representing charities;\n\u2022 online directory distributors;\n\u2022 internet portals;\n\u2022 accounting, law and consulting firms; and\n\u2022 educational institutions and trade associations.\n\nWe will approve link requests from these organizations if we decide that: (a) the link would not make us look unfavorably to ourselves or to our accredited businesses; (b) the organization does not have any negative records with us; (c) the benefit to us from the visibility of the hyperlink compensates the absence of HIMFO; and (d) the link is in the context of general resource information.\n\nThese organizations may link to our App so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products or services; and (c) fits within the context of the linking party’s site.\n\nIf you are one of the organizations listed in paragraph 2 above and are interested in linking to our App, you must inform us by sending an e-mail to HIMFO. Please include your name, your organization name, contact information as well as the URL of your site, a list of any URLs from which you intend to link to our App, and a list of the URLs on our site to which you would like to link. Wait 2-3 weeks for a response.\n\nApproved organizations may hyperlink to our App as follows:\n\n\u2022 By use of our corporate name; or \n\u2022 By use of the uniform resource locator being linked to; or\n\u2022 By use of any other description of our App being linked to that makes sense within the context and format of content on the linking party’s site.\n\nNo use of HIMFO is logo or other artwork will be allowed for linking absent a trademark license agreement.',
                  style: GoogleFonts.ptSerif(),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'iFrames',
                  style: GoogleFonts.ptSerif(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Without prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our App.',
                  style: GoogleFonts.ptSerif(),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Content Liability',
                  style: GoogleFonts.ptSerif(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'We shall not be hold responsible for any content that appears on your App. You agree to protect and defend us against all claims that is rising on our App. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.',
                  style: GoogleFonts.ptSerif(),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Your Privacy',
                  style: GoogleFonts.ptSerif(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Please read Privacy Policy.',
                  style: GoogleFonts.ptSerif(),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Reservation of Rights',
                  style: GoogleFonts.ptSerif(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'We reserve the right to request that you remove all links or any particular link to our App. You approve to immediately remove all links to our App upon request. We also reserve the right to amen these terms and conditions and it’s linking policy at any time. By continuously linking to our App, you agree to be bound to and follow these linking terms and conditions.',
                  style: GoogleFonts.ptSerif(),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Removal of links from our App',
                  style: GoogleFonts.ptSerif(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'If you find any link on our App that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.\n\nWe do not ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we promise to ensure that the website remains available or that the material on the website is kept up to date.',
                  style: GoogleFonts.ptSerif(),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Disclaimer',
                  style: GoogleFonts.ptSerif(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our App and the use of this website. Nothing in this disclaimer will:\n\n\u2022 limit or exclude our or your liability for death or personal injury;\n\u2022 limit or exclude our or your liability for fraud or fraudulent misrepresentation;\n\u2022 limit any of our or your liabilities in any way that is not permitted under applicable law; or\n\u2022 exclude any of our or your liabilities that may not be excluded under applicable law.\n\nThe limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.\n\nAs long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.\n\n',
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
