# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?

  def truncate_table table_name
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table_name} CASCADE")
    ActiveRecord::Base.connection.execute("ALTER SEQUENCE #{table_name}_id_seq RESTART WITH 1")
    puts "XXX Truncated Table #{table_name}"
  end

  truncate_table :articles

  # 30.times do

  #   article = Article.new

  #   article.title = FFaker::Lorem.phrase.titleize
  #   article.summary = FFaker::Lorem.paragraphs.join("<br><br>")
  #   article.url = FFaker::Internet.http_url
  #   article.author = FFaker::Name.name
  #   article.published_at = FFaker::Time.date
  #   article.publication = FFaker::Company.name
  #   article.published = true

  #   article.save!
  # end

end

Article.create(
 url: "http://www.theatlantic.com/health/archive/2015/03/the-power-of-good-enough/387388/",
 title: "The Power of ‘Good Enough’",
 subtitle: "How settling can make people happier and more satisfied than gunning for “the best”",
 author: "OLGA KHAZAN",
 publication: "The Atlantic",
 summary: "<p>&ldquo;&lsquo;Choice overload,&rsquo; . . . makes us question our decisions, set our expectations too high, and blame ourselves for our mistakes.&rdquo;</p>\r\n<p>&ldquo; . . . just settle for &lsquo;good enough.&rsquo; People who do this are called &lsquo;satisficers,&rsquo; and they're consistently happier . . . than are &lsquo;maximizers,&rsquo; people who feel that they must choose the very best possible option. Maximizers earn more . . . but they're also less satisfied with their jobs. In fact, they're more likely to be clinically depressed in general.&rdquo;</p>\r\n<p>&ldquo;As people have contact with items of high quality, they begin to suffer from &lsquo;the curse of discernment.&rsquo; The lower quality items that used to be perfectly acceptable are no longer good enough. The hedonic zero point keeps rising, and expectations and aspirations rise with it. As a result, the rising quality of experience is met with rising expectations, and people are just running in place. As long as expectations keep pace with realizations, people may live better, but they won&rsquo;t feel better about how they live.&rdquo;</p>\r\n<p>&ldquo;It can be hard, in our culture, to force yourself to settle for &lsquo;good enough.&rsquo; But when it comes to happiness and satisfaction, &lsquo;good enough&rsquo; isn't just good&mdash;it's perfect.&rdquo;</p>",
 published_at: DateTime.parse('Thu, 19 Mar 2015 18:00:00 MDT -06:00').utc.to_date,
 published: true
)

Article.create(
 url: "http://qz.com/386166/how-successful-people-work-less-and-get-more-done/",
 title: "How successful people work less—and get more done",
 author: "Travis Bradberry",
 publication: "Quartz",
 summary: "<p>A 2014 study from Stanford &ldquo;found that productivity per hour declines sharply when the workweek exceeds 50 hours, and productivity drops off so much after 55 hours that there&rsquo;s no point in working any more. That&rsquo;s right, people who work as much as 70 hours (or more) per week actually get the same amount done as people who work 55 hours.&rdquo;</p>\r\n<p>This suggests that working on the weekend is a less productive use of our time than taking a break from the day-to-day to reflect and think more expansively/deeply about our work &mdash; or just as well forget about work entirely and relax and rejuvenate.</p>\r\n<p>&ldquo;The following list contains 10 things that successful people do to find balance on the weekend and to come into work at 110% on Monday morning.&rdquo;</p>\r\n<ol>\r\n<li>They disconnect</li>\r\n<li>They minimize chores</li>\r\n<li>They reflect</li>\r\n<li>They exercise</li>\r\n<li>They pursue a passion</li>\r\n<li>They spend quality time with family</li>\r\n<li>They schedule micro-adventures</li>\r\n<li>They wake up at the same time</li>\r\n<li>They designate mornings as&nbsp;&ldquo;me time&rdquo;</li>\r\n<li>They prepare for the upcoming week</li>\r\n</ol>",
 published_at: DateTime.parse('Sat, 18 Apr 2015 18:00:00 MDT -06:00').utc.to_date,
 published: true
)

