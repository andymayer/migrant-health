# Fact Sheet
# numbered_paragraph_chunk
# further_information_chunk
# indicators_chunk
# what_to_do_chunk

# How To
# before_in_preparation_chunk
# during_consultation_chunk
# after_aftercare_chunk
# indicators_chunk
# what_to_do_chunk
# consider_relevant_chunk
# symptoms_reported_chunk

ContentChunk.delete_all
ExternalResource.delete_all
FurtherInformationChunk.delete_all
Resource.delete_all


PgSearch::Document.delete_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

PgSearch::Document.create!([
  {content: "Interpreters are an invaluable resource, but can vary in availability, and accessibility. When an in-person interpreter is not available, language line can be used. Many struggle to build a rapport on the telephone and via interpreters. This section provides a few useful tips for using interpreting services effectively.", searchable_type: "Resource", searchable_id: 1},
  {content: "Some new migrants may have lived through a traumatic experience. Some have been exploited and a minority are still in exploitative situations. Whilst some people will want to talk, others will not and should not be pressured. However, identifying potential signs of trauma and abuse can help us provide appropriate support to the most vulnerable.", searchable_type: "Resource", searchable_id: 2},
  {content: "FGM is illegal and mandatory reporting now exists for under 18s. Asking sensitively about the topic can be challenging. Developing a pathway for your practice may be helpful in encouraging practitioners to ask, and knowing what to do with the response.", searchable_type: "Resource", searchable_id: 3},
  {content: "Most migrants have do not have communicable diseases, and in fact carry a low burden. However, some are at greater risk due to unstable living conditions, the journey with exposure to high risk situations, lack of vaccinations, and lack of screening. Identifying those at risk for assessment and screening is vital.", searchable_type: "Resource", searchable_id: 4},
  {content: "Purpose: To share emerging practice and learn lessons", searchable_type: "Resource", searchable_id: 5},
  {content: "This is an example of the sorts of factors practices can take into account when assessing the social needs of newly registering patients from overseas. It may help establish if they are in stable and decent living conditions, have a job or an income and if they feel ‘safe’ in their neighbourhood.", searchable_type: "Resource", searchable_id: 6}
])


FurtherInformationChunk.create!([
  {title: nil, intro: "The Department of Health has useful training videos, protcols and posters surrounding the mandatory reporting:", after: nil},
  {title: "Further Information", intro: "The Migrant Health Guide provides good information related to country of origin:", after: "See also section on immunisations. Local screening policies and clinics can be useful to compile"},
  {title: "", intro: "", after: ""}
])
ExternalResource.create!([
  {further_information_chunk_id: 1, title: "Mandatory Reporting Map", url: "https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/525405/FGM_mandatory_reporting_map_A.pdf", size: nil, resource_type: "PDF", metadata: nil},
  {further_information_chunk_id: 1, title: "Another document title with a longer name", url: "https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/525405/FGM_mandatory_reporting_map_A.pdf", size: nil, resource_type: "PDF", metadata: nil},
  {further_information_chunk_id: 1, title: "Mandatory Reporting in Healthcare", url: "https://www.gov.uk/government/publications/fgm-mandatory-reporting-in-healthcare", size: nil, resource_type: "html", metadata: nil},
  {further_information_chunk_id: 2, title: "Migrant Health Guide countries A-Z", url: "https://www.gov.uk/government/collections/migrant-health-guide-countries-a-to-z", size: nil, resource_type: "Web link", metadata: nil},
  {further_information_chunk_id: 2, title: "Communicable diseases migrant health guide", url: "https://www.gov.uk/government/collections/communicable-diseases-migrant-health-guide", size: nil, resource_type: "Web link", metadata: nil},
  {further_information_chunk_id: 3, title: "Doctors of the World Bethnal Green Clinic", url: "https://www.modernslaveryhelpline.org/", size: nil, resource_type: nil, metadata: nil}
])

