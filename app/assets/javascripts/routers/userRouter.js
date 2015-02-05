ModelFindrApp.Routers.UserRouter = Backbone.Router.extend({
  initialize: function() {
    this.userCollection = new ModelFindrApp.Collections.Users();
    this.$rootEl = $('#main');
  },

  routes: {
    "users/:id": "show",
    "": "blah"
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

  blah: function() {
    this.navbar();
  },

  _swapView: function(view) {
    if (this._currentView) {
      this._currentView.remove();
    }

    this._currentView = view
    this.$rootEl.html(view.render().$el)
  }
})
