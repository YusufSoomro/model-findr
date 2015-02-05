ModelFindrApp.Views.UserPortfolio = Backbone.CompositeView.extend({
  template: JST['users/portfolio'],

  initialize: function(options) {
    this.model = options.model;
    var imgIndex = new ModelFindrApp.Views.ImageIndex({
      collection: this.model.imageCollection(),
      model: this.model
    });
    this.addSubview('.users-imgs', imgIndex);

    this.listenTo(this.model, "sync", this.render);
  },

  render: function() {
    this.$el.html(this.template({user: this.model}));
    this.attachSubviews();

    return this;
  }
})