BulletPointChunk.create!([
  {type: "BulletPointChunk", title: "Indicators may include", intro: "Forms of interpreting:", content: "Family Friend\nOn some occasions a family or friend may be used in a non-clinical setting\nIn a clinical setting, they should not be used to ensure privacy for the service user\nMay miss a history of violence or trafficking\nTelephone interpreting\nIn person interpreting \n", after: nil},
  {type: "BulletPointChunk", title: "What to do", intro: "Interpreting services are a useful, but expensive, resource. Following these tips can help the consultation be successful:", content: "Brief the interpreter: ask them to explain in short sentences and to only translate what you say\nAsk them to try not to explain situations themselves\nIf you are not happy with a telephone interpreter, hang up and start a new request\nSpeak to the patient, not the interpreter: i.e. maintain eye contact, don’t use the third person\n", after: nil},
  {type: "BulletPointChunk", title: "Indicators may include", intro: "Detecting victims of trafficking can be difficult. Indicators may include:", content: "Very poor sleep/nightmares\nLooks dejected\nMay appear at first to be someone who is difficult to help – nothing seems to help much\nWary of authority (or perceived authority)\nHesitant or uncomfortable with surroundings\nShows anger; dejection; fragility or unassertiveness\nInconsistencies in their account of events\nHeadache, back and neck pain and gastric problems\n'Friend' speaks for them\n", after: nil},
  {type: "BulletPointChunk", title: "What to do", intro: "Once you have identified someone may be a victim of trafficking, ensure they have a safe space to talk, away from friends and family. Listen and build up trust, without pushing them to reveal more than they are ready to. Some further tips:", content: "Treat the person with dignity and respect\nProvide a safe space for someone to talk – help to put someone at ease. Bear in mind your verbal and body language.\nRespect and reassure of confidentiality\nExplain why you are asking the questions that you are and what will be done with the information. Reassure that you do not share the information with any authorities\nIf you are concerned that someone is still in an exploitative or dangerous situation, do not write down contact numbers for the police or other sensitive services for service users to take away with them, unless you can ensure they can keep the information you provide somewhere safe - so as not to further compromise their safety.\n", after: "Having a local database of organisations to refer on to for support can help both identify these patients, and provide support following on from this."},
  {type: "BulletPointChunk", title: "Consider whether the following questions are relevant/appropriate", intro: nil, content: "Did you have to pay anyone in order to come here today?\nDo you feel safe where you are living at the moment? If not why not?\nDo you know how to contact the UK authorities like the police for help if needed? If not, offer reassurance that they can speak to the police in confidence, with an interpreter and to a female officer if need be.\nHas anyone made you do anything you didn't want to do? (that you didn’t consent to or didn’t want to do)\nDo you have any access to your documents at the moment? If not, why not? Does someone else have your documents?\nDid you use an agent to travel to the UK or elsewhere? If so, do you owe anyone any money at the moment?\nWould you like any information about how to access free, confidential sexual health services, including free HIV tests?\nDo you have a solicitor? If yes, are you comfortable with them? Do you have to pay them or anyone else any money to access them? Have you felt able to talk to them about all of your experiences?\nWould you like any further assistance or advice about services available to support you?\n", after: nil},
  {type: "BulletPointChunk", title: "Symptoms Commonly Reported Following Torture, taken from the Istanbul Protocol", intro: nil, content: "Confusion/disorientation\nMemory disturbance\nImpaired reading\nPoor concentration\nRe-experiencing the trauma\nAvoidance and emotional numbing\nHyperarousal\nSymptoms of depression\nDamaged self-concept and foreshortened future\nSomatic complaints\nSexual dysfunction\nPsychosis\nSubstance abuse\nNeuropsychological impairment\nDepressive disorders\nPost-traumatic stress disorder\nEnduring personality change\n", after: nil}
])
NumberedParagraphChunk.create!([
  {type: "NumberedParagraphChunk", title: nil, intro: nil, content: "FGM is most prevalent in 29 countries affecting more than 125 million girls and women. The attached map shows the areas with the highest prevalence: https://eliademy.com/app/pluginfile.php/302772/mod_resource/content/0/FGM%20prevalence%20map.pdf\nWhere appropriate, women should be asked if they have been a victim of FGM. Developing a pathway can be useful for this to help identify those who have been, and what to do if they have. All women from the countries of high prevalence should be asked.\nAsking questions such as ‘have you been cut?’ and ‘is it impacting on your life at the moment’? Can be useful. See the ‘how to’ guide for more information.\n", after: nil},
  {type: "NumberedParagraphChunk", title: nil, intro: nil, content: "Treatment for infectious diseases remains free of charge for all (see more on this in the entitlement section).\nInfectious diseases screening should include routine checks for HIV, hepatitis B, and full sexual health screening. If these cannot be done at the practice, ensure clear signposting or referral to the local sexual health clinic.\nTB should be considered in any patient with weight loss, cough, loss of appetite, and night sweats. Using the Migrant Health Guide (link below) to consider both relevant diseases and considerations for the country of origin can be helpful to guide the process\n", after: nil},
  {type: "NumberedParagraphChunk", title: "What did we do", intro: "", content: "We discussed it at a practice meeting, and decided to trial a picture-method of explaining the repeat prescription process for all new patients.", after: ""},
  {type: "NumberedParagraphChunk", title: "What did we do", intro: "", content: "We discussed it at a practice meeting, and decided to trial a picture-method of explaining the repeat prescription process for all new patients.", after: ""}
])
ParagraphChunk.create!([
  {type: "ParagraphChunk", title: nil, intro: nil, content: "Some new migrants may have lived through a traumatic experience. Some have been exploited and a minority are still in exploitative situations. Whilst some people will want to talk, others will not and should not be pressured. However, identifying potential signs of trauma and abuse can help us provide appropriate support to the most vulnerable.", after: nil},
  {type: "ParagraphChunk", title: "What was the problem", intro: "", content: "At our practice, we found non-English speaking patients were struggling to use the repeat prescription service. As this was at reception, we did not have an interpreter readily available to help.", after: ""},
  {type: "ParagraphChunk", title: "How did we approach it", intro: "", content: "We discussed how we could solve this, and as it was more than one language, we realised simply translating our leaflet would not be of use. We wanted to ensure equitable access to all our patients, to receive the best care, and their prescriptions on time.", after: ""},
  {type: "ParagraphChunk", title: "Did it work?", intro: "", content: "We had a good response from most patients, who found it clear and the repeat prescription process improved, with less appointments used just to request prescriptions.", after: ""},
  {type: "ParagraphChunk", title: "Recommendation", intro: "", content: "We will share our leaflet for others to trial—we found it really worked.", after: ""},
  {type: "ParagraphChunk", title: "What was the problem?", intro: "", content: "At our practice, we found non-English speaking patients were struggling to use the repeat prescription service. As this was at reception, we did not have an interpreter readily available to help.", after: ""},
  {type: "ParagraphChunk", title: "How did we approach it", intro: "", content: "We discussed how we could solve this, and as it was more than one language, we realised simply translating our leaflet would not be of use. We wanted to ensure equitable access to all our patients, to receive the best care, and their prescriptions on time.", after: ""},
  {type: "ParagraphChunk", title: "Did it work?", intro: "", content: "We had a good response from most patients, who found it clear and the repeat prescription process improved, with less appointments used just to request prescriptions.", after: ""},
  {type: "ParagraphChunk", title: "Recommendation", intro: "", content: "We will share our leaflet for others to trial—we found it really worked.", after: ""}
])
ContentChunk.create!([
  {type: "BulletPointChunk", title: "Indicators may include", intro: "Forms of interpreting:", content: "Family Friend\nOn some occasions a family or friend may be used in a non-clinical setting\nIn a clinical setting, they should not be used to ensure privacy for the service user\nMay miss a history of violence or trafficking\nTelephone interpreting\nIn person interpreting \n", after: nil},
  {type: "BulletPointChunk", title: "What to do", intro: "Interpreting services are a useful, but expensive, resource. Following these tips can help the consultation be successful:", content: "Brief the interpreter: ask them to explain in short sentences and to only translate what you say\nAsk them to try not to explain situations themselves\nIf you are not happy with a telephone interpreter, hang up and start a new request\nSpeak to the patient, not the interpreter: i.e. maintain eye contact, don’t use the third person\n", after: nil},
  {type: "ParagraphChunk", title: nil, intro: nil, content: "Some new migrants may have lived through a traumatic experience. Some have been exploited and a minority are still in exploitative situations. Whilst some people will want to talk, others will not and should not be pressured. However, identifying potential signs of trauma and abuse can help us provide appropriate support to the most vulnerable.", after: nil},
  {type: "BulletPointChunk", title: "Indicators may include", intro: "Detecting victims of trafficking can be difficult. Indicators may include:", content: "Very poor sleep/nightmares\nLooks dejected\nMay appear at first to be someone who is difficult to help – nothing seems to help much\nWary of authority (or perceived authority)\nHesitant or uncomfortable with surroundings\nShows anger; dejection; fragility or unassertiveness\nInconsistencies in their account of events\nHeadache, back and neck pain and gastric problems\n'Friend' speaks for them\n", after: nil},
  {type: "BulletPointChunk", title: "What to do", intro: "Once you have identified someone may be a victim of trafficking, ensure they have a safe space to talk, away from friends and family. Listen and build up trust, without pushing them to reveal more than they are ready to. Some further tips:", content: "Treat the person with dignity and respect\nProvide a safe space for someone to talk – help to put someone at ease. Bear in mind your verbal and body language.\nRespect and reassure of confidentiality\nExplain why you are asking the questions that you are and what will be done with the information. Reassure that you do not share the information with any authorities\nIf you are concerned that someone is still in an exploitative or dangerous situation, do not write down contact numbers for the police or other sensitive services for service users to take away with them, unless you can ensure they can keep the information you provide somewhere safe - so as not to further compromise their safety.\n", after: "Having a local database of organisations to refer on to for support can help both identify these patients, and provide support following on from this."},
  {type: "BulletPointChunk", title: "Consider whether the following questions are relevant/appropriate", intro: nil, content: "Did you have to pay anyone in order to come here today?\nDo you feel safe where you are living at the moment? If not why not?\nDo you know how to contact the UK authorities like the police for help if needed? If not, offer reassurance that they can speak to the police in confidence, with an interpreter and to a female officer if need be.\nHas anyone made you do anything you didn't want to do? (that you didn’t consent to or didn’t want to do)\nDo you have any access to your documents at the moment? If not, why not? Does someone else have your documents?\nDid you use an agent to travel to the UK or elsewhere? If so, do you owe anyone any money at the moment?\nWould you like any information about how to access free, confidential sexual health services, including free HIV tests?\nDo you have a solicitor? If yes, are you comfortable with them? Do you have to pay them or anyone else any money to access them? Have you felt able to talk to them about all of your experiences?\nWould you like any further assistance or advice about services available to support you?\n", after: nil},
  {type: "BulletPointChunk", title: "Symptoms Commonly Reported Following Torture, taken from the Istanbul Protocol", intro: nil, content: "Confusion/disorientation\nMemory disturbance\nImpaired reading\nPoor concentration\nRe-experiencing the trauma\nAvoidance and emotional numbing\nHyperarousal\nSymptoms of depression\nDamaged self-concept and foreshortened future\nSomatic complaints\nSexual dysfunction\nPsychosis\nSubstance abuse\nNeuropsychological impairment\nDepressive disorders\nPost-traumatic stress disorder\nEnduring personality change\n", after: nil},
  {type: "NumberedParagraphChunk", title: nil, intro: nil, content: "FGM is most prevalent in 29 countries affecting more than 125 million girls and women. The attached map shows the areas with the highest prevalence: https://eliademy.com/app/pluginfile.php/302772/mod_resource/content/0/FGM%20prevalence%20map.pdf\nWhere appropriate, women should be asked if they have been a victim of FGM. Developing a pathway can be useful for this to help identify those who have been, and what to do if they have. All women from the countries of high prevalence should be asked.\nAsking questions such as ‘have you been cut?’ and ‘is it impacting on your life at the moment’? Can be useful. See the ‘how to’ guide for more information.\n", after: nil},
  {type: "NumberedParagraphChunk", title: nil, intro: nil, content: "Treatment for infectious diseases remains free of charge for all (see more on this in the entitlement section).\nInfectious diseases screening should include routine checks for HIV, hepatitis B, and full sexual health screening. If these cannot be done at the practice, ensure clear signposting or referral to the local sexual health clinic.\nTB should be considered in any patient with weight loss, cough, loss of appetite, and night sweats. Using the Migrant Health Guide (link below) to consider both relevant diseases and considerations for the country of origin can be helpful to guide the process\n", after: nil},
  {type: "ParagraphChunk", title: "What was the problem", intro: "", content: "At our practice, we found non-English speaking patients were struggling to use the repeat prescription service. As this was at reception, we did not have an interpreter readily available to help.", after: ""},
  {type: "ParagraphChunk", title: "How did we approach it", intro: "", content: "We discussed how we could solve this, and as it was more than one language, we realised simply translating our leaflet would not be of use. We wanted to ensure equitable access to all our patients, to receive the best care, and their prescriptions on time.", after: ""},
  {type: "NumberedParagraphChunk", title: "What did we do", intro: "", content: "We discussed it at a practice meeting, and decided to trial a picture-method of explaining the repeat prescription process for all new patients.", after: ""},
  {type: "ParagraphChunk", title: "Did it work?", intro: "", content: "We had a good response from most patients, who found it clear and the repeat prescription process improved, with less appointments used just to request prescriptions.", after: ""},
  {type: "ParagraphChunk", title: "Recommendation", intro: "", content: "We will share our leaflet for others to trial—we found it really worked.", after: ""},
  {type: "ParagraphChunk", title: "What was the problem?", intro: "", content: "At our practice, we found non-English speaking patients were struggling to use the repeat prescription service. As this was at reception, we did not have an interpreter readily available to help.", after: ""},
  {type: "ParagraphChunk", title: "How did we approach it", intro: "", content: "We discussed how we could solve this, and as it was more than one language, we realised simply translating our leaflet would not be of use. We wanted to ensure equitable access to all our patients, to receive the best care, and their prescriptions on time.", after: ""},
  {type: "NumberedParagraphChunk", title: "What did we do", intro: "", content: "We discussed it at a practice meeting, and decided to trial a picture-method of explaining the repeat prescription process for all new patients.", after: ""},
  {type: "ParagraphChunk", title: "Did it work?", intro: "", content: "We had a good response from most patients, who found it clear and the repeat prescription process improved, with less appointments used just to request prescriptions.", after: ""},
  {type: "ParagraphChunk", title: "Recommendation", intro: "", content: "We will share our leaflet for others to trial—we found it really worked.", after: ""}
])
FactSheet.create!([
  {type: "FactSheet", title: "FGM", intro: "FGM is illegal and mandatory reporting now exists for under 18s. Asking sensitively about the topic can be challenging. Developing a pathway for your practice may be helpful in encouraging practitioners to ask, and knowing what to do with the response.", video_url: "https://www.youtube.com/embed/cRskjqpgSNs?rel=0", content_chunk_1_id: 8, content_chunk_2_id: nil, content_chunk_3_id: nil, content_chunk_4_id: nil, content_chunk_5_id: nil, content_chunk_6_id: nil, content_chunk_7_id: nil, further_information_chunk_id: 1, slug: "fgm"},
  {type: "FactSheet", title: "Infectious Diseases", intro: "Most migrants have do not have communicable diseases, and in fact carry a low burden. However, some are at greater risk due to unstable living conditions, the journey with exposure to high risk situations, lack of vaccinations, and lack of screening. Identifying those at risk for assessment and screening is vital.", video_url: "https://www.youtube.com/embed/cRskjqpgSNs?rel=0", content_chunk_1_id: 9, content_chunk_2_id: nil, content_chunk_3_id: nil, content_chunk_4_id: nil, content_chunk_5_id: nil, content_chunk_6_id: nil, content_chunk_7_id: nil, further_information_chunk_id: 2, slug: "infectious-diseases"}
])
HowTo.create!([
  {type: "HowTo", title: "How to use interpreters effectively", intro: "Interpreters are an invaluable resource, but can vary in availability, and accessibility. When an in-person interpreter is not available, language line can be used. Many struggle to build a rapport on the telephone and via interpreters. This section provides a few useful tips for using interpreting services effectively.", video_url: "https://www.youtube.com/embed/cRskjqpgSNs?rel=0", content_chunk_1_id: nil, content_chunk_2_id: nil, content_chunk_3_id: nil, content_chunk_4_id: 1, content_chunk_5_id: 2, content_chunk_6_id: nil, content_chunk_7_id: nil, further_information_chunk_id: nil, slug: "how-to-use-interpreters-effectively"},
  {type: "HowTo", title: "Recognising and responding to survivors of trauma, trafficking and exploitation", intro: "Some new migrants may have lived through a traumatic experience. Some have been exploited and a minority are still in exploitative situations. Whilst some people will want to talk, others will not and should not be pressured. However, identifying potential signs of trauma and abuse can help us provide appropriate support to the most vulnerable.", video_url: "https://www.youtube.com/embed/cRskjqpgSNs?rel=0", content_chunk_1_id: 3, content_chunk_2_id: nil, content_chunk_3_id: nil, content_chunk_4_id: 4, content_chunk_5_id: 5, content_chunk_6_id: 6, content_chunk_7_id: 7, further_information_chunk_id: nil, slug: "recognising-and-responding-to-survivors-of-trauma-trafficking-and-exploitation"}
])
PracticeExample.create!([
  {type: "PracticeExample", title: "Using Pictures To Help Non-English Speakers Understand The Repeat Prescription Process", intro: "Purpose: To share emerging practice and learn lessons", video_url: nil, content_chunk_1_id: 15, content_chunk_2_id: 16, content_chunk_3_id: 17, content_chunk_4_id: 18, content_chunk_5_id: 19, content_chunk_6_id: nil, content_chunk_7_id: nil, further_information_chunk_id: nil, slug: "using-pictures-to-help-non-english-speakers-understand-the-repeat-prescription-process"}
])
Tool.create!([
  {type: "Tool", title: "MDM Social Form For New Patient Assessment", intro: "This is an example of the sorts of factors practices can take into account when assessing the social needs of newly registering patients from overseas. It may help establish if they are in stable and decent living conditions, have a job or an income and if they feel ‘safe’ in their neighbourhood.", video_url: nil, content_chunk_1_id: nil, content_chunk_2_id: nil, content_chunk_3_id: nil, content_chunk_4_id: nil, content_chunk_5_id: nil, content_chunk_6_id: nil, content_chunk_7_id: nil, further_information_chunk_id: 3, slug: "mdm-social-form-for-new-patient-assessment"}
])



