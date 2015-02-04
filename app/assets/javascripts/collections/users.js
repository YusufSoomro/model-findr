ModelFindrApp.Collections.Users = Backbone.Collection.extend({
  url: 'api/users',
  model: ModelFindrApp.Models.User,

  getOrFetch: function(id) {
    if (this.get(id)) {
      return this.get(id);
    } else {
      var user = new ModelFindrApp.Models.User({id: id});
      user.fetch();
      return user;
    }
  }
})
