autoprefixer = require 'gulp-autoprefixer'
bower        = require 'gulp-bower'
bump         = require 'gulp-bump'
coffee       = require 'gulp-coffee'
concat       = require 'gulp-concat'
connect      = require 'connect'
fs           = require 'fs'
git          = require 'gulp-git'
gulp         = require 'gulp'
gulpignore   = require 'gulp-ignore'
gutil        = require 'gulp-util'
http         = require 'http'
pug          = require 'jade'
jade         = require 'gulp-jade'
livereload   = require 'gulp-livereload'
marked       = require 'marked'
minifyCss    = require 'gulp-minify-css'
minifyHtml   = require 'gulp-minify-html'
mustache     = require 'gulp-mustache'
open         = require "gulp-open"
plumber      = require 'gulp-plumber'
rename       = require 'gulp-rename'
rimraf       = require 'rimraf'
rimrafgulp   = require 'gulp-rimraf'
sass         = require 'gulp-sass'
uglify       = require 'gulp-uglify'
usemin       = require 'gulp-usemin'
watch        = require 'gulp-watch'
wrap         = require 'gulp-wrap'
shadow       = require 'gulp-shadow-icons'
wait         = require 'gulp-wait'

marked.setOptions
  smartypants: true
pug.filters.md = marked
livereload.listen()

# new
inject       = require 'gulp-inject'
foreach      = require 'gulp-foreach'
rev          = require 'gulp-rev'
# Paths to source files

articlePath       = 'articles/**/*.md'
jadePath          = 'app/pages'
templatePath      = 'app/jade/**/*.jade'
cssPath           = 'app/scss/**/*.scss'
cssStagePath      = 'stage/stage.scss'
coffeePath        = 'app/coffee/**/*.coffee'
assetPath         = ['app/images/**/*', 'app/fonts/*']
miscJsPath        = 'app/js/*'
yamlPath          = 'articles/**/*.yml'
svgPath           = ['lib/assets/core-styles/svg/compiled/*.svg','app/assets/compiled/*.svg']
htaccessPath      = 'app/misc/.htaccess'

parseSVG = (cb)->
  gulp.src svgPath
    .pipe shadow {
      cssDest:'./css/'
      jsDest:'./js/'
      cssRegex:[
        { pattern:/Lato-Regular/g, replace:"Lato" }
        { pattern:/font-family:'Lato-Italic';/g, replace:"font-family:'Lato'; font-style:italic;" }
      ]
    }
    .pipe gulp.dest('./server/')
    .on('end', cb)
onError = (err) ->
  console.log err
  @emit 'end'

html = (cb, src)->
  src    = if !src? then "" else "#{src}/"
  source = "#{jadePath}/#{src}**/*.jade"
  gulp.src source
    .pipe jade({jade:pug, basedir:'./' }).on('error', (err)-> console.log(err); this.emit('end') )
    .on 'error', onError
    .pipe gulp.dest("./server/#{src}")
    .on 'end', ()->
      livereload.reload()
      if !src?
        console.log "           (Reloaded all html files)"
      else
        console.log "           (Only reloaded files matched by : #{source})"
      if cb?
        cb()

jadeTemplates = (cb)->
  gulp.src( templatePath )
    .pipe jade(client: true)
    .on 'error', onError
    .pipe wrap("jadeTemplate['<%= file.relative.split('.')[0] %>'] = <%= file.contents %>;\n")
    .pipe concat('jade-templates.js')
    .pipe wrap("jadeTemplate = {};\n<%= file.contents %>")
    .pipe gulp.dest('./server/js')
    .on('end', cb)

css = (cb)->
  gulp.src( cssPath )
    .pipe sass({errLogToConsole: true})
    .on 'error', onError
    .pipe autoprefixer( browsers: ['last 1 version'],cascade: false )
    .pipe gulp.dest('./server/css')
    .on('end', cb)