# bp1 = BulletPointChunk.create(
#   content: "Family Friend\n" +
# "On some occasions a family or friend may be used in a non-clinical setting\n" +
# "In a clinical setting, they should not be used to ensure privacy for the service user\n" +
# "May miss a history of violence or trafficking\n" +
# "Telephone interpreting\n" +
# "In person interpreting \n",
#   title: 'Indicators may include',
#   intro: 'Forms of interpreting:',
#   )

# bp2 = BulletPointChunk.create(
#   content: "Brief the interpreter: ask them to explain in short sentences and to only translate what you say\n" +
# "Ask them to try not to explain situations themselves\n" +
# "If you are not happy with a telephone interpreter, hang up and start a new request\n" +
# "Speak to the patient, not the interpreter: i.e. maintain eye contact, don’t use the third person\n",
#   title: 'What to do',
#   intro: 'Interpreting services are a useful, but expensive, resource. Following these tips can help the consultation be successful:',
#   )

# HowTo.create(
#   title: 'How to use interpreters effectively',
#   intro: 'Interpreters are an invaluable resource, but can vary in availability, and accessibility. When an in-person interpreter is not available, language line can be used. Many struggle to build a rapport on the telephone and via interpreters. This section provides a few useful tips for using interpreting services effectively.',
#   video_url: 'https://www.youtube.com/embed/cRskjqpgSNs?rel=0',
#   content_chunk_4_id: bp1.id,
#   content_chunk_5_id: bp2.id,
# )

