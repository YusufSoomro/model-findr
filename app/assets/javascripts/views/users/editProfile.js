ModelFindrApp.Views.EditProfile = Backbone.View.extend({
  template: JST['users/edit'],

  events: {
    "submit": "saveChanges"
  },

  initialize: function(options) {
    this.model = options.model;
    this.listenTo(this.model, "sync", this.render)
  },

  render: function() {
    this.$el.html(this.template({user: this.model}));
    return this;
  },

  saveChanges: function(event) {
    event.preventDefault();
    var formData = this.$('.edit-form').serializeJSON();
    console.log(formData);

    this.model.save(formData, {
      success: function() {
        Backbone.history.navigate("users/" + this.model.id, {trigger: true})
      }.bind(this),
      error: function() {
        console.log("oh neeewww");
      }
    })
  }
})
