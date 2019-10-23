const APIUtil = {
  followUser: id => {
    return $.ajax({
      method: "POST",
      dataType: "json",
      url: `/users/${id}/follow`,
      error: function () {
        console.log('Follow error!');
      }
    })
  },

  unfollowUser: id => {
     return $.ajax({
      method: "DELETE",
      dataType: "json",
      url: `/users/${id}/follow`,
      error: function () {
        console.log('Unfollow error!');
      }
    })
  },

  searchUsers: queryVal => {
    return $.ajax({
      method: "GET",
      dataType: "json",
      url: '/users/search',
      data: { queryVal }
    })
  }
};

module.exports = APIUtil;