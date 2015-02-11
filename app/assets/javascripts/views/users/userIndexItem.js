ModelFindrApp.Views.UserIndexItem = Backbone.View.extend({
  template: JST['users/indexItem'],
  className: 'user-item',
  tagName: 'div',

  events: {
    "click a": "createUserView"
  },

  render: function() {
    this.$el.html(this.template({ user: this.model }));
    return this;
  },

  createUserView: function() {
    var newUserView = new ModelFindrApp.Models.UserView;

    newUserView.save({user_id: this.model.id}, {
      success: function() {
        console.log("awwww yeeeaaaah!! User_view created, biatch");
      },
      error: function() {
        console.log("oh neeewww. Couldn't create the user_view");
      }
    })
  }
})
