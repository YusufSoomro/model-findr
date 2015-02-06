ModelFindrApp.Views.ImageIndex = Backbone.CompositeView.extend({
  template: JST['images/imageIndex'],

  initialize: function (options) {
    this.collection = options.collection;
    this.model = options.model;

    this.collection.each(function(img) {
      var imgLI = new ModelFindrApp.Views.ImageIndexItem({model: img})
      this.addSubview('.img-list', imgLI)
    }, this);
    this.listenTo(this.collection, 'add', this.addImage);
    this.listenTo(this.model, "sync", this.render);
  },

  addImage: function (image) {
    var imgLI = new ModelFindrApp.Views.ImageIndexItem({model: image});
    this.addSubview('.img-list', imgLI);
  },

  render: function() {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    this.$(".img-list").justifiedGallery({
      lastRow: 'justify',
      rowHeight: 200,
      margins: 5
    });

    return this;
  }
})