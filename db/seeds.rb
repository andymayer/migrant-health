# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ContentChunk.delete_all
Resource.delete_all



pc1 = ParagraphChunk.create(
  content: "Some new migrants may have lived through a traumatic experience. Some have been exploited and a minority are still in exploitative situations. Whilst some people will want to talk, others will not and should not be pressured. However, identifying potential signs of trauma and abuse can help us provide appropriate support to the most vulnerable."
  )

bp1 = BulletPointChunk.create(
  content: "Very poor sleep/nightmares\nLooks dejected\nMay appear at first to be someone who is difficult to help – nothing seems to help much\n" +
"Wary of authority (or perceived authority)\n" +
"Hesitant or uncomfortable with surroundings\n" +
"Shows anger; dejection; fragility or unassertiveness\n" +
"Inconsistencies in their account of events\n" +
"Headache, back and neck pain and gastric problems\n" +
"'Friend' speaks for them\n",
  title: 'Indicators may include',
  intro: 'Detecting victims of trafficking can be difficult. Indicators may include:',
  )

bp2 = BulletPointChunk.create(
  content: "Treat the person with dignity and respect\n" +
"Provide a safe space for someone to talk – help to put someone at ease. Bear in mind your verbal and body language.\n" +
"Respect and reassure of confidentiality\n" +
"Explain why you are asking the questions that you are and what will be done with the information. Reassure that you do not share the information with any authorities\n" +
"If you are concerned that someone is still in an exploitative or dangerous situation, do not write down contact numbers for the police or other sensitive services for service users to take away with them, unless you can ensure they can keep the information you provide somewhere safe - so as not to further compromise their safety.\n",
  title: 'What to do',
  after: 'Having a local database of organisations to refer on to for support can help both identify these patients, and provide support following on from this.',
  intro: 'Once you have identified someone may be a victim of trafficking, ensure they have a safe space to talk, away from friends and family. Listen and build up trust, without pushing them to reveal more than they are ready to. Some further tips:',
  )

bp3 = BulletPointChunk.create(
  title: 'Consider whether the following questions are relevant/appropriate',
    content: "Did you have to pay anyone in order to come here today?\n" +
"Do you feel safe where you are living at the moment? If not why not?\n" +
"Do you know how to contact the UK authorities like the police for help if needed? If not, offer reassurance that they can speak to the police in confidence, with an interpreter and to a female officer if need be.\n" +
"Has anyone made you do anything you didn't want to do? (that you didn’t consent to or didn’t want to do)\n" +
"Do you have any access to your documents at the moment? If not, why not? Does someone else have your documents?\n" +
"Did you use an agent to travel to the UK or elsewhere? If so, do you owe anyone any money at the moment?\n" +
"Would you like any information about how to access free, confidential sexual health services, including free HIV tests?\n" +
"Do you have a solicitor? If yes, are you comfortable with them? Do you have to pay them or anyone else any money to access them? Have you felt able to talk to them about all of your experiences?\n" +
"Would you like any further assistance or advice about services available to support you?\n"
)

bp4 = BulletPointChunk.create(
title: 'Symptoms Commonly Reported Following Torture, taken from the Istanbul Protocol',
content: "Confusion/disorientation\n" +
"Memory disturbance\n" +
"Impaired reading\n" +
"Poor concentration\n" +
"Re-experiencing the trauma\n" +
"Avoidance and emotional numbing\n" +
"Hyperarousal\n" +
"Symptoms of depression\n" +
"Damaged self-concept and foreshortened future\n" +
"Somatic complaints\n" +
"Sexual dysfunction\n" +
"Psychosis\n" +
"Substance abuse\n" +
"Neuropsychological impairment\n" +
"Depressive disorders\n" +
"Post-traumatic stress disorder\n" +
"Enduring personality change\n" )

HowTo.create(
  title: 'Recognising and responding to survivors of trauma, trafficking and exploitation',
  intro: 'Some new migrants may have lived through a traumatic experience. Some have been exploited and a minority are still in exploitative situations. Whilst some people will want to talk, others will not and should not be pressured. However, identifying potential signs of trauma and abuse can help us provide appropriate support to the most vulnerable.',
  video_url: 'https://www.youtube.com/embed/cRskjqpgSNs?rel=0',
  content_chunk_1_id: pc1.id,
  content_chunk_4_id: bp1.id,
  content_chunk_5_id: bp2.id,
  content_chunk_6_id: bp3.id,
  content_chunk_7_id: bp4.id
)

HowTo.create(
  title: 'How to use interpreters effectively',
  intro: 'Interpreters are an invaluable resource, but can vary in availability, and accessibility. When an in-person interpreter is not available, language line can be used. Many struggle to build a rapport on the telephone and via interpreters. This section provides a few useful tips for using interpreting services effectively.',
  video_url: 'https://www.youtube.com/embed/cRskjqpgSNs?rel=0'
)

np1 = NumberedParagraphChunk.create(
  content: "FGM is most prevalent in 29 countries affecting more than 125 million girls and women. The attached map shows the areas with the highest prevalence: https://eliademy.com/app/pluginfile.php/302772/mod_resource/content/0/FGM%20prevalence%20map.pdf\n" +
  "Where appropriate, women should be asked if they have been a victim of FGM. Developing a pathway can be useful for this to help identify those who have been, and what to do if they have. All women from the countries of high prevalence should be asked.\n" +
  "Asking questions such as ‘have you been cut?’ and ‘is it impacting on your life at the moment’? Can be useful. See the ‘how to’ guide for more information.\n"
  )

FactSheet.create(
  title: 'FGM',
  intro: 'FGM is illegal and mandatory reporting now exists for under 18s. Asking sensitively about the topic can be challenging. Developing a pathway for your practice may be helpful in encouraging practitioners to ask, and knowing what to do with the response.',
  video_url: 'https://www.youtube.com/embed/cRskjqpgSNs?rel=0',
  content_chunk_1_id: np1.id
)

FactSheet.create(
  title: 'Infectious Diseases',
  intro: 'Most migrants have do not have communicable diseases, and in fact carry a low burden. However, some are at greater risk due to unstable living conditions, the journey with exposure to high risk situations, lack of vaccinations, and lack of screening. Identifying those at risk for assessment and screening is vital.',
)









