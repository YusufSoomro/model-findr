ModelFindrApp.Collections.Images = Backbone.Collection.extend({
  model: ModelFindrApp.Models.Image,

  comparator: function(img) {
    return -img.id
  }
})
