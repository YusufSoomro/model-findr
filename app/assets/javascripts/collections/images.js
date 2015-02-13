ModelFindrApp.Collections.Images = Backbone.Collection.extend({
  model: ModelFindrApp.Models.Image,
  url: 'api/images',

  comparator: function(img1, img2) {
    if (img1.get('created_at') < img2.get('created_at')) {
      return 1;
    } else if (img1.get('created_at') > img2.get('created_at')) {
      return -1;
    } else {
      return 0;
    }
  }
})
