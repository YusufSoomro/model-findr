ModelFindrApp.Views.UserIndex = Backbone.CompositeView.extend({
  template: JST['users/userIndex'],
  className: 'user-index',

  initialize: function(options) {
    this.collection = options.collection;
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function() {
    this.$el.html(this.template());

    this.collection.each(function(user) {
      var userItem = new ModelFindrApp.Views.UserIndexItem({model: user});
      this.addSubview('.user-list', userItem);
    }, this);
    this.attachSubviews();

    this.$('.user-list').masonry();

    return this;
  }
});
