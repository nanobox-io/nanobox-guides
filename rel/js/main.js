var Article;

Article = (function() {
  function Article(title, clusters) {
    this.title = title;
    this.clusters = clusters;
    this.$main = $(".main");
    this.$leftNav = $("#left-nav");
    this.buildRelatedPagesNav();
    this.buildPageNav();
  }

  Article.prototype.buildRelatedPagesNav = function() {
    var store;
    store = {};
    return $.when(nanobox.getYaml("/yaml/article-groups/" + this.clusters + ".yml", null, (function(_this) {
      return function(yml) {
        return _this.articleGroupData = yml;
      };
    })(this))).then((function(_this) {
      return function() {
        var $node;
        _this.markMatchedArticle(_this.articleGroupData.articles);
        $node = $(jadeTemplate['articles'](_this.articleGroupData));
        $(".title", _this.$leftNav).text(_this.articleGroupData.title);
        $(".articles", _this.$leftNav).append($node);
        $(".child-toggle", $node).on('click', function(e) {
          $($(e.currentTarget).parent()).toggleClass('open');
          return $(e.currentTarget).toggleClass('open');
        });
        _this.buildBreadCrumbs();
        if (window.isLocal) {
          return localizeLinks();
        }
      };
    })(this));
  };

  Article.prototype.markMatchedArticle = function(articles) {
    var article, foundActiveArticle, shouldBeOpen, _i, _len;
    shouldBeOpen = false;
    foundActiveArticle = false;
    for (_i = 0, _len = articles.length; _i < _len; _i++) {
      article = articles[_i];
      if (article.title.toLowerCase() === this.title.toLowerCase()) {
        article.active = true;
        foundActiveArticle = true;
      }
      if (article.articles != null) {
        shouldBeOpen = this.markMatchedArticle(article.articles);
        if (shouldBeOpen) {
          article.isOpen = true;
        }
      }
    }
    return shouldBeOpen || foundActiveArticle;
  };

  Article.prototype.buildBreadCrumbs = function() {
    var $node;
    return;
    this.articleGroupData.breadCrumb.push({
      title: this.title,
      href: "#"
    });
    $node = $(jadeTemplate['breadcrumb']({
      breadCrumbs: this.articleGroupData.breadCrumb
    }));
    return this.$main.prepend($node);
  };

  Article.prototype.buildPageNav = function() {
    var $header, $headers, $node, ar, data, header, _i, _len;
    ar = [];
    $headers = $("h1, h2, h3, h4, h5, h6", this.$main);
    if ($headers.length < 2) {
      return;
    }
    for (_i = 0, _len = $headers.length; _i < _len; _i++) {
      header = $headers[_i];
      $header = $(header);
      data = {
        id: $header.attr('id'),
        text: $header.text(),
        tag: $header.prop("tagName").toLowerCase()
      };
      $header.text('');
      $header.append("<a href='#" + data.id + "'>" + data.text + "</a>");
      ar.push(data);
    }
    $node = $(jadeTemplate['page-nav']({
      headers: ar
    }));
    $("#left-nav").append($node);
    $("a", $node).on('click', this.onAnchorClick);
    return $("a", $headers).on('click', this.onAnchorClick);
  };

  Article.prototype.onAnchorClick = function(e) {
    return $('body').velocity('scroll', {
      duration: 600,
      offset: $($.attr(this, 'href')).offset().top,
      easing: 'easeInOutQuint'
    });
  };

  return Article;

})();

window.nanobox || (window.nanobox = {});

nanobox.Article = Article;
