ModelFindrApp.Collections.Images = Backbone.Collection.extend({
  model: ModelFindrApp.Models.Image,
  url: 'api/images',

  comparator: function(img) {
    return -img.id
  }
})
