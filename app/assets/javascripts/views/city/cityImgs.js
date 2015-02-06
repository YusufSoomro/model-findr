ModelFindrApp.Views.CityImgs = Backbone.CompositeView.extend({
  template: JST['city/cityImgs'],

  initialize: function(options) {
    this.collection = options.collection;

    var imgIndex = new ModelFindrApp.Views.ImageIndex({
      collection: this.collection,
    });
    this.addSubview('.imgs', imgIndex);

    this.listenTo(this.collection, "sync", this.render);
  },

  render: function() {
    this.$el.html(this.template());
    this.attachSubviews();

    return this;
  }
})
