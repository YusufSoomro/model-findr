ModelFindrApp.Views.SearchUsers = Backbone.CompositeView.extend({
  template: JST['search/searchUsers'],

  events: {
    "click .search-imgs": "navToSearchImgs"
  },

  initialize: function(options) {
    this.collection = options.collection;
    this.city = options.city;

    var userIndex = new ModelFindrApp.Views.UserIndex({
      collection: this.collection
    });
    this.addSubview('.users', userIndex);

    this.listenTo(this.collection, "sync", this.render);
  },

  render: function() {
    this.$el.html(this.template({city: this.city}));
    this.attachSubviews();

    return this;
  },

  navToSearchImgs: function(event) {
    event.preventDefault();
    city = window.location.hash

    Backbone.history.navigate(city.slice(0, city.length - 6) + "/imgs", {trigger: true})
  }
})
