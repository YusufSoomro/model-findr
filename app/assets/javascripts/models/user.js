ModelFindrApp.Models.User = Backbone.Model.extend({
  urlRoot: 'api/users',

  parse: function(resp) {
    if (resp.images) {
      this.imageCollection().set(resp.images);
      delete resp.images;
    }

    return resp;
  },

  imageCollection: function() {
    if (this._images) {
      return this._images
    } else {
      this._images = new ModelFindrApp.Collections.Images
      return this._images
    }
  }
})