js = (cb)->
  # App
  gulp.src( coffeePath )
    .pipe plumber()
    .pipe coffee( bare: true ).on( 'error', gutil.log ) .on( 'error', gutil.beep )
    .on 'error', onError
    .pipe gulp.dest('server/js')
    .on 'end', ()->
      livereload.reload()
      cb()

miscJs = (cb)->
  gulp.src miscJsPath
    .pipe gulp.dest('server/js')
    .on 'end', cb

copyAssets = (destination, cb) ->
  gulp.src assetPath
    .pipe gulp.dest(destination)
    .on('end', cb)

copyImages = (cb)->
  copyAssets 'server/assets', cb

copyGithubImages = ()->
  gulp.src './quickstart-icons/*'
    .pipe gulp.dest('rel/assets/quickstart-icons/')

copyHtaccess = ()->
  gulp.src htaccessPath
    .pipe gulp.dest('./rel')
gulp.task 'copy-yaml', ['minify']
    # .on('end', cb)

copyFiles = (path, destination, cb) ->
  gulp.src path
    .pipe gulp.dest(destination)
    .on('end', cb)

copyBowerLibs = (cb)->
  bower()
    .pipe gulp.dest('./server/bower-libs/')

copyFilesToBuild = ->
  gulp.src( './server/js/*' ).pipe gulp.dest('./rel/')
  gulp.src( './server/css/main.css' ).pipe gulp.dest('./rel/')

copyYaml = (cb)->
  gulp.src yamlPath
    .pipe gulp.dest('server/yaml')
    .on 'end', ()->
      livereload.reload()
      cb()

pushViaGit = ->
  # Start out by reading the version number for commit msg, then git push, etc..
  fs.readFile './bower.json', 'utf8', (err, data) =>
    regex   = /version"\s*:\s*"(.+)"/
    version = data.match(regex)[1]
    gulp.src('./')
      .pipe git.add()
      .pipe git.commit("BUILD - #{version}")
      .pipe git.push 'origin', 'master', (err)=> if err? then console.log(err)

bumpBowerVersion = ->
  gulp.src('./bower.json')
    .pipe bump( {type:'patch'} )
    .pipe(gulp.dest('./'));

# minifyAndJoin = () ->
#   gulp.src './server/index.html'
#     .pipe usemin
#       css : [ minifyCss(), 'concat'],
#       html: [ minifyHtml({empty: true})],
#       js  : [ uglify(), rev()],
#       js2 : [ uglify(), rev()]
#     .pipe(gulp.dest('rel/'));

minifyAndJoin = () ->
  gulp.src('./server/**/*.html').pipe foreach((stream, file) ->
    stream.pipe(
      usemin
        css                  : [ minifyCss(), 'concat', rev()]
        html                 : [ minifyHtml({empty: true})]
        js                   : [ uglify(), rev()]
        path                 : './server'
        skipMissingResources : true
        # assetsDir            : 'rel/'
    ).pipe gulp.dest('rel/')
  )
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Livereload Server
server = ->
  port      = 8080
  hostname  = null # allow to connect from anywhere
  base      = 'server'
  directory = 'server'
  app = connect()
    .use( connect.static(base) )
    .use( connect.directory(directory) )

  http.createServer(app).listen port, hostname

# Open in the browser
launch = ->
  console.log '-------------------------------'
  console.log 'Build Complete, visit : '
  console.log "http://guides.nanobox.dev"
  # gulp.src("./server/index.html") # An actual file must be specified or gulp will overlook the task.
  #   .pipe(open("",
  #     url: "http://localhost:3814/index.html",
  #     app: "google chrome"
  #   ))

prettyURLS = () ->
  gulp.src(["./rel/**/*.html","!./rel/index.html"])
    .pipe( rename (path)->
      path.dirname  = "#{path.dirname}/#{path.basename}"
      path.basename = "index"
    )
    .pipe gulp.dest('./rel')

