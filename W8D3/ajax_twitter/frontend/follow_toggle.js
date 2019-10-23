const APIUtil = require('./api_util');

class FollowToggle {
  constructor(el, options) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id") || options.userId;
    this.followState = this.$el.data("initial-follow-state") || options.followState;

    this.render();
    this.$el.on('click', this.handleClick.bind(this));
  };

  render() {
    if (this.followState === "unfollowed") {
      this.$el.prop('disabled', false);
      this.$el.html('Follow!');
    } else if (this.followState === "followed") {
      this.$el.prop('disabled', false);
      this.$el.html('Unfollow!');
    } else if (this.followState === "following" || this.followState === "unfollowing") {
      this.$el.prop('disabled', true);
    }
  }

  handleClick(event) {
    const followToggleInstance = this;

    event.preventDefault();

    if (this.followState === "unfollowed") {
      followToggleInstance.followState = "following";
      followToggleInstance.render();
      APIUtil.followUser(this.userId).then( () => {
        followToggleInstance.followState = "followed";
        followToggleInstance.render();
      });
    } else if (this.followState === "followed") {
      followToggleInstance.followState = "unfollowing";
      followToggleInstance.render();
      APIUtil.unfollowUser(this.userId).then( () => {
        followToggleInstance.followState = "unfollowed";
        followToggleInstance.render();
      });
    }
  }
};

module.exports = FollowToggle;

