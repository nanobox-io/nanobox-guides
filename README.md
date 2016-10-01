# Installation

1. Clone the Repo
2. Install the shared library
  * `git submodule update --init`

# Running the app

#### Local:
```
gulp
```

#### Building for deploying
```
gulp rel
```
(NOTE! A few changes need to be made before gulp rel will work)


# Adding a new article

##### 1) Create the article file in `markdown`
```
/articles/ruby/rails/getting-started.md
```

##### 2) Create a page that loads your article
```
/app/pages/ruby/rails/getting-started.jade
```
Every page that is created in the `app/pages` directory will create a page on the final site.

Sample page:

```jade
extends /app/pages/templates/article  

block configParams
  -
    title    = "Getting Started"  //- Title Of the page
    articles = "rails"            //- The Article group
    icons    = "ruby,rails"       //- The Icons to display

block markdown
  include:md /articles/ruby/rails/getting-started.md
```

##### 3) Create (or edit an existing) article group

Article groups define the related articles that will are shown in the left hand column of article pages.

```
/app/coffee/article-groups/rails.coffee
```

Sample Article Group File:
```coffee
window.articleGroupData =
  # Used to show the title of the left nav
  title    : "Sails"

  # Used to create the breadcrumb
  breadCrumb:[
    {title:'ruby',   href:'/ruby/overview'}
    {title:'rails',  href:'/ruby/rails/getting-started'}
  ]

  # Articles
  articles : [
    {href: "/ruby/rails/getting-started",          title: "Getting Started"}
    {href: "/ruby/rails/connecting to a database", title: "Connecting to a database"}
    {href: "/ruby/rails/adding-components",        title: "Adding components"}
    {href: "/ruby/rails/getting-started",          title: "Sub Directory", articles : [
        {href: "ruby/rails/nested", title: "Example of nested articles"}
        {href: "ruby/rails/other",  title: "Some other article"}
        {href: "#",                 title: "Another", articles : [
            {href: "#", title: "Deep nesting"}
            {href: "#", title: "Very Deep"}
          ]
        }
      ]
    }
  ]

```
