ModelFindrApp.Routers.UserRouter = Backbone.Router.extend({
  initialize: function() {
    this.userCollection = new ModelFindrApp.Collections.Users();
    this.$rootEl = $('#main');
    this.navbar();
  },

  routes: {
    "": "exploreImgs",
    "users/:id": "show",
    "users/:id/portfolio": "userPortfolio",
    "users/:id/edit": "editProfile",
    "explore_imgs": "exploreImgs",
    "explore_users": "exploreUsers",
    "city_imgs": "cityImgs",
    "city_users": "cityUsers"
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
      collection: this.exploreImgCollection(),
      randomize: true
    });

    this._swapView(exploreView);
  },

  exploreUsers: function() {
    var exploreView = new ModelFindrApp.Views.ExploreUsers({
      collection: this.exploreUsersCollection()
    })

    this._swapView(exploreView)
  },

  cityImgs: function() {
    var cityView = new ModelFindrApp.Views.CityImgs({
      collection: this.cityImgCollection(),
      randomize: true
    });

    this._swapView(cityView);
  },

  cityUsers: function() {
    var cityView = new ModelFindrApp.Views.CityUsers({
      collection: this.cityUsersCollection()
    })

    this._swapView(cityView)
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

  exploreUsersCollection: function() {
    if (this._expUserCollection) {
      return this.expUsersCollection;
    } else {
      this.expUsersCollection = new ModelFindrApp.Collections.Users;
      this.expUsersCollection.fetch();

      return this.expUsersCollection;
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
  },

  cityUsersCollection: function() {
    if (this._cityUsersCollection) {
      return this._cityUsersCollection;
    } else {
      this._cityUsersCollection = new ModelFindrApp.Collections.Users;
      this._cityUsersCollection.fetch({ data: { your_city: true} });

      return this._cityUsersCollection;
    }
  }
})
