ModelFindrApp.Views.UserIndexItem = Backbone.View.extend({
  template: JST['users/indexItem'],
  className: 'user-item',
  tagName: 'li',

  render: function() {
    this.$el.html(this.template({ user: this.model }));
    return this;
  }
})
