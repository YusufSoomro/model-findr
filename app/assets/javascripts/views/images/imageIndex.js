ModelFindrApp.Views.ImageIndex = Backbone.CompositeView.extend({
  template: JST['images/imageIndex'],

  initialize: function (options) {
    this.collection.each(function(img) {
      var imgLI = new ModelFindrApp.Views.ImageIndexItem({model: img})
      this.addSubview('.img-list', imgLI)
    }, this);
    this.listenTo(this.collection, 'add', this.addSubview.bind(this));
  },

  render: function() {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    this.$(".img-list").justifiedGallery({
      lastRow: 'justify',
      rowHeight: 400,
      margins: 5
    });

    return this;
  }
})
