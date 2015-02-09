ModelFindrApp.Views.ExploreUsers = Backbone.CompositeView.extend({
  template: JST['explore/exploreUsers'],

  events: {
    "click .explore-imgs": "navToExpImgs"
  },

  initialize: function(options) {
    this.collection = options.collection;
    this.randomize = options.randomize;

    var imgIndex = new ModelFindrApp.Views.UserIndex({
      collection: this.collection
    });
    this.addSubview('.users', imgIndex);

    this.listenTo(this.collection, "sync", this.render);
  },

  render: function() {
    this.$el.html(this.template());
    this.attachSubviews();

    return this;
  },

  navToExpImgs: function(event) {
    event.preventDefault();
    Backbone.history.navigate("explore_imgs", {trigger: true})
  }
})
