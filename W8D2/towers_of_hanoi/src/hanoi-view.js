class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.fromIdx = null;
    this.$el.on("click", "ul", this.clickTower.bind(this));

    this.setupTowers();
    this.render();
  }

  setupTowers() {
    for (let i = 0; i < 3; i++) {
      let $tower = $("<ul>");

      for (let j = 0; j < 3; j++) {
        let $disc = $("<li>");
        $tower.append($disc);
      }

      this.$el.append($tower);
    }
  }

  render() {
    const $towers = this.$el.find("ul");
    $towers.removeClass();

    if (this.fromIdx != null) {
      $towers.eq(this.fromIdx).addClass('clicked');
    }

    this.game.towers.forEach((discs, i) => {
      const $discs = $towers.eq(i).children();
      $discs.removeClass();

      discs.forEach((width, j) => {
        $discs.eq(-(j + 1)).addClass(`disc-${width}`);
      });
    });

    if (this.game.isWon()) {
      this.$el.off("click");
      this.$el.addClass("game-over");
      alert("You have won!")
    }
  }

  clickTower(e) {
    const clickIdx = $(e.currentTarget).index();

    if (this.fromIdx === null) {
      this.fromIdx = clickIdx;
    } else if (this.fromIdx != null && clickIdx != null) {
      if ( !this.game.move(this.fromIdx, clickIdx)) {
        alert("invalid move!");
      }
      this.fromIdx = null;
    }

    this.render();
  }
}

module.exports = View;