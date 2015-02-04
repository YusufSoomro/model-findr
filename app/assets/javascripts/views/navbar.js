ModelFindrApp.Views.Navbar = Backbone.View.extend({
  template: JST['navbar'],

  events: {
    "click #sign-out": "signOut"
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
  }
})
