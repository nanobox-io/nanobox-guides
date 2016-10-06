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

pug.filters.md = marked
livereload.listen()

# new
inject       = require 'gulp-inject'
foreach      = require 'gulp-foreach'
# Paths to source files

articlePath       = 'articles/**/*.md'
jadePath          = 'app/pages/**/*.jade'
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

html = (cb)->
  gulp.src jadePath
    .pipe jade({jade:pug, basedir:'./' }).on('error', (err)-> console.log(err); this.emit('end') )
    .pipe gulp.dest('./server/')
    .on 'end', ()->
      livereload.reload()
      console.log "           (Reloaded all html files)"
      cb()

jadeTemplates = (cb)->
  gulp.src( templatePath )
    .pipe jade(client: true)
    .pipe wrap("jadeTemplate['<%= file.relative.split('.')[0] %>'] = <%= file.contents %>;\n")
    .pipe concat('jade-templates.js')
    .pipe wrap("jadeTemplate = {};\n<%= file.contents %>")
    .pipe gulp.dest('./server/js')
    .on('end', cb)

css = (cb)->
  gulp.src( cssPath )
    .pipe sass({errLogToConsole: true})
    .pipe autoprefixer( browsers: ['last 1 version'],cascade: false )
    .pipe gulp.dest('./server/css')
    .on('end', cb)

js = (cb)->
  # App
  gulp.src( coffeePath )
    .pipe plumber()
    .pipe coffee( bare: true ).on( 'error', gutil.log ) .on( 'error', gutil.beep )
    # .pipe concat('app.js')
    .pipe gulp.dest('server/js')
    .on('end', cb)

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

copyHtaccess = ()->
  gulp.src htaccessPath
    .pipe gulp.dest('./rel')
    # .on('end', cb)

copyRandomJs = (path, destination, cb) ->
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
  console.log 'copy yml'
  gulp.src yamlPath
    .pipe gulp.dest('server/yaml')
    .on('end', cb)

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
        css                  : [ minifyCss(), 'concat']
        html                 : [ minifyHtml({empty: true})]
        js                   : [ uglify()]
        path                 : './server'
        skipMissingResources : true
        # assetsDir            : 'rel/'
    ).pipe gulp.dest('rel/')
  )
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Livereload Server
server = ->
  port      = 3814
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
  console.log "http://guides.nanobox.dev:3814/"
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

compileFiles = (doWatch=false, cb) ->
  count      = 0
  onComplete = ()=>
    if ++count == ar.length then cb();
  ar         = [
    {meth:js,            glob:coffeePath}
    {meth:css,           glob:cssPath}
    {meth:miscJs,        glob:miscJsPath}
    {meth:jadeTemplates, glob:templatePath}
    {meth:html,          glob:[articlePath, jadePath], dontLiveReload:true}
    {meth:copyYaml,      glob:yamlPath}
    {meth:parseSVG,      glob:svgPath}
    {meth:copyImages,    glob:assetPath}
  ]

  # createWatcher = (item, params)-> watch( { glob:item.glob }, => item.meth.apply(null, ->).pipe( livereload() ) )


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
gulp.task 'releaseCompile', ['copyStatics'],           (cb)  -> compileFiles(false, cb)
gulp.task 'minify',['releaseCompile'],                 ()    -> minifyAndJoin();
gulp.task 'copy-random-js', ['minify'],                ()    -> copyRandomJs('./server/js/article-groups/*', './rel/js/article-groups/', ->)
gulp.task 'pretty',['copy-random-js'],                 ()    -> prettyURLS()
gulp.task 'cleanhtml', ['pretty'],                     ()    -> deleteUneededFiles()
gulp.task 'rel', ['rel:clean', 'bumpVersion', 'cleanhtml'],  -> process.exit()
