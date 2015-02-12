ModelFindrApp.Views.NoResults = Backbone.View.extend({
  template: JST['search/noResultsUsers'],
  className: 'no-results',

  render: function() {
    this.$el.html(this.template());

    return this;
  }
})