# pc1 = ParagraphChunk.create(
#   content: "Some new migrants may have lived through a traumatic experience. Some have been exploited and a minority are still in exploitative situations. Whilst some people will want to talk, others will not and should not be pressured. However, identifying potential signs of trauma and abuse can help us provide appropriate support to the most vulnerable."
#   )

# bp1 = BulletPointChunk.create(
#   content: "Very poor sleep/nightmares\nLooks dejected\nMay appear at first to be someone who is difficult to help – nothing seems to help much\n" +
# "Wary of authority (or perceived authority)\n" +
# "Hesitant or uncomfortable with surroundings\n" +
# "Shows anger; dejection; fragility or unassertiveness\n" +
# "Inconsistencies in their account of events\n" +
# "Headache, back and neck pain and gastric problems\n" +
# "'Friend' speaks for them\n",
#   title: 'Indicators may include',
#   intro: 'Detecting victims of trafficking can be difficult. Indicators may include:',
#   )

# bp2 = BulletPointChunk.create(
#   content: "Treat the person with dignity and respect\n" +
# "Provide a safe space for someone to talk – help to put someone at ease. Bear in mind your verbal and body language.\n" +
# "Respect and reassure of confidentiality\n" +
# "Explain why you are asking the questions that you are and what will be done with the information. Reassure that you do not share the information with any authorities\n" +
# "If you are concerned that someone is still in an exploitative or dangerous situation, do not write down contact numbers for the police or other sensitive services for service users to take away with them, unless you can ensure they can keep the information you provide somewhere safe - so as not to further compromise their safety.\n",
#   title: 'What to do',
#   after: 'Having a local database of organisations to refer on to for support can help both identify these patients, and provide support following on from this.',
#   intro: 'Once you have identified someone may be a victim of trafficking, ensure they have a safe space to talk, away from friends and family. Listen and build up trust, without pushing them to reveal more than they are ready to. Some further tips:',
#   )

