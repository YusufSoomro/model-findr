ModelFindrApp.Views.CityUsers = Backbone.CompositeView.extend({
  template: JST['city/cityUsers'],

  events: {
    "click .city-imgs": "navToCityImgs"
  },

  initialize: function(options) {
    this.collection = options.collection;

    var usersIndex = new ModelFindrApp.Views.UserIndex({
      collection: this.collection
    });
    this.addSubview('.users', usersIndex);

    this.listenTo(this.collection, "sync", this.render);
  },

  render: function() {
    this.$el.html(this.template());
    this.attachSubviews();

    return this;
  },

  navToCityImgs: function() {
    Backbone.history.navigate("city_imgs", {trigger: true})
  }
})
