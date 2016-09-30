class Download

  constructor: (@$el) ->
    @initOsData()
    @switchOs @detectOs()
    $(".os-cube", @$el).on "click", (e)=>
      @switchOs $(e.currentTarget).attr 'data-os'
    $(".download-btn").on "click", (e)=>
      window.location = @osData[@os].downloadUrl

  switchOs : (@os) ->
    # If it's linux, change some of the view specifics
    $(@$el).removeClass "is-linux"
    if @os == "linux"
      $(@$el).addClass "is-linux"

    # Switch the text and the icons
    $(".info .h1", @$el).text  @osData[os].title
    $(".info .txt", @$el).html @osData[os].details
    $(".download-btn .os", @$el).html """
      <img class='shadow-icon' data-src='cube' />
      <img class='shadow-icon' data-src='logo-#{@os}' />
    """
    castShadows $(".download-btn .os", @$el)

    # Change the selected button
    $(".os-cube", @$el).removeClass 'active'
    $(".os-cube[data-os=#{os}]", @$el).addClass 'active'

  detectOs : () ->
    os = "Unknown OS"
    if      ( navigator.appVersion.indexOf("Win")   !=-1 ) then os = "windows"
    else if ( navigator.appVersion.indexOf("Mac")   !=-1 ) then os = "apple"
    else if ( navigator.appVersion.indexOf("X11")   !=-1 ) then os = "linux"
    else if ( navigator.appVersion.indexOf("Linux") !=-1 ) then os = "linux"

  initOsData : () ->
    version = "v1.0.0"
    @osData =
      apple :
        title       : "Mac Osx Installer"
        downloadUrl : "https://s3.amazonaws.com/tools.nanobox.io/installers/v1/mac/Nanobox.pkg"
        details     : """
                      #{version}<br/>
                      Mac OSX Intel<br/>
                      Nanobox.pkg : 137 MB<br/>
                      """
      windows :
        title       : "Windows Installer"
        downloadUrl : "https://s3.amazonaws.com/tools.nanobox.io/installers/v1/windows/NanoboxSetup.exe"
        details     : """
                      #{version}<br/>
                      Windows<br/>
                      NanoboxSetup.exe : 129 MB<br/>
                      """
      linux :
        title       : "Linux Binaries"
        details     : """
                      #{version}<br/>
                      Linux<br/>
                      124 MB<br/>
                      """
download = new Download($(".download"))