# bp3 = BulletPointChunk.create(
#   title: 'Consider whether the following questions are relevant/appropriate',
#     content: "Did you have to pay anyone in order to come here today?\n" +
# "Do you feel safe where you are living at the moment? If not why not?\n" +
# "Do you know how to contact the UK authorities like the police for help if needed? If not, offer reassurance that they can speak to the police in confidence, with an interpreter and to a female officer if need be.\n" +
# "Has anyone made you do anything you didn't want to do? (that you didn’t consent to or didn’t want to do)\n" +
# "Do you have any access to your documents at the moment? If not, why not? Does someone else have your documents?\n" +
# "Did you use an agent to travel to the UK or elsewhere? If so, do you owe anyone any money at the moment?\n" +
# "Would you like any information about how to access free, confidential sexual health services, including free HIV tests?\n" +
# "Do you have a solicitor? If yes, are you comfortable with them? Do you have to pay them or anyone else any money to access them? Have you felt able to talk to them about all of your experiences?\n" +
# "Would you like any further assistance or advice about services available to support you?\n"
# )

# bp4 = BulletPointChunk.create(
# title: 'Symptoms Commonly Reported Following Torture, taken from the Istanbul Protocol',
# content: "Confusion/disorientation\n" +
# "Memory disturbance\n" +
# "Impaired reading\n" +
# "Poor concentration\n" +
# "Re-experiencing the trauma\n" +
# "Avoidance and emotional numbing\n" +
# "Hyperarousal\n" +
# "Symptoms of depression\n" +
# "Damaged self-concept and foreshortened future\n" +
# "Somatic complaints\n" +
# "Sexual dysfunction\n" +
# "Psychosis\n" +
# "Substance abuse\n" +
# "Neuropsychological impairment\n" +
# "Depressive disorders\n" +
# "Post-traumatic stress disorder\n" +
# "Enduring personality change\n" )

