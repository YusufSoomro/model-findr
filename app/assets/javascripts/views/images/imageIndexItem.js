ModelFindrApp.Views.ImageIndexItem = Backbone.View.extend({
  template: JST["images/imgItem"],

  events: {
    "click .glyphicon-heart": "makeImgLike",
    "click a": "createUserView"
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
    if (ModelFindrApp.currentUserId === 12) {
      alert("Sorry, you have to create an account with us to do that.");
      return;
    }

    var that = this;
    this.$('.glyphicon-heart').css("color", "red");

    var newImgLike = new ModelFindrApp.Models.ImageLike({
      image_id: this.model.id,
      liker_id: ModelFindrApp.currentUserId
    })

    newImgLike.save({}, {
      success: function() {
        var likePlusOne = parseInt(this.$("#num-likes").data("id")) + 1
        this.$("#num-likes").html(likePlusOne + "")
      }.bind(that),
      error: function() {
        console.log("Lol, you can't like that twice newb.");
      }
    })
  },

  createUserView: function() {
    var newUserView = new ModelFindrApp.Models.UserView;

    newUserView.save({user_id: this.model.get('user_id')}, {
      success: function() {
        console.log("awwww yeeeaaaah!! User_view created, biatch");
      },
      error: function() {
        console.log("oh neeewww. Couldn't create the user_view");
      }
    })
  }
})
