ModelFindrApp.Routers.UserRouter = Backbone.Router.extend({
  initialize: function() {
    this.userCollection = new ModelFindrApp.Collections.Users();
    this.$rootEl = $('#main');
    this.navbar();
  },

  routes: {
    "users/:id": "show",
    "users/:id/portfolio": "userPortfolio",
    "users/:id/edit": "editProfile"
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

  _swapView: function(view) {
    if (this._currentView) {
      this._currentView.remove();
    }

    this._currentView = view
    this.$rootEl.html(view.render().$el)
  }
})