# HowTo.create(
#   title: 'Recognising and responding to survivors of trauma, trafficking and exploitation',
#   intro: 'Some new migrants may have lived through a traumatic experience. Some have been exploited and a minority are still in exploitative situations. Whilst some people will want to talk, others will not and should not be pressured. However, identifying potential signs of trauma and abuse can help us provide appropriate support to the most vulnerable.',
#   video_url: 'https://www.youtube.com/embed/cRskjqpgSNs?rel=0',
#   content_chunk_1_id: pc1.id,
#   content_chunk_4_id: bp1.id,
#   content_chunk_5_id: bp2.id,
#   content_chunk_6_id: bp3.id,
#   content_chunk_7_id: bp4.id
# )



# fi1 = FurtherInformationChunk.create(
#   intro: 'The Department of Health has useful training videos, protcols and posters surrounding the mandatory reporting:',
# )


# ex1 = ExternalResource.create(
#   url: 'https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/525405/FGM_mandatory_reporting_map_A.pdf',
#   title: 'Mandatory Reporting Map',
#   resource_type: 'PDF'
# )

# ex2 = ExternalResource.create(
#   url: 'https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/525405/FGM_mandatory_reporting_map_A.pdf',
#   title: 'Another document title with a longer name',
#   resource_type: 'PDF'
# )

