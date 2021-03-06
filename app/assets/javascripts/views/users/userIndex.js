ModelFindrApp.Views.UserIndex = Backbone.CompositeView.extend({
  template: JST['users/userIndex'],
  className: 'user-index',

  initialize: function(options) {
    this.collection = options.collection;
    this.listenTo(this.collection, "sync", this.render);
    this.listenTo(this.collection, "sync", this.noResults)
  },

  render: function() {
    this.$el.html(this.template());

    this.collection.each(function(user) {
      var userItem = new ModelFindrApp.Views.UserIndexItem({model: user});
      this.addSubview('.user-list', userItem);
    }, this);

    this.$('.user-list').imagesLoaded( function() {
      this.$('.user-list').masonry();
    }.bind(this));

    this.attachSubviews();
    return this;
  },

  noResults: function() {
    if ($('.user-item').length === 0) {
      var noResultsView = new ModelFindrApp.Views.NoResults;
      $('.user-index').append(noResultsView.render().$el)
    }
  }
});
