console.log """Reminder:
1) Make sure gulp is running
2) run `sudo ldconfig /data/lib` before running this app
"""
Horseman  = require 'node-horseman'
phantomjs = require('phantomjs-prebuilt')

# Custom action that creates an icon for each framework specified in the icons array
Horseman.registerAction 'createIcons', (icons)->
  icons.reduce (promise, item) =>
    promise.then =>
      console.log " + Generating icon for #{item.title}"
      # Call javascript to render new icon html
      this.evaluate( (icon, title)->
          makeIcon icon, title
      , item.icon, item.title)
      # Save an image screenshot of the div holding the icons
      .crop('.github-icons', "./quickstart-icons/#{item.icon}.png")
  , Promise.resolve()


generatedIcons = [
  {icon:'rails', title:'Ruby on Rails'}
  {icon:'sinatra', title:'Sinatra'}
  {icon:'django', title:'Django'}
  {icon:'flask', title:'Flask'}
  {icon:'laravel', title:'Laravel'}
  {icon:'codeigniter', title:'Codeigniter'}
  {icon:'wordpress', title:'Wordpress'}
  {icon:'meteor', title:'meteor'}
  {icon:'express', title:'express'}
  {icon:'sails', title:'sails'}
  {icon:'angular', title:'angular'}
  {icon:'ember', title:'ember'}
  {icon:'phoenix', title:'phoenix'}
  {icon:'lumen', title:'Lumen'}
  {icon:'slim', title:'Slim'}
  {icon:'cakephp', title:'CakePHP'}
  {icon:'symfony', title:'Symfony'}
]

newIcons = [
  {icon:'hapi', title:'Hapi'}
  {icon:'vue', title:'Vue'}
]

horseman = new Horseman( {phantomPath:phantomjs.path} )
  .open('http://localhost:8080/github-icons/index.html')
  .createIcons newIcons
  .close()