# ex3 = ExternalResource.create(
#   url: 'https://www.gov.uk/government/publications/fgm-mandatory-reporting-in-healthcare',
#   title: 'Mandatory Reporting in Healthcare',
#   resource_type: 'html'
# )

# fi1.external_resources << ex1
# fi1.external_resources << ex2
# fi1.external_resources << ex3


# np1 = NumberedParagraphChunk.create(
#   content: "FGM is most prevalent in 29 countries affecting more than 125 million girls and women. The attached map shows the areas with the highest prevalence: https://eliademy.com/app/pluginfile.php/302772/mod_resource/content/0/FGM%20prevalence%20map.pdf\n" +
#   "Where appropriate, women should be asked if they have been a victim of FGM. Developing a pathway can be useful for this to help identify those who have been, and what to do if they have. All women from the countries of high prevalence should be asked.\n" +
#   "Asking questions such as ‘have you been cut?’ and ‘is it impacting on your life at the moment’? Can be useful. See the ‘how to’ guide for more information.\n"
#   )

# FactSheet.create(
#   title: 'FGM',
#   intro: 'FGM is illegal and mandatory reporting now exists for under 18s. Asking sensitively about the topic can be challenging. Developing a pathway for your practice may be helpful in encouraging practitioners to ask, and knowing what to do with the response.',
#   video_url: 'https://www.youtube.com/embed/cRskjqpgSNs?rel=0',
#   content_chunk_1_id: np1.id,
#   further_information_chunk_id: fi1.id
# )

