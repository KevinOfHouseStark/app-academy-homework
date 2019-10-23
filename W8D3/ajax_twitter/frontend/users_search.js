const APIUtil = require('./api_util');
const FollowToggle = require('./follow_toggle');

class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.$input = this.$el.find('input[name=query]');
    this.$ul = this.$el.find('.users');

    this.$input.on('input', this.handleInput.bind(this));
  }

  handleInput(event) {
    APIUtil.searchUsers(this.$input.val()).then(users => this.renderResults(users));
  }

  renderResults(users) {
    this.$ul.empty();
    users.forEach(user => {
      const $a = $(`<a>${user.username}</a>`);
      $a.attr('href', `/users/${user.id}`);

      const $button = $('<button></button>')
      new FollowToggle($button, {
        userId: user.id,
        followState: user.followed ? 'followed' : 'unfollowed'
      })

      const $li = $('<li></li>');
      $li.append($a);
      $li.append($button);
      this.$ul.append($li);
    })
  }
};

module.exports = UsersSearch;