#import "../unlink.typ": vantage, term, skill, styled-link
#let configuration = yaml("psiace-configuration.yaml")

#let employer(job) = {
  if job.company.link == "" {
    emph(job.company.name)
  } else {
    emph(link(job.company.link, job.company.name))
  }

  if "product" in job {
    if job.product.at("parenthesized", default: false) {
      [ #styled-link(job.product.link)[(#job.product.name)]]
    } else {
      text(" - ")
      styled-link(job.product.link, job.product.name)
    }
  }
}

#let render(cfg) = vantage(
  name: cfg.contacts.name,
  position: cfg.position,
  links: (
    (name: "email", link: "mailto:"+ cfg.contacts.email),
    (name: "website", link: cfg.contacts.website.url, display: cfg.contacts.website.displayText),
    (name: "github", link: cfg.contacts.github.url, display: cfg.contacts.github.displayText),
    (name: "linkedin", link: cfg.contacts.linkedin.url, display: cfg.contacts.linkedin.displayText),
    (name: "location", link: "https://maps.google.com/?q=" + cfg.contacts.address, display: cfg.contacts.address)
  ),
  tagline: (cfg.tagline),
  [

    == Achievements/Certifications

    #for achievement in cfg.achievements [
      === #achievement.name

      - #achievement.description
    ]

    == Experience

    #for job in cfg.jobs [
      === #job.position \
      #employer(job) \
      #term[#job.from --- #job.to][#job.location]

      #for point in job.description [
        - #point
      ]
    ]
  ],
  [
    == Objective

    #cfg.objective


    == Education

    #for edu in cfg.education [
      === #if edu.place.link != "" [
        #link(edu.place.link)[#edu.place.name]\
      ] else [
        #edu.place.name\
      ]

      #edu.from - #edu.to #h(1fr) #edu.location

      #edu.degree in #edu.major

    ]

    == Skills/Exposure

    #for skill in cfg.skills [
      • #skill \
    ]

    == Methodology/Approach
    #for method in cfg.methodology [
      • #method \
    ]

    == Tools
    #for tool in cfg.tools [
      • #tool \
    ]
  ]
)

#render(configuration.zh)
#pagebreak()
#render(configuration.en)
