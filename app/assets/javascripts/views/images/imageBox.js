ModelFindrApp.Views.ImageBox = Backbone.CompositeView.extend({
  template: JST['images/box'],
  className: "modal-box",

  events: {
    "click .img-backdrop": "close"
  },

  initialize: function (options) {
    this.url = options.url;
    this.userUsername = options.userUsername;
    this.userId = options.userId;
  },

  close: function (event) {
    this.remove();
  },

  render: function() {
    var content = this.template({
      url: this.url,
      userUsername: this.userUsername,
      userId: this.userId
    });

    this.$el.html(content);
    return this;
  }
})