deleteUneededFiles = ()->
  gulp.src([
      "./rel/**/*.html",    "!./rel/**/index.html",
      "./rel/**/style.css", "!./rel/style.css",
      "./rel/**/js",        "!./rel/js"])
    .pipe rimrafgulp()

markdownChange = (file)->
  path = file.path.split("/")
  path.pop()
  path.shift()
  path.shift()
  path.shift()
  # Find the deepest matching folder with jaded files to recompile
  for i in [path.length..0]
    testPath = path.slice(0, i).join("/")
    try
      # If this directory exists in ./app/pages, trigger a rebuild on all the jade files in that dir
      if fs.lstatSync("app/pages/#{testPath}").isDirectory()
        html null, testPath
        return
    catch e


compileFiles = (doWatch=false, cb) ->
  count      = 0
  onComplete = ()=>
    if ++count == ar.length then cb();
  ar         = [
    {meth:js,             glob:coffeePath, dontLiveReload:true}
    {meth:css,            glob:cssPath}
    {meth:miscJs,         glob:miscJsPath}
    {meth:jadeTemplates,  glob:templatePath}
    {meth:html,           glob:jadePath, dontLiveReload:true}
    {meth:copyYaml,       glob:yamlPath, dontLiveReload:true}
    {meth:parseSVG,       glob:svgPath}
    {meth:copyImages,     glob:assetPath}
  ]

  # Create a custom watcher for markdown files
  gulp.watch(articlePath).on 'change', markdownChange

  createWatcher = (item, params)->
    item.meth.apply(null, params)
    watch item.glob, =>
      stream = item.meth.apply( null, [=>])
      if !item.dontLiveReload
        stream.pipe( livereload() )

  for item in ar
    params = if item.params? then item.params else [onComplete]
    if doWatch
      createWatcher(item, params)
    else
      item.meth.apply null, params


gulp.task 'tester', ()->
  gulp.watch(articlePath).on 'change', markdownChange

# ----------- GENERATOR ----------- #

gulp.task 'new-framework', ()->
  [language, framework] = gutil.env.path.split "/"
  gulp.src 'templates/framework/**/*.jade'
    .pipe mustache({language:language, framework:framework})
    .pipe gulp.dest("app/pages/#{language}/#{framework}")
    .on 'end', process.exit



# ----------- MAIN ----------- #

gulp.task 'clean',                  (cb) -> rimraf './server/*', cb
gulp.task 'bowerLibs', ['clean'],   (cb) -> copyBowerLibs()
gulp.task 'compile', ['bowerLibs'], (cb) -> compileFiles(true, cb)
gulp.task 'server', ['compile'],    (cb) -> server(); launch(); #process.exit()
gulp.task 'default', ['server']

# ----------- BUILD (rel) ----------- #

gulp.task 'rel:clean',                                 (cb)  -> rimraf './rel/*', cb
gulp.task 'copy-htaccess',['rel:clean'],               ()    -> copyHtaccess()
gulp.task 'bumpVersion', ['copy-htaccess'],            ()    -> bumpBowerVersion()
gulp.task 'copyStatics', ['bowerLibs'],                ()    -> copyAssets('rel/assets', ->)
gulp.task 'copyGithubImages', ['copyStatics'],         ()    -> copyGithubImages()
gulp.task 'releaseCompile', ['copyGithubImages'],      (cb)  -> compileFiles(false, cb)
gulp.task 'minify',['releaseCompile'],                 ()    -> minifyAndJoin();
gulp.task 'copy-yaml', ['minify'],                     ()    -> copyFiles('./server/yaml/**/*', './rel/yaml/', ->)
gulp.task 'pretty',['copy-yaml'],                      ()    -> prettyURLS()
gulp.task 'cleanhtml', ['pretty'],                     ()    -> deleteUneededFiles()
gulp.task 'rel', ['rel:clean', 'bumpVersion', 'cleanhtml'],  -> process.exit()
