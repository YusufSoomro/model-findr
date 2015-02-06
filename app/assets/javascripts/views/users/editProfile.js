ModelFindrApp.Views.EditProfile = Backbone.View.extend({
  template: JST['users/edit'],

  events: {
    "submit": "saveChanges",
    "click .user-profile-btn": "backToProfile",
    "click .upload-btn": "uploadPhoto"
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
  },

  backToProfile: function(event) {
    event.preventDefault();
    Backbone.history.navigate("users/" + this.model.id, {trigger: true})
  },

  uploadPhoto: function (event) {
    event.preventDefault();

    var that = this;

    filepicker.pick(
      {
        mimetypes: ['image/*', 'text/plain'],
        container: 'modal',
        services:['COMPUTER', 'FACEBOOK', 'GMAIL'],
      },

      function(blob){
        this.model.save({avatar_img: blob.url});
      }.bind(that),

      function(FPError){
        console.log(FPError.toString());
      }
    );
  },
})
