# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Category created
Category.create(name: 'Web Developer')
Category.create(name: 'Android Developer')
Category.create(name: 'Java Developer')
Category.create(name: 'RoR Developer')
Category.create(name: 'Graphic Developer')
Category.create(name: 'HTML/CSS developer')
Category.create(name: 'System Admin')
Category.create(name: 'Data Scientist')
Category.create(name: 'Techincal Writer')
Category.create(name: 'Video Editing ')
Category.create(name: 'Illustrations')

# 10 Users : [5: freelancer, 5:client]
# 1 user : freelance + admin
# 4 user : normal freelance (1 freelance : approved=false)
# 5 user : client, (1 client : approved=false)
User.create!([{
               name_or_company_name: 'Deepali Kumari',
               email: 'deepalikumari@gmail.com',
               password_digest: User.digest('qwerty'),
               education: 'Electrical Engineering',
               experience: 'Intern',
               industry: 'IT sector',
               role: 0,
               approved: true,
               isadmin: true
             }, {
               name_or_company_name: 'Ashok Kumar',
               email: 'ashokkumar@gmail.com',
               password_digest: User.digest('qwerty'),
               education: 'Civil Engineering',
               experience: '20 years',
               industry: 'Private Service',
               role: 0,
               approved: false,
               isadmin: false
             }, {
               name_or_company_name: 'Asha Devi',
               email: 'ashadevi@gmail.com',
               password_digest: User.digest('qwerty'),
               education: 'Intermediate',
               experience: '0 years',
               industry: 'IT service',
               role: 0,
               approved: true,
               isadmin: false
             }, {
               name_or_company_name: 'Aman Kumar',
               email: 'amankumar@gmail.com',
               password_digest: User.digest('qwerty'),
               education: 'Electrical Engineering',
               experience: '6 months',
               industry: 'IT sector',
               role: 0,
               approved: true,
               isadmin: false
             }, {
               name_or_company_name: 'Akash Kumar',
               email: 'akashkumar@gmail.com',
               password_digest: User.digest('qwerty'),
               education: 'Electronics &Communication Engineering',
               experience: '0 years',
               industry: 'IT sector',
               role: 0,
               approved: true,
               isadmin: false
             }, {
               name_or_company_name: 'Twitter',
               email: 'twitter@gmail.com',
               password_digest: User.digest('qwerty'),
               education: 'NA',
               experience: '13 years',
               industry: 'Social Media',
               role: 1,
               approved: true,
               isadmin: false
             }, {
               name_or_company_name: 'BCG',
               email: 'bcg@gmail.com',
               password_digest: User.digest('qwerty'),
               education: 'NA',
               experience: '20 years',
               industry: 'Consulting',
               role: 1,
               approved: false,
               isadmin: false
             }, {
               name_or_company_name: 'Google',
               email: 'google@gmail.com',
               password_digest: User.digest('qwerty'),
               education: 'NA',
               experience: '40 years',
               industry: 'IT Service',
               role: 1,
               approved: true,
               isadmin: false
             }, {
               name_or_company_name: 'Microsoft',
               email: 'microsoft@gmail.com',
               password_digest: User.digest('qwerty'),
               education: 'NA',
               experience: '20 years',
               industry: 'IT Service',
               role: 1,
               approved: true,
               isadmin: false
             }, {
               name_or_company_name: 'Kreeti',
               email: 'kreeti@gmail.com',
               password_digest: User.digest('qwerty'),
               education: 'NA',
               experience: '13 years',
               industry: 'IT Service',
               role: 1,
               approved: true,
               isadmin: false
             }])

