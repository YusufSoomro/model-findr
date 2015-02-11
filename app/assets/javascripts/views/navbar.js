ModelFindrApp.Views.Navbar = Backbone.View.extend({
  template: JST['navbar'],

  events: {
    "click #logo": "exploreImgsPage",
    "click #sign-out": "signOut",
    'click #profile': "profilePage",
    'click #explore': "exploreImgsPage",
    'click #your-city': "cityImgsPage",
    'click #search-btn': "searchImgs"
  },

  render: function() {
    this.$el.addClass("navbar")
    this.$el.attr("id", "navbar")
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
  },

  cityImgsPage: function(event) {
    event.preventDefault();

    Backbone.history.navigate("city_imgs", {trigger: true});
  },

  searchImgs: function(event) {
    event.preventDefault();

    var city = $('#searchTextField').val();

    Backbone.history.navigate(encodeURI(city) + "/imgs", {trigger: true})
  }
})
