ModelFindrApp.Views.ExploreImgs = Backbone.CompositeView.extend({
  template: JST['explore/exploreImgs'],

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
