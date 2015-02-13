ModelFindrApp.Views.UserShow = Backbone.View.extend({
  events: {
    'click #photo-btn': 'uploadPhoto',
    'click .pf-btn': 'navToPortfolio',
    'click #edit-btn': 'navToEdit'
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
      var imageLI = $('<div>');
      imageLI.html("<img src=" + image.get('img_url') + ">");
      this.$('#user-portfolio').append(imageLI);
    }, this);

    this.$('#user-portfolio').justifiedGallery({
      lastRow: 'nojustify',
      rowHeight: 200,
      margins: 5,
      waitThumbnailsLoad: false
    });

    return this;
  },

  uploadPhoto: function () {
    if (ModelFindrApp.isGuest) {
      alert("Sorry, you can't do that unless you create an account with us!");
      return;
    }

    var that = this;

    filepicker.pickMultiple(
      {
        mimetypes: ['image/*', 'text/plain'],
        container: 'modal',
        services:['COMPUTER', 'FACEBOOK', 'GMAIL'],
      },
      function(blobs){

        _.each(blobs, function(blob) {
          var newImage = new ModelFindrApp.Models.Image({
            user_id: this.model.id,
            img_url: blob.url,
            user_city: this.model.get('city')
          });

          debugger;

          newImage.save();
        }, this)

      }.bind(that),
      function(FPError){
        console.log(FPError.toString());
      }
    );
  },

  navToPortfolio: function(event) {
    event.preventDefault();

    Backbone.history.navigate('users/' + this.model.id + '/portfolio', {trigger: true})
  },

  navToEdit: function(event) {
    event.preventDefault();
    if (ModelFindrApp.isGuest) {
      alert("Sorry, you can't do that unless you create an account with us!");
      return;
    }

    Backbone.history.navigate("users/" + this.model.id + "/edit", {trigger: true})
  }
})
