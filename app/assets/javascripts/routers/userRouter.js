ModelFindrApp.Routers.UserRouter = Backbone.Router.extend({
  initialize: function() {
    this.userCollection = new ModelFindrApp.Collections.Users();
    this.$rootEl = $('#main');
  },

  routes: {
    "users/:id": "show"
  },

  show: function(id) {
    var user = this.userCollection.getOrFetch(id);
    var userShow = new ModelFindrApp.Views.UserShow({model: user})

    this._swapView(userShow);
  },

  _swapView: function(view) {
    if (this._currentView) {
      this._currentView.remove();
    }

    this._currentView = view
    this.$rootEl.html(view.render().$el)
  }
})
