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

Article groups define the related articles that are shown in the left hand column of article pages.

```
/articles/article-groups/rails.yml
```

Sample Article Group File:
```yaml
  # Used to show the title of the left nav
  title    : Rails
  # Used to create the breadcrumb
  breadCrumb:
    - {title: ruby,  href: /ruby}
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

# Generating github quickstart images

We generate the github quickstart headers by launching a headless browser (phantomjs), forming the image in html and saving as a png.

1. `nanobox run gulp`
1. Edit `make-git-images.coffee` to add the new icons you want to generate an image for to the `newIcons` array. Also make sure that we have svg icons for that icon.
1. In a new terminal `nanobox run`
1. Run `sudo ldconfig /data/lib` (in nanobox)
1. Run `coffee make-git-images.coffee` (in nanobox)

# Adding contributors

(Currently only available for frameworks)

Sample framework landing page (jade). If you add a contributors array, contributors will be added to that framework landing page:

``` jade
block jsParams
  script.
    // (...)
    contributors       = [
      {name:"tolmark12", gravatarHash:'96B5571D8A9CD5B868226A5BD527D8ED', href:"https://github.com/Tolmark12"}
    ]
    /*
    @name         : Their name or username, ask which they prefer
    @twitter      : We use twitter to pull their twitter profile image (vs gravatar)
    @gravatarHash : We use gravatar to show an image, get an email connected to gravatar and generate a MD5 hash. ex : http://onlinemd5.com/
    @href         : Link to their site, twitter profile, github profile, etc. whatever they want. We probably prefer github.
    */
```
