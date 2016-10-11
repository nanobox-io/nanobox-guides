var IndexPage;

IndexPage = (function() {
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
    var $first, $next, left, txt;
    if (targ === 'frameworks') {
      left = -592;
      txt = "Guides : Choose a framework";
      $first = this.$languages;
      $next = this.$frameworks;
    } else {
      left = 0;
      txt = "Guides : Choose a language";
      $first = this.$frameworks;
      $next = this.$languages;
    }
    $first.toggleClass('hidden');
    this.$slidePath.velocity({
      left: left
    }, {
      duration: 400,
      delay: 200,
      easing: "easeInOutQuint",
      complete: (function(_this) {
        return function() {
          return $next.toggleClass('hidden');
        };
      })(this)
    });
    return this.$title.text(txt);
  };

  return IndexPage;

})();

new IndexPage();
