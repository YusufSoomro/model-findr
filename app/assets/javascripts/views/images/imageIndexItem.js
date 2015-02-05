ModelFindrApp.Views.ImageIndexItem = Backbone.View.extend({
  render: function() {
    this.$el.addClass("img-item")
    var $imgContent = $("<img src=" + this.model.get("img_url") + ">");
    this.$el.html($imgContent);

    return this;
  }
})