Article.create(
 url: "https://www.theguardian.com/society/2015/apr/01/future-of-loneliness-internet-isolation",
 title: "The future of loneliness",
 subtitle: "As we moved our lives online, the internet promised an end to isolation. But can we find real intimacy amid shifting identities and permanent surveillance?",
 author: "Olivia Laing",
 publication: "The Guardian",
 summary: "<p>&ldquo;Loneliness centres on the act of being seen. When a person is lonely, they long to be witnessed, accepted, desired, at the same time as becoming intensely wary of exposure. According to research carried out over the past decade at the University of Chicago, the feeling of loneliness triggers what psychologists call hypervigilance for social threat. In this state, which is entered into unknowingly, the individual becomes hyperalert to rejection, growing increasingly inclined to perceive social interactions as tinged with hostility or scorn. The result is a vicious circle of withdrawal, in which the lonely person becomes increasingly suspicious, intensifying their sense of isolation.</p>\r\n<p>&ldquo;This is where online engagement seems to exercise its special charm. Hidden behind a computer screen, the lonely person has control. They can search for company without the danger of being revealed or found wanting. They can reach out or they can hide; they can lurk and they can show themselves, safe from the humiliation of face-to-face rejection. The screen acts as a kind of protective membrane, a scrim that allows invisibility and transformation. You can filter your image, concealing unattractive elements, and you can emerge enhanced: an online avatar designed to attract likes. But now a problem arises, for the contact this produces is not the same thing as intimacy. Curating a perfected self might win followers or Facebook friends, but it will not necessarily cure loneliness, since the cure for loneliness is not being looked at, but being seen and accepted as a whole person &ndash; ugly, unhappy and awkward, as well as radiant and selfie-ready.&rdquo;</p>\r\n<p>&ldquo;We are embodied but we are also networks, living on inside machines and in other people&rsquo;s heads; memories and data streams. We are being watched and we do not have control. We long for contact and it makes us afraid. But as long as we are still capable of feeling and expressing vulnerability, intimacy stands a chance.&rdquo;</p>",
 published_at: DateTime.parse('Tue, 31 Mar 2015 18:00:00 MDT -06:00').utc.to_date,
 published: true
)

Article.create(
 url: "https://www.theguardian.com/science/2016/jun/22/secret-of-taste-why-we-like-what-we-like",
 title: "The secret of taste: why we like what we like",
 subtitle: "How does a song we dislike at first hearing become a favourite? And when we try to look different, how come we end up looking like everyone else?",
 author: "Tom Vanderbilt",
 publication: "The Guardian",
 summary: "<p>We like what&rsquo;s new, and what&rsquo;s familiar. We want to belong, and to be distinct.</p>\r\n<p>&ldquo;So, novelty or familiarity? As is often the case, the answer lies somewhere in between, on the midway point of some optimal U-shaped curve plotting the new and the known. The noted industrial designer Raymond Loewy sensed this optimum in what he termed the &lsquo;MAYA stage&rsquo;, for &lsquo;most advanced, yet acceptable&rsquo;. This was the moment in a product design cycle when, Loewy argued, &lsquo;resistance to the unfamiliar reaches the threshold of a shock-zone and resistance to buying sets in&rsquo;. We like the new as long as it reminds us in some way of the old.&rdquo;</p>\r\n<p>When we experience something exceedingly unfamiliar, we often dislike it. Over time we may come to understand it, appreciate it, perhaps love it.</p>\r\n<p>&ldquo; . . . oscillations of novelty and familiarity, of hunger and satiation . . . the subtle movements of people trying to be like each other and people trying to be different from each other&rdquo; drive the perpetual cycle of taste.</p>\r\n<p>We want to be different as individuals. &ldquo;But in wanting to express that difference, &nbsp;[we seek] out others who share those differences. [We conform] to the group, but the conformists of that group, in being alike, increase their sense of difference from other groups . . . . &rdquo;</p>\r\n<p>&ldquo;&lsquo;Living and working online, people have perhaps never copied each other so profusely (since it usually costs nothing), so accurately, and so indiscriminately.&rsquo;</p>\r\n<p>&ldquo;But how do we know what to copy and from whom? The old ways of knowing what we should like &ndash; everything from radio station programmers to restaurant guides to book critics to brands themselves &ndash; have been supplanted by a mass of individuals, connected but apart, unified but disparate.</p>\r\n<p>&ldquo;Whom to follow? What to choose? Whom can you trust? In an infinite realm of choice, our choices often seem to cluster towards those we can see others making (but away from those we sense too many are choosing). When there is too much social influence, people start to think more like one another. They take less information into account to make their decisions, yet are more confident that what they are thinking is the truth &ndash; because more people seem to think that way.</p>\r\n<p>&ldquo;Social imitation has got easier, faster, and more volatile; all those micro-motives of trying to be like others and yet different can intensify into explosive bursts of macro-behaviour. The big waves have got bigger, and we know that they will come, but it is harder to tell from where, in the vast and random ocean surface, they will swell.&rdquo;</p>",
 published_at: DateTime.parse('Tue, 21 Jun 2016 18:00:00 MDT -06:00').utc.to_date,
 published: true
)

