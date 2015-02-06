ModelFindrApp.Views.Navbar = Backbone.View.extend({
  template: JST['navbar'],

  events: {
    "click #sign-out": "signOut",
    'click #profile': "profilePage",
    'click #explore': "exploreImgsPage"
  },

  render: function() {
    this.$el.addClass("navbar")
    this.$el.html(this.template())
    return this;
  },

  signOut: function() {
    $.ajax({
      url: "/session",
      dataType: "json",
      method: "DELETE",
      success: function() {
        window.location = "/session/new";
      }
    });
  },

  profilePage: function() {
    Backbone.history.navigate('users/' + ModelFindrApp.currentUserId, {trigger: true})
  },

  exploreImgsPage: function(event) {
    event.preventDefault();

    Backbone.history.navigate("explore_imgs", {trigger: true});
  }
})
