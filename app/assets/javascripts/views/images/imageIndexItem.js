ModelFindrApp.Views.ImageIndexItem = Backbone.View.extend({
  template: JST["images/imgItem"],

  events: {
    "click .glyphicon-heart": "makeImgLike",
    // "click a": "navToUser"
  },

  render: function() {
    var content = this.template({
      picture: this.model
    })
    this.$el.html(content);

    if (this.model.get('liked')) {
      this.$('.glyphicon-heart').css("color", "red")
    }

    return this;
  },

  makeImgLike: function(event) {
    event.preventDefault();

    this.$('.glyphicon-heart').css("color", "red");

    var newImgLike = new ModelFindrApp.Models.ImageLike({
      image_id: this.model.id,
      liker_id: ModelFindrApp.currentUserId
    })

    newImgLike.save({}, {
      error: function() {
        console.log("Lol, you can't like that twice newb.");
      }
    })
  },

  navToUser: function(event) {
    event.preventDefault();

    Backbone.history.navigate("users/" + this.model.get("user_id"), {trigger: true})
  }
})
