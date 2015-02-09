ModelFindrApp.Views.ExploreImgs = Backbone.CompositeView.extend({
  template: JST['explore/exploreImgs'],

  events: {
    "click .explore-users": "navToExpUsers"
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

  navToExpUsers: function(event) {
    event.preventDefault();
    Backbone.history.navigate("explore_users", {trigger: true})
  }
})
