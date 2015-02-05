ModelFindrApp.Views.UserShow = Backbone.View.extend({
  events: {
    'click #photo-btn': 'uploadPhoto'
  },

  template: JST['users/show'],
  tagName: 'div',

  attrsToDisplay: ["gender", "skill_type", "city", "email"],
  detailAttrs: ["experience", "compensation"],

  initialize: function(options) {
    this.model = options.model;
    this.listenTo(this.model, "sync", this.render);
    // this.listenTo(this.model.imageCollection(), "add", this.render)
  },

  render: function() {
    this.$el.attr('id', 'user-show-page');
    this.$el.html(this.template({user: this.model}));

    _.each(this.attrsToDisplay, function(atr) {
      var infoLI = $("<li>" + this.model.get(atr) + "</li>")
      this.$('#user-gen-info-list').append(infoLI)
    }, this);

    _.each(this.model.imageCollection().slice(0, 4), function(image) {
      var imageLI = $('<li>');
      imageLI.html("<img src=" + image.get('img_url') + ">");
      this.$('#user-portfolio').append(imageLI);
    }, this);

    return this;
  },

  uploadPhoto: function () {
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
          img_url: blob.url
        });

        newImage.save();
      }.bind(that),
      function(FPError){
        console.log(FPError.toString());
      }
    );
  }
})
