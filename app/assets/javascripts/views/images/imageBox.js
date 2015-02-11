ModelFindrApp.Views.ImageBox = Backbone.CompositeView.extend({
  template: JST['images/box'],
  className: "modal-box",

  events: {
    "click .img-backdrop": "close",
    "click #chevron-left": "moveLeft",
    "click #chevron-right": "moveRight"
  },

  initialize: function (options) {
    this.url = options.url;
    this.userUsername = options.userUsername;
    this.userId = options.userId;
    this.imgCount = options.imgCount;
  },

  close: function (event) {
    this.remove();
  },

  moveLeft: function (event) {
    if (parseInt(this.imgCount) - 1 > -1) {
      var nextCount = parseInt(this.imgCount) - 1;
      this.imgCount = nextCount;
    }

    var nextImg = $('.img-list').find("[data-img-count='" + this.imgCount + "']");
    this.url = nextImg.attr("src")
    this.render();
  },

  moveRight: function (event) {
    var nextCount = parseInt(this.imgCount) + 1;
    var nextImg = $('.img-list').find("[data-img-count='" + nextCount + "']");
    
    if (nextImg.length > 0) {
      this.imgCount = nextCount
      this.url = nextImg.attr("src")
      this.render();
    }
  },

  render: function() {
    var content = this.template({
      url: this.url,
      userUsername: this.userUsername,
      userId: this.userId
    });

    this.$el.html(content);

    this.$('.img-box').attr("data-img-count", this.imgCount)
    return this;
  }
})