# p1 = NumberedParagraphChunk.create(
#   content: "Treatment for infectious diseases remains free of charge for all (see more on this in the entitlement section).\n" +
# "Infectious diseases screening should include routine checks for HIV, hepatitis B, and full sexual health screening. If these cannot be done at the practice, ensure clear signposting or referral to the local sexual health clinic.\n" +
# "TB should be considered in any patient with weight loss, cough, loss of appetite, and night sweats. Using the Migrant Health Guide (link below) to consider both relevant diseases and considerations for the country of origin can be helpful to guide the process\n"
# )

# fi2 = FurtherInformationChunk.create(
#   title: 'Further Information',
#   intro: 'The Migrant Health Guide provides good information related to country of origin:',
#   after: 'See also section on immunisations. Local screening policies and clinics can be useful to compile'
# )


# ex1 = ExternalResource.create(
#   url: 'https://www.gov.uk/government/collections/migrant-health-guide-countries-a-to-z',
#   title: 'Migrant Health Guide countries A-Z',
#   resource_type: 'Web link'
# )

# ex2 = ExternalResource.create(
#   url: 'https://www.gov.uk/government/collections/communicable-diseases-migrant-health-guide',
#   title: 'Communicable diseases migrant health guide',
#   resource_type: 'Web link'
# )

# fi2.external_resources << ex1
# fi2.external_resources << ex2

# FactSheet.create!(
#   title: 'Infectious Diseases',
#   intro: 'Most migrants have do not have communicable diseases, and in fact carry a low burden. However, some are at greater risk due to unstable living conditions, the journey with exposure to high risk situations, lack of vaccinations, and lack of screening. Identifying those at risk for assessment and screening is vital.',
#   video_url: 'https://www.youtube.com/embed/cRskjqpgSNs?rel=0',
#   content_chunk_1_id: p1.id,
#   further_information_chunk_id: fi2.id
# )


