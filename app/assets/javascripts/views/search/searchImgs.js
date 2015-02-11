ModelFindrApp.Views.SearchImgs = Backbone.CompositeView.extend({
  template: JST['search/searchImgs'],

  events: {
    "click .search-users": "navToSearchUsers"
  },

  initialize: function(options) {
    this.collection = options.collection;
    this.randomize = options.randomize;
    this.city = options.city;

    this.imgIndex = new ModelFindrApp.Views.ImageIndex({
      collection: this.collection,
      randomize: this.randomize
    });
    this.addSubview('.imgs', this.imgIndex);

    this.listenTo(this.collection, "sync", this.render);
  },

  render: function() {
    this.$el.html(this.template({city: this.city}));
    this.attachSubviews();

    return this;
  },

  navToSearchUsers: function(event) {
    event.preventDefault();
    city = window.location.hash

    Backbone.history.navigate(city.slice(0, city.length - 5) + "/users", {trigger: true})
  }
})
