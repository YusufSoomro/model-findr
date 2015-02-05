ModelFindrApp.Models.Image = Backbone.Model.extend({
  urlRoot: '/api/images',

  parse: function(resp) {
    if (resp.image_likes) {
      this.imageLikes().set(resp.image_likes);
      delete resp.image_likes;
    }

    return resp;
  },

  imageLikes: function() {
    if (this._imageLikes) {
      return this._imageLikes
    } else {
      this._imageLikes = new ModelFindrApp.Collections.ImageLikes
      return this._imageLikes
    }
  }
})
