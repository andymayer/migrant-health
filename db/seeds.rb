# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

HowTo.create(
  title: 'Recognising and responding to survivors of trauma, trafficking and exploitation',
  intro: 'Some new migrants may have lived through a traumatic experience. Some have been exploited and a minority are still in exploitative situations. Whilst some people will want to talk, others will not and should not be pressured. However, identifying potential signs of trauma and abuse can help us provide appropriate support to the most vulnerable.',
  video_url: 'https://www.youtube.com/embed/cRskjqpgSNs?rel=0'
)

HowTo.create(
  title: 'How to use interpreters effectively',
  intro: 'Interpreters are an invaluable resource, but can vary in availability, and accessibility. When an in-person interpreter is not available, language line can be used. Many struggle to build a rapport on the telephone and via interpreters. This section provides a few useful tips for using interpreting services effectively.',
  video_url: 'https://www.youtube.com/embed/cRskjqpgSNs?rel=0'
)

FactSheet.create(
  title: 'FGM',
  intro: 'FGM is illegal and mandatory reporting now exists for under 18s. Asking sensitively about the topic can be challenging. Developing a pathway for your practice may be helpful in encouraging practitioners to ask, and knowing what to do with the response.',
  video_url: 'https://www.youtube.com/embed/cRskjqpgSNs?rel=0'
)

FactSheet.create(
  title: 'Infectious Diseases',
  intro: 'Most migrants have do not have communicable diseases, and in fact carry a low burden. However, some are at greater risk due to unstable living conditions, the journey with exposure to high risk situations, lack of vaccinations, and lack of screening. Identifying those at risk for assessment and screening is vital.',
)