Article.create(
 url: "http://www.npr.org/sections/health-shots/2016/06/24/481859662/invisibilia-is-your-personality-fixed-or-can-you-change-who-you-are",
 title: "Invisibilia: Is Your Personality Fixed, Or Can You Change Who You Are?",
 author: "ALIX SPIEGEL",
 publication: "NPR",
 summary: "<p>Our personality traits are not consistent. They vary over time and across contexts and circumstances.</p>\r\n<p>&ldquo;&lsquo;People are predictable, that's true,&rsquo; . . . &lsquo;But they're predictable because we see them in situations where their behavior is constrained by that situation and the roles they're occupying and the relationships they have with us.&rsquo;&rdquo;</p>\r\n<p>&ldquo;We realize the outside world can change in a heartbeat, &lsquo;but when it comes to human beings, we really don't have tolerance for realizing that there is an enormous amount of instability.&rsquo;</p>\r\n<p>&ldquo;Still, we're not slaves to that instability. Traits and life situations both affect our behavior, Mischel says. But so do our minds.</p>\r\n<p>&ldquo;The beliefs, assumptions, expectations that you've gotten from your friends, family, culture &mdash; those things, Mischel explains, are the filter through which you see the world. Your mind stands between who you are, your personality and whatever situation you are in. It interprets the world around it, and how it feels about what it sees. And so when the stuff inside the mind changes, the person changes.</p>\r\n<p>&ldquo;&lsquo;People can use their wonderful brains to think differently about situations,&rsquo; Milgram says. &lsquo;To reframe them. To reconstruct them. To even reconstruct themselves.&rsquo;&rdquo;</p>",
 published_at: DateTime.parse('Thu, 23 Jun 2016 18:00:00 MDT -06:00').utc.to_date,
 published: true
)

Article.create(
 url: "http://www.nytimes.com/2016/06/24/science/mitochondrial-dna-mothers.html",
 title: "Why Do We Inherit Mitochondrial DNA Only From Our Mothers?",
 author: "STEPH YIN",
 publication: "The New York Times",
 summary: "<p>It is unknown why or how paternal mitochondrial DNA is removed from cells &mdash; leaving only maternal DNA.</p>\r\n<p>A recently published study of the roundworm <em>C. elegans</em> found that paternal mitochondria self-destruct when sperm and egg fuse.</p>",
 published_at: DateTime.parse('Wed, 22 Jun 2016 18:00:00 MDT -06:00').utc.to_date,
 published: true
)

Article.create(
 url: "http://fivethirtyeight.com/features/the-weird-world-of-expensive-wine",
 title: "The Weird World Of Expensive Wine",
 author: "Oliver Roeder",
 publication: "FiveThirtyEight",
 published: true,
 summary: "<p>Dataset: &ldquo;auction results from 12 major houses, including Sotheby&rsquo;s, representing &lsquo;the vast majority of the fine wine auction market&rsquo;&rdquo; &mdash;&nbsp;describing &ldquo;140,000 wines from 10,000 producers in 33 countries&rdquo;.</p>\r\n<p>The not so weird findings:</p>\r\n<p>&ldquo;In Bordeaux, as almost anywhere else in the world of fine wine, wines get more expensive as they get older, and that effect accelerates the older the wine becomes.&rdquo; Good vintages are selected for aging. Pedigree (cru designation), scarcity and verifiable storage history also factor into pricing.</p>\r\n<p>Burgundy and Bordeaux &ldquo;appear, quantitatively, quite similar: Ages and quantities sold at auction mirror each other closely, as does the price increase as the regions&rsquo; wines age.&rdquo;</p>\r\n<p>View the full article for price over time graphs comparing California regions and countries.</p>",
 published_at: DateTime.parse('Tue, 21 Jun 2016 18:00:00 MDT -06:00').utc.to_date
)

