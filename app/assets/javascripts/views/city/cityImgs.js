ModelFindrApp.Views.CityImgs = Backbone.CompositeView.extend({
  template: JST['city/cityImgs'],

  events: {
    "click .city-imgs": "navToCityImgs"
  },

  initialize: function(options) {
    this.collection = options.collection;
    this.randomize = options.randomize;

    var imgIndex = new ModelFindrApp.Views.ImageIndex({
      collection: this.collection,
      randomize: this.randomize
    });
    this.addSubview('.imgs', imgIndex);

    this.listenTo(this.collection, "sync", this.render);
  },

  render: function() {
    this.$el.html(this.template());
    this.attachSubviews();

    return this;
  },

  navToCityImgs: function(event) {
    event.preventDefault();

    Backbone.history.navigate("city_imgs", {trigger: true})
  }
})
