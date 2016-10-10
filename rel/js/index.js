var IndexPage;

IndexPage = (function() {
  IndexPage.prototype.lang = {
    language: "ruby",
    frameworks: [
      {
        id: 'rails',
        href: "/ruby/rails/overview"
      }, {
        id: 'sinatra',
        href: "/ruby/sinatra/overview"
      }
    ],
    guides: [
      {
        title: "Launching a Basic Ruby App"
      }
    ]
  };

  function IndexPage() {
    this.$slidePath = $('.slide-path');
    this.$languages = $('.languages');
    this.$frameworks = $('.frameworks');
    this.$title = $('.title .txt');
    $("a.hex").on('click', (function(_this) {
      return function(e) {
        return _this.loadFrameworks($(e.currentTarget).attr('data-language'));
      };
    })(this));
  }

  IndexPage.prototype.loadFrameworks = function(language) {
    return nanobox.getYaml("/yaml/frameworks/" + language + ".yml", language, (function(_this) {
      return function(yaml) {
        var $node;
        _this.$frameworks.empty();
        yaml.language = language;
        $node = $(jadeTemplate['index-frameworks'](yaml));
        _this.$frameworks.append($node);
        castShadows();
        $(".direction-link", _this.$frameworks).on('click', function(e) {
          return _this.slide('languages');
        });
        if (window.isLocal) {
          window.localizeLinks();
        }
        return setTimeout(function() {
          return _this.slide('frameworks');
        }, 20);
      };
    })(this));
  };

  IndexPage.prototype.slide = function(targ) {
    var left, txt;
    if (targ === 'frameworks') {
      left = -592;
      txt = "Guides : Choose a framework";
    } else {
      left = 0;
      txt = "Guides : Choose a language";
    }
    this.$languages.toggleClass('hidden');
    this.$frameworks.toggleClass('hidden');
    this.$slidePath.velocity({
      left: left
    }, {
      duration: 600,
      easing: "easeInOutQuint"
    });
    return this.$title.text(txt);
  };

  return IndexPage;

})();

new IndexPage();
