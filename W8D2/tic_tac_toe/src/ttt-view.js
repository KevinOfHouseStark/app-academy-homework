class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on("click", "li", (e) => {
      const $li = $(e.currentTarget);
      this.makeMove($li);
    });
  }

  makeMove($square) {
    const currentPlayer = this.game.currentPlayer;
    const pos = $square.data("pos");

    this.game.playMove(pos);

    $square.addClass(currentPlayer);

    if (this.game.isOver()) {
      this.$el.off("click");
      this.$el.addClass("game-over");
      const winner = this.game.winner();

      if (winner) {
        this.$el.append(`<h2>Winner is ${winner}!</h2>`);
        this.$el.addClass(`${winner}-wins`);
      } else {
        this.$el.append(`<h2>Game is a draw!</h2>`);
      }
    }
  }

  setupBoard() {
    const $ul = $("<ul>");

    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        let $li = $("<li>");
        $li.data("pos", [i, j])
        $ul.append($li);
      }
    }

    this.$el.append($ul);
  }
}

module.exports = View;
