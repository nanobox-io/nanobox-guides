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
/articles/article-groups/rails.yml
```

Sample Article Group File:
```yaml
  # Used to show the title of the left nav
  title    : Rails
  # Used to create the breadcrumb
  breadCrumb:
    - {title: ruby,  href: /ruby/overview}
    - {title: rails, href: /ruby/rails/getting-started}
  # Articles
  articles :
    - {href: /ruby/rails/getting-started, title: Getting Started}
    - {href: /ruby/rails/connecting-a-database, title: Connecting a database}
    - {href: /ruby/rails/preparing-for-production, title: Preparing for production}
    - {href: /ruby/rails/launching-your-application, title: Launching your application}
    - title: Sub Nav Item
      articles:
        - {href: '#', title: Lower Article}
        - {href: '#', title: Another}


```
