ModelFindrApp.Views.UserPortfolio = Backbone.CompositeView.extend({
  template: JST['users/portfolio'],

  events: {
    "click .profile-btn": "backToProfile",
    "click .upload-btn": "uploadImage"
  },

  initialize: function(options) {
    this.model = options.model;
    var imgIndex = new ModelFindrApp.Views.ImageIndex({
      collection: this.model.imageCollection(),
      model: this.model
    });
    this.addSubview('.users-imgs', imgIndex);

    // this.listenTo(this.model.imageCollection(), "add", this.render);
    this.listenTo(this.model, "sync", this.render);
  },

  render: function() {
    this.$el.html(this.template({user: this.model}));
    this.attachSubviews();

    return this;
  },

  backToProfile: function(event) {
    event.preventDefault();
    Backbone.history.navigate("users/" + this.model.id, {trigger: true})
  },

  uploadImage: function(event) {
    var that = this;

    filepicker.pick(
      {
        mimetypes: ['image/*', 'text/plain'],
        container: 'modal',
        services:['COMPUTER', 'FACEBOOK', 'GMAIL'],
      },
      function(blob){
        var newImage = new ModelFindrApp.Models.Image({
          user_id: this.model.id,
          img_url: blob.url,
          user_city: this.model.get('city')
        });

        newImage.save();
      }.bind(that),
      function(FPError){
        console.log(FPError.toString());
      }
    );
  }
})