# 15 Jobs : [each client post 3 jobs: 5*3=15]
Job.create!([{
              title: 'Real estate',
              description: "Web development is the work involved in developing a website for the Internet (World Wide Web) or an intranet (a private network).[1] Web development can range from developing a simple single static page of plain text to complex web applications, electronic businesses, and social network services. A more comprehensive list of tasks to which Web development commonly refers, may include Web engineering, Web design, Web content development, client liaison, client-side/server-side scripting, Web server and network security configuration, and e-commerce development.

  Among Web professionals, Web development usually refers to the main non-design aspects of building Web sites: writing markup and coding.[2] Web development may use content management systems (CMS) to make content changes easier and available with basic technical skills.

  For larger organizations and businesses, Web development teams can consist of hundreds of people (Web developers) and follow standard methods like Agile methodologies while developing Web sites. Smaller organizations may only require a single permanent or contracting developer, or secondary assignment to related job positions such as a graphic designer or information systems technician. Web development may be a collaborative effort between departments rather than the domain of a designated department. There are three kinds of Web developer specialization: front-end developer, back-end developer, and full-stack developer.[3] Front-end developers are responsible for behavior and visuals that run in the user browser, while back-end developers deal with the servers. Since the commercialization of the Web with Tim Berners-Lee[4] developing the World Wide Web at CERN, the industry has boomed and has become one of the most used technologies ever.",
              location: 'London',
              job_author: 'Twitter',
              user_id: 6,
              category_id: 1
            }, {
              title: 'Project Management App',
              description: 'Android software development is the process by which applications are created for devices running the Android operating system. Google states that[3] Android apps can be written using Kotlin, Java, and C++ languages using the Android software development kit (SDK), while using other languages is also possible. All non-Java virtual machine (JVM) languages, such as Go, JavaScript, C, C++ or assembly, need the help of JVM language code, that may be supplied by tools, likely with restricted API support. Some programming languages and tools allow cross-platform app support (i.e. for both Android and iOS). Third party tools, development environments, and language support have also continued to evolve and expand since the initial SDK was released in 2008. The official Android app distribution mechanism to end users is Google Play; it also allows staged gradual app release, as well as distribution of pre-release app versions to testers.',
              location: 'Australia',
              job_author: 'Twitter',
              user_id: 6,
              category_id: 2
            }, {
              title: 'Snake Game Development',
              description: "Java is easy-to-use, so a beginner can learn to create a range of programs and write reusable code, easily moving between computer systems as they do so. In comparison to programming languages like C++, Java is easier to write, debug, learn and compile.

  If you are looking into Java game programming for beginners, you’ll need to understand the basics of coding with this language first. And then, there’s a slew of different job opportunities that will open up to you. Knowing that you’ll be able to get a job in game development will make it easier to put your head down and study the language.",
              location: 'New York',
              job_author: 'Twitter',
              user_id: 6,
              category_id: 3
            }, {
              title: 'Blog Project on rails',
              description: "The Rails philosophy includes two major guiding principles:

  Don't Repeat Yourself: DRY is a principle of software development which states that Every piece of knowledge must have a single, unambiguous, authoritative representation within a system. By not writing the same information over and over again, our code is more maintainable, more extensible, and less buggy.
  Convention Over Configuration: Rails has opinions about the best way to do many things in a web application, and defaults to this set of conventions, rather than require that you specify minutiae through endless configuration files.
  3 Creating a New Rails Project
  The best way to read this guide is to follow it step by step. All steps are essential to run this example application and no additional code or steps are needed.

  By following along with this guide, you'll create a Rails project called blog, a (very) simple weblog. Before you can start building the application, you need to make sure that you have Rails itself installed.",
              location: 'France',
              job_author: 'BCG Association, France',
              user_id: 7,
              category_id: 4
            }, {
              title: 'Webinar Poster Design',
              description: "This is a great graphic from Smokeball, a company that provides legal practice management software for small law firms.

  What makes this design really pop is the custom branded background used. It provides a great dynamic feel without stealing too much from the information.

  There are three colors used for fonts and two font designs—standard and uppercase.

  If you have a well known speaker to your industry, having the photo & name section is a great addition and this graphic does a nice job of balancing the information with the speaker image.

  Finally, the ‘Legal Webinars’ badge is a nice touch — especially if it is an element that they use across multiple brand images.

  One critique, the branded background looks great — however, the number of patterns may be a bit distracting, so one thing to try differently would be to lower the opacity of the icons or to remove one or two of them.",
              location: 'New York',
              job_author: 'BCG associations, NY',
              user_id: 7,
              category_id: 5
            }, {
              title: ' Front-End Project on Ecommerce Website',
              description: "There’s a saying that if you’re not online, you don't exist. A saying that grows more relevant each day as the online marketplace continues to dominate the shopping world.

  For retailers, this should be interpreted as such: if you currently do not have an ecommerce website, you may be preventing yourself from hitting revenue goals and reaching your full potential.

  What exactly does ecommerce website design entail?

  Put simply, it’s the process of creating an online store for your business to sell digitally to target shoppers. To design an ecommerce website, you need to plan, conceptualize and arrange your content and products for effective display on the Internet.

  The ecommerce push has already begun, as more companies and more shoppers are turning to ecommerce stores to make their purchases. In 2020, Walmart's online sales increased by 97%. Amazon's Q2 sales and profit growth was 40%. It's not just the big guys either, benefiting from consumers' spiked appetite for online shopping. Smaller retailers such as Howards Storage World and B-Wear Sportswear, among others, are seeing double and even triple-digit growth in ecommerce revenues compared to the year before.",
              location: 'India',
              job_author: 'BCG association, India',
              user_id: 7,
              category_id: 6
            }, {
              title: 'Designing System Admin',
              description: "If the broader topic of product development blends the perspective of marketing, design, and manufacturing into a single approach to product development,[3] then design is the act of taking the marketing information and creating the design of the product to be manufactured. Systems design is therefore the process of defining and developing systems to satisfy specified requirements of the user.

  The basic study of system design is the understanding of component parts and their subsequent interaction with one another.[4]",
              location: 'New York',
              job_author: 'Google Inc.',
              user_id: 8,
              category_id: 7
            }, {
              title: ' Fake News Detection Using Python',
              description: 'Fake news do not require any introduction. It is very much easy to spread all the fake information in today’s all-connected world across the internet. Fake news is sometimes transmitted through the internet by some unauthorised sources, which creates issues for the targeted person and it makes them panic and leads to even violence. To combat the spread of fake news, it’s critical to determine the information’s legitimacy, which this Data Science project can help with. To do so, Python can be used, and a model is created using TfidfVectorizer. PassiveAggressiveClassifier can be implemented to distinguish between true and fake news. Pandas, NumPy, and sci-kit-learn are some Python packages suitable for this project, and we can utilize News.csv for the dataset.',
              location: 'India',
              job_author: 'Google, India',
              user_id: 8,
              category_id: 8
            }, {
              title: ' Content for GOOGLE MAP',
              description: "If you want to share your opinion - whether positive or negative - about a business, you can write a Google review. On the Google Maps website and mobile app, you can share reviews, add photos, and select a star rating for any business or location listed on the platform.

  Here's how to write a Google review, what the rules are, and what happens after you post a review.",
              location: 'London',
              job_author: 'Google Map, London',
              user_id: 8,
              category_id: 9
            }, {
              title: 'Short-Film Video Editing on Wildlife',
              description: "First, I’m not exactly equipped at the moment as a videographer. However, I do acknowledge I am far better off than many people when they are first interested in making movies simply because I’ve already dug in as a bird stills photographer. Diving into this whole video thing head first and soaking up all the information I can, I’ve read some really disgusting opinions on various online forums about how no one should even bother being out there if they don’t have the proper gear. Unbelievable. On the other hand, I’ve also been catching up on the Master Wildlife Filmmaking podcast and each distinguished professional guest has shared the same sentiment that you start making movies with whatever you have and to not go nuts thinking about the gear. Encouraging.

  I have an old tripod that is probably being crushed under the weight of the video head alone. The video head is overloaded and unable to counterbalance the weight of the camera and lens. I also have essentially no audio equipment. Yet, instead of sitting on my hands, I decided to give it a go and play to my strengths. I know what good images of birds look like. I know bird behaviors and what would be interesting to focus on. And if anything, I knew I could at least get my lens pointed at something and lock it off there to film.",
              location: 'Australia',
              job_author: 'Microsoft, Australia',
              user_id: 9,
              category_id: 10
            }, {
              title: 'TEdx-India Campaign Illustrations',
              description: "An illustration is a decoration, interpretation or visual explanation of a text, concept or process,[1] designed for integration in print and digital published media, such as posters, flyers, magazines, books, teaching materials, animations, video games and films. An illustration is typically created by an illustrator. Digital illustrations are often used to make websites and apps more user-friendly, such as the use of emojis to accompany digital type.[2] llustration also means providing an example; either in writing or in picture form.

  The origin of the word illustration is late Middle English (in the sense ‘illumination; spiritual or intellectual enlightenment’): via Old French from Latin illustratio(n-), from the verb illustrare",
              location: 'India',
              job_author: 'Microsoft, India',
              user_id: 9,
              category_id: 11
            }, {
              title: 'Full stack developement on Stock Market',
              description: "The website content is easy-to-digest, standard capital-market-jargon-free, non-pushy, and largely in plain simple English just like your trusted advisor. Which is something that even the best design agencies won't dive into. From mutual funds, share trading, markets, research, to recommendations; everything.

  Through the entire design exercise, we realised that members of the Edelweiss team are experts at what they do. The persuasive UI triggers action and instills confidence through contextual social proof.",
              location: 'New York',
              job_author: 'Microsoft, NY',
              user_id: 9,
              category_id: 1
            }, {
              title: 'Weather Forecast App',
              description: 'Android software development is the process by which applications are created for devices running the Android operating system. Google states that[3] Android apps can be written using Kotlin, Java, and C++ languages using the Android software development kit (SDK), while using other languages is also possible. All non-Java virtual machine (JVM) languages, such as Go, JavaScript, C, C++ or assembly, need the help of JVM language code, that may be supplied by tools, likely with restricted API support. Some programming languages and tools allow cross-platform app support (i.e. for both Android and iOS). Third party tools, development environments, and language support have also continued to evolve and expand since the initial SDK was released in 2008. The official Android app distribution mechanism to end users is Google Play; it also allows staged gradual app release, as well as distribution of pre-release app versions to testers.',
              location: 'Kolakta, India',
              job_author: 'Kreeti, India',
              user_id: 10,
              category_id: 2
            }, {
              title: 'Tic-Tac-Toe Game Development',
              description: "Java is easy-to-use, so a beginner can learn to create a range of programs and write reusable code, easily moving between computer systems as they do so. In comparison to programming languages like C++, Java is easier to write, debug, learn and compile.

  If you are looking into Java game programming for beginners, you’ll need to understand the basics of coding with this language first. And then, there’s a slew of different job opportunities that will open up to you. Knowing that you’ll be able to get a job in game development will make it easier to put your head down and study the language.",
              location: 'Kolakta, India',
              job_author: 'Kreeti, India',
              user_id: 10,
              category_id: 3
            }, {
              title: 'Job_Board Project on rails',
              description: "The Rails philosophy includes two major guiding principles:

  Don't Repeat Yourself: DRY is a principle of software development which states that Every piece of knowledge must have a single, unambiguous, authoritative representation within a system. By not writing the same information over and over again, our code is more maintainable, more extensible, and less buggy.
  Convention Over Configuration: Rails has opinions about the best way to do many things in a web application, and defaults to this set of conventions, rather than require that you specify minutiae through endless configuration files.
  3 Creating a New Rails Project
  The best way to read this guide is to follow it step by step. All steps are essential to run this example application and no additional code or steps are needed.

  By following along with this guide, you'll create a Rails project called blog, a (very) simple weblog. Before you can start building the application, you need to make sure that you have Rails itself installed.",
              location: 'Kolkata, India',
              job_author: 'Kreeti, India',
              user_id: 10,
              category_id: 4
            }])
