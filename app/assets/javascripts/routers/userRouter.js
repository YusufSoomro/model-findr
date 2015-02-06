ModelFindrApp.Routers.UserRouter = Backbone.Router.extend({
  initialize: function() {
    this.userCollection = new ModelFindrApp.Collections.Users();
    this.$rootEl = $('#main');
    this.navbar();
  },

  routes: {
    "users/:id": "show",
    "users/:id/portfolio": "userPortfolio",
    "users/:id/edit": "editProfile",
    "explore_imgs": "exploreImgs",
    "city_imgs": "cityImgs"
  },

  navbar: function() {
    if (!this._nav) {
      var nav = new ModelFindrApp.Views.Navbar;
      this._nav = nav
      $('body').prepend(nav.render().$el);
    }
  },

  show: function(id) {
    this.navbar();
    var user = this.userCollection.getOrFetch(id);
    var userShow = new ModelFindrApp.Views.UserShow({model: user})

    this._swapView(userShow);
  },

  userPortfolio: function(id) {
    this.navbar();
    var user = new ModelFindrApp.Models.User({id: id});
    user.fetch();
    var portfolio = new ModelFindrApp.Views.UserPortfolio({model: user});

    this._swapView(portfolio);
  },

  editProfile: function(id) {
    this.navbar();
    var user = new ModelFindrApp.Models.User({id: id});
    user.fetch();
    var editPage = new ModelFindrApp.Views.EditProfile({model: user});

    this._swapView(editPage);
  },

  exploreImgs: function() {
    var exploreView = new ModelFindrApp.Views.ExploreImgs({
      collection: this.exploreImgCollection()
    });

    this._swapView(exploreView);
  },

  cityImgs: function() {
    var cityView = new ModelFindrApp.Views.CityImgs({
      collection: this.cityImgCollection()
    });

    this._swapView(cityView);
  },

  _swapView: function(view) {
    if (this._currentView) {
      this._currentView.remove();
    }

    this._currentView = view
    this.$rootEl.html(view.render().$el)
  },

  exploreImgCollection: function() {
    if (this._expImgCollection) {
      return this._expImgCollection;
    } else {
      this._expImgCollection = new ModelFindrApp.Collections.Images;
      this._expImgCollection.fetch();

      return this._expImgCollection;
    }
  },

  cityImgCollection: function() {
    if (this._cityImgCollection) {
      return this._cityImgCollection;
    } else {
      this._cityImgCollection = new ModelFindrApp.Collections.Images;
      this._cityImgCollection.fetch({ data: { your_city: true} });;

      return this._cityImgCollection;
    }
  }
})