Article.create(
 url: "http://www.huffingtonpost.com/james-clear/the-akrasia-effect-why-we_b_10576458.html",
 title: "The Akrasia Effect",
 subtitle: "Why We Don’t Follow Through On What We Set Out to Do And What To Do About It",
 author: "James Clear",
 publication: "The Huffington Post",
 published: true,
 summary: "<p>Akrasia: the state of mind in which someone acts against their better judgment through weakness of will.</p>\r\n<p>We often act against our better judgement because our &ldquo;brains prefer instant rewards to long-term payoffs&rdquo;, and we are unable to summon the willpower required to overcome this preference. Below are three strategies to help us act in our best interest:</p>\r\n<p>Reduce your reliance on willpower by structuring decisions that lead you to the better choice. Do this by &ldquo;either increasing the obstacles or costs of bad behaviors or reducing the effort required for good behaviors.&rdquo; For example: set up automatic withdrawals into a savings account, delete games from your phone.&nbsp;</p>\r\n<p>Make starting as effortless as possible. Often the biggest obstacle to achieving our goals is sustaining the repeated effort of getting started. Ritualize and make a habit of getting started.</p>\r\n<p>Use implementation intentions. Studies have shown that scheduling a date and time (and perhaps duration) for your activity can significantly increase the likelihood that you will follow through.</p>",
 published_at: DateTime.parse('Sun, 19 Jun 2016 18:00:00 MDT -06:00').utc.to_date
)

Article.create(
  title: 'Why You Will Marry the Wrong Person',
  author: 'ALAIN de BOTTON',
  url: 'http://www.nytimes.com/2016/05/29/opinion/sunday/why-you-will-marry-the-wrong-person.html',
  publication: 'The New York Times',
  published_at: 'MAY 28, 2016'.to_date,
  published: true,
  summary: <<-eos
<p>Romanticism, the idea that “a perfect being exists who can meet all of our needs”, is a “harsh philosophy” that we need to abandon so that we can appreciate ourselves and our partners more fully, leading to healthier relationships and reducing loneliness.
</p>
<p>In place of the Romantic view, we should adopt a “philosophy of pessimism”, where we value “the capacity to tolerate differences with generosity” — someone who is “good at disagreement”.
</p>
<p>For many reasons, marriage “ends up as a hopeful, generous, infinitely kind gamble taken by two people who don’t know yet who they are or who the other might be, binding themselves to a future they cannot conceive of and have carefully avoided investigating.”
</p>
<p>Every “human will frustrate, anger, annoy, madden and disappoint us — and we will (without any malice) do the same to them. There can be no end to our sense of emptiness and incompleteness. But none of this is unusual or grounds for divorce. Choosing whom to commit ourselves to is merely a case of identifying which particular variety of suffering we would most like to sacrifice ourselves for.”
</p>
<p>“We should learn to accommodate ourselves to ‘wrongness,’ striving always to adopt a more forgiving, humorous and kindly perspective on its multiple examples in ourselves and in our partners.”
</p>
  eos
)

Article.create(
  title: 'The secret army of cheerleaders policing China’s internet',
  subtitle: 'Far from being a blunt instrument, China’s censorship of the web uses subtlety and distraction to keep its people off the streets',
  author: 'John Naughton',
  url: 'http://www.theguardian.com/commentisfree/2016/may/29/china-internet-censorship-strategic-distraction-gary-king',
  publication: 'The Guardian',
  published_at: '29 May 2016'.to_date,
  published: true,
  summary: "<p>How does the Chinese government &ldquo;control, manage and harness the internet for its own purposes&rdquo;?</p>\r\n<p>&ldquo; . . . online debate and discourse in China is as raucous, untamed and virulent as it is here. And yet the government devotes massive resources (200,000-plus people) to watching and censoring the network. So what are they doing? Answer: censoring some predictable stuff (pornography, Falun Gong, Tiananmen, etc); but much of what we would regard as &lsquo;political&rsquo; discourse (criticism of local communist party officials, for example) remains apparently unrestricted. There is, however, one type of discourse that is ruthlessly and efficiently suppressed: any kind of social media post that could conceivably lead to collective mobilisation &ndash; to people on the streets. And this applies even to posts that are favourable to the government!&rdquo;</p>\r\n<p>&ldquo; . . . the regime is, by western standards, overwhelmingly technocratic: something like 80% of the country&rsquo;s ruling elite have engineering backgrounds. They know that the internet is essential for a modernising economy and they also appreciate that it provides the citizenry with a safety valve &ndash; one that also serves as a feedback loop that highlights potential trouble spots (local corruption, for example). But, most of all, they know that it is essential to keep people off the streets, which is why they censor it as they do.&rdquo;</p>\r\n<p>It is estimated that 488m government-sponsored posts are created each year in order to divert attention away from and dilute discussions unfavorable to the regime. The &ldquo; . . . phoney posters avoid arguing with sceptics and critics, and indeed avoid discussing controversial topics altogether&rdquo;. Mostly they cheerlead government causes.</p>",
)