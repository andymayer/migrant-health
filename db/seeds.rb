

ContentChunk.delete_all
ExternalResource.delete_all
FurtherInformationChunk.delete_all
Resource.delete_all
Vote.delete_all
Comment.delete_all
Answer.delete_all
Question.delete_all

User.delete_all

ActsAsTaggableOn::Tag.delete_all

PgSearch::Document.delete_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

admin = User.create(
  email:    ENV['SUPERUSER_EMAIL']    || 'developers@yoomee.com',
  password: ENV['SUPERUSER_PASSWORD'] || 'weather-medley-impiety-onerous',
  role: :admin,
  title: '',
  first_name: 'Admin',
  last_name: 'YooMee'
)

user = User.create(
  email:    'developers+normal@yoomee.com',
  password: 'weather-medley-impiety-onerous',
  role: :user,
  title: '',
  first_name: 'Normal User',
  last_name: 'YooMee'
)

user2 = User.create(
  email:    'developers+normal2@yoomee.com',
  password: 'weather-medley-impiety-onerous',
  role: :user,
  title: '',
  first_name: 'Normal User 2',
  last_name: 'YooMee'
)

FurtherInformationChunk.create!([
  {title: nil, intro: "The Department of Health has useful training videos, protcols and posters surrounding the mandatory reporting:", after: nil},
  {title: "Further Information", intro: "The Migrant Health Guide provides good information related to country of origin:", after: "See also section on immunisations. Local screening policies and clinics can be useful to compile"},
  {title: "", intro: "", after: ""},
  {title: "Resources", intro: "", after: ""}
])
ExternalResource.create!([
  {further_information_chunk_id: 1, title: "Mandatory Reporting Map", url: "https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/525405/FGM_mandatory_reporting_map_A.pdf", size: nil, resource_type: "PDF", metadata: nil},
  {further_information_chunk_id: 1, title: "Another document title with a longer name", url: "https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/525405/FGM_mandatory_reporting_map_A.pdf", size: nil, resource_type: "PDF", metadata: nil},
  {further_information_chunk_id: 1, title: "Mandatory Reporting in Healthcare", url: "https://www.gov.uk/government/publications/fgm-mandatory-reporting-in-healthcare", size: nil, resource_type: "html", metadata: nil},
  {further_information_chunk_id: 2, title: "Migrant Health Guide countries A-Z", url: "https://www.gov.uk/government/collections/migrant-health-guide-countries-a-to-z", size: nil, resource_type: "Web link", metadata: nil},
  {further_information_chunk_id: 2, title: "Communicable diseases migrant health guide", url: "https://www.gov.uk/government/collections/communicable-diseases-migrant-health-guide", size: nil, resource_type: "Web link", metadata: nil},
  {further_information_chunk_id: 3, title: "Doctors of the World Bethnal Green Clinic", url: "https://www.modernslaveryhelpline.org/", size: nil, resource_type: nil, metadata: nil},
  {further_information_chunk_id: 4, title: "Doctors of the World Bethnal Green Clinic", url: "https://www.modernslaveryhelpline.org/", size: nil, resource_type: nil, metadata: nil}
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

Resources::FactSheet.create!([
  {title: "FGM", contributed_by: "Dr Brown long name\nDr Smith\nDr Green", intro: "FGM is illegal and mandatory reporting now exists for under 18s. Asking sensitively about the topic can be challenging. Developing a pathway for your practice may be helpful in encouraging practitioners to ask, and knowing what to do with the response.", video_url: "https://www.youtube.com/embed/cRskjqpgSNs?rel=0", content_chunk_1_id: 8, content_chunk_2_id: nil, content_chunk_3_id: nil, content_chunk_4_id: nil, content_chunk_5_id: nil, content_chunk_6_id: nil, content_chunk_7_id: nil, further_information_chunk_id: 1, slug: "fgm"},
  {title: "Infectious Diseases", contributed_by: "Dr Brown long name\nDr Smith\nDr Green", intro: "Most migrants have do not have communicable diseases, and in fact carry a low burden. However, some are at greater risk due to unstable living conditions, the journey with exposure to high risk situations, lack of vaccinations, and lack of screening. Identifying those at risk for assessment and screening is vital.", video_url: "https://www.youtube.com/embed/cRskjqpgSNs?rel=0", content_chunk_1_id: 9, content_chunk_2_id: nil, content_chunk_3_id: nil, content_chunk_4_id: nil, content_chunk_5_id: nil, content_chunk_6_id: nil, content_chunk_7_id: nil, further_information_chunk_id: 2, slug: "infectious-diseases"}
])
Resources::HowTo.create!([
  {title: "How to use interpreters effectively", contributed_by: "Dr Brown long name\nDr Smith\nDr Green",  intro: "Interpreters are an invaluable resource, but can vary in availability, and accessibility. When an in-person interpreter is not available, language line can be used. Many struggle to build a rapport on the telephone and via interpreters. This section provides a few useful tips for using interpreting services effectively.", video_url: "https://www.youtube.com/embed/cRskjqpgSNs?rel=0", content_chunk_1_id: nil, content_chunk_2_id: nil, content_chunk_3_id: nil, content_chunk_4_id: 1, content_chunk_5_id: 2, content_chunk_6_id: nil, content_chunk_7_id: nil, further_information_chunk_id: nil, slug: "how-to-use-interpreters-effectively"},
  {title: "Recognising and responding to survivors of trauma, trafficking and exploitation", contributed_by: "Dr Brown long name\nDr Smith\nDr Green", intro: "Some new migrants may have lived through a traumatic experience. Some have been exploited and a minority are still in exploitative situations. Whilst some people will want to talk, others will not and should not be pressured. However, identifying potential signs of trauma and abuse can help us provide appropriate support to the most vulnerable.", video_url: "https://www.youtube.com/embed/cRskjqpgSNs?rel=0", content_chunk_1_id: 3, content_chunk_2_id: nil, content_chunk_3_id: nil, content_chunk_4_id: 4, content_chunk_5_id: 5, content_chunk_6_id: 6, content_chunk_7_id: 7, further_information_chunk_id: 4, slug: "recognising-and-responding-to-survivors-of-trauma-trafficking-and-exploitation"}
])
Resources::PracticeExample.create!([
  {title: "Using Pictures To Help Non-English Speakers Understand The Repeat Prescription Process", contributed_by: "Dr Brown long name\nDr Smith\nDr Green", intro: "Purpose: To share emerging practice and learn lessons", video_url: nil, content_chunk_1_id: 15, content_chunk_2_id: 16, content_chunk_3_id: 17, content_chunk_4_id: 18, content_chunk_5_id: 19, content_chunk_6_id: nil, content_chunk_7_id: nil, further_information_chunk_id: nil, slug: "using-pictures-to-help-non-english-speakers-understand-the-repeat-prescription-process"}
])
Resources::Tool.create!([
  {title: "MDM Social Form For New Patient Assessment", contributed_by: "Dr Brown long name\nDr Smith\nDr Green", intro: "This is an example of the sorts of factors practices can take into account when assessing the social needs of newly registering patients from overseas. It may help establish if they are in stable and decent living conditions, have a job or an income and if they feel ‘safe’ in their neighbourhood.", video_url: nil, content_chunk_1_id: nil, content_chunk_2_id: nil, content_chunk_3_id: nil, content_chunk_4_id: nil, content_chunk_5_id: nil, content_chunk_6_id: nil, content_chunk_7_id: nil, further_information_chunk_id: 3, slug: "mdm-social-form-for-new-patient-assessment"}
])

ActsAsTaggableOn::Tag.create(name: "Immigration status", description: "Understanding the difference between an asylum seeker, failing asylum seeker, refugee, and undocumented migrant.")
ActsAsTaggableOn::Tag.create(name: "Entitlements to Primary Care", description: "Explanation of entitlements of primary care in England.")
ActsAsTaggableOn::Tag.create(name: "Entitlements to Secondary Care", description: "Explanation of entitlements of primary care in England.")
ActsAsTaggableOn::Tag.create(name: "Screening", description: "Screening considerations for new migrant patients")
ActsAsTaggableOn::Tag.create(name: "Trauma trafficking and victims of exploitation", description: "When and how to ask about difficult topics, and what to do with the answer")
ActsAsTaggableOn::Tag.create(name: "FGM", description: "Latest guidance on FGM")
ActsAsTaggableOn::Tag.create(name: "Safeguarding", description: "Safeguarding issues particularly relevant to migrant patients")
ActsAsTaggableOn::Tag.create(name: "Infectious diseases", description: "Consideration of infectious diseases testing")
ActsAsTaggableOn::Tag.create(name: "Health check", description: "Patient’s health check at first contact")
ActsAsTaggableOn::Tag.create(name: "First appointment", description: "Suggested checklist for the first appointment with a GP")
ActsAsTaggableOn::Tag.create(name: "Using interpreters", description: "Using interpreters in person and on the phone")
ActsAsTaggableOn::Tag.create(name: "Social assessment", description: "Importance of holistic assessment")
ActsAsTaggableOn::Tag.create(name: "Social prescribing", description: "Details of national, and local, organisations")
ActsAsTaggableOn::Tag.create(name: "Case studies", description: "Case studies from Doctors of the World clinic, and GP practices")
ActsAsTaggableOn::Tag.create(name: "Sharing good practice", description: "Domain to ask questions and post answers, as well as sharing examples of good practice in your own surgery")
ActsAsTaggableOn::Tag.create(name: "Registration", description: "Becoming registered at a GP practice")
ActsAsTaggableOn::Tag.create(name: "Hep B", description: "Hepatitis B")
ActsAsTaggableOn::Tag.create(name: "HIV/AIDS")
ActsAsTaggableOn::Tag.create(name: "TB", description: "Tuberculosis")
ActsAsTaggableOn::Tag.create(name: "BBV", description: "Blood Bourne Virus")
ActsAsTaggableOn::Tag.create(name: "Antenatal care")
ActsAsTaggableOn::Tag.create(name: "Maternity care")
ActsAsTaggableOn::Tag.create(name: "NHS Charging")
ActsAsTaggableOn::Tag.create(name: "Immigration")
ActsAsTaggableOn::Tag.create(name: "Asylum seeker")
ActsAsTaggableOn::Tag.create(name: "Refugee")
ActsAsTaggableOn::Tag.create(name: "Economic migration")
ActsAsTaggableOn::Tag.create(name: "GP burnout")
ActsAsTaggableOn::Tag.create(name: "Secondary trauma")
ActsAsTaggableOn::Tag.create(name: "CCG", description: "Clinical Commissioning Group")
ActsAsTaggableOn::Tag.create(name: "Funding", description: "Funding")
ActsAsTaggableOn::Tag.create(name: "QOF", description: "QOF")
ActsAsTaggableOn::Tag.create(name: "Quality Outcomes Framework")
ActsAsTaggableOn::Tag.create(name: "Leave to remain")
ActsAsTaggableOn::Tag.create(name: "Failed asylum application")
ActsAsTaggableOn::Tag.create(name: "Practice manager")
ActsAsTaggableOn::Tag.create(name: "Receptionist staff")
ActsAsTaggableOn::Tag.create(name: "Protocols")
ActsAsTaggableOn::Tag.create(name: "Modern slavery")

ActsAsTaggableOn::Tagging.create!([
  {tag_id: 38, taggable_type: "Resource", taggable_id: 1, tagger_type: nil, tagger_id: nil, context: "topics"},
  {tag_id: 39, taggable_type: "Resource", taggable_id: 1, tagger_type: nil, tagger_id: nil, context: "topics"},
  {tag_id: 3, taggable_type: "Resource", taggable_id: 1, tagger_type: nil, tagger_id: nil, context: "topics"},
  {tag_id: 4, taggable_type: "Resource", taggable_id: 2, tagger_type: nil, tagger_id: nil, context: "topics"},
  {tag_id: 7, taggable_type: "Resource", taggable_id: 2, tagger_type: nil, tagger_id: nil, context: "topics"},
  {tag_id: 8, taggable_type: "Resource", taggable_id: 2, tagger_type: nil, tagger_id: nil, context: "topics"},
  {tag_id: 1, taggable_type: "Resource", taggable_id: 3, tagger_type: nil, tagger_id: nil, context: "topics"},
  {tag_id: 10, taggable_type: "Resource", taggable_id: 3, tagger_type: nil, tagger_id: nil, context: "topics"},
  {tag_id: 11, taggable_type: "Resource", taggable_id: 3, tagger_type: nil, tagger_id: nil, context: "topics"},
  {tag_id: 24, taggable_type: "Resource", taggable_id: 3, tagger_type: nil, tagger_id: nil, context: "topics"},
  {tag_id: 39, taggable_type: "Resource", taggable_id: 3, tagger_type: nil, tagger_id: nil, context: "topics"},
  {tag_id: 34, taggable_type: "Resource", taggable_id: 4, tagger_type: nil, tagger_id: nil, context: "topics"},
  {tag_id: 5, taggable_type: "Resource", taggable_id: 4, tagger_type: nil, tagger_id: nil, context: "topics"},
  {tag_id: 39, taggable_type: "Resource", taggable_id: 4, tagger_type: nil, tagger_id: nil, context: "topics"},
  {tag_id: 15, taggable_type: "Resource", taggable_id: 5, tagger_type: nil, tagger_id: nil, context: "topics"},
  {tag_id: 23, taggable_type: "Resource", taggable_id: 5, tagger_type: nil, tagger_id: nil, context: "topics"},
  {tag_id: 37, taggable_type: "Resource", taggable_id: 5, tagger_type: nil, tagger_id: nil, context: "topics"},
  {tag_id: 11, taggable_type: "Resource", taggable_id: 5, tagger_type: nil, tagger_id: nil, context: "topics"},
  {tag_id: 12, taggable_type: "Resource", taggable_id: 6, tagger_type: nil, tagger_id: nil, context: "topics"},
  {tag_id: 14, taggable_type: "Resource", taggable_id: 6, tagger_type: nil, tagger_id: nil, context: "topics"},
  {tag_id: 16, taggable_type: "Resource", taggable_id: 6, tagger_type: nil, tagger_id: nil, context: "topics"},
  {tag_id: 10, taggable_type: "Resource", taggable_id: 6, tagger_type: nil, tagger_id: nil, context: "topics"}
])

q1 = Question.create(
  user: user,
  content: 'What is the difference between an asylum seeker and a refugee? What is an illegal migrant?'
)

Answer.create(
  user: admin,
  question: q1,
  content: "Migration status can be confusing, and getting the terms right is important as it affects healthcare entitlement. The section on immigration status provides clarity on this.)")

Answer.create(
  user: user2,
  question: q1,
  content: "There is no difference between asylum seeker and refugee status. Any illegal migrant is anyone else."
  )

q2 = Question.create(
  user: user,
  content: 'How do I know what immunisations a new migrant patient needs, and what they might have already had?'
)

Answer.create(
  user: user2,
  question: q2,
  content: "You should assume that patients aren’t immunised, unless they can give a reliable history. There is useful guidance on the Migrant Health Guide here: https://www.gov.uk/guidance/immunisation-migrant-health-guide "
  )


Answer.create(
  user: admin,
  question: q2,
  content: "Migrants should follow the immunisation schedule of their country of origin. "
  )

Answer.create(
  user: user2,
  question: q2,
  content: "There is no point vaccinating new migrants as they have been exposed to disease in the past."
  )




