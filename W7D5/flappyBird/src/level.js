const CONSTANTS = {
  PIPE_DISTANCE: 220,
  PIPE_GAP: 150,
  PIPE_SPEED: 2,
  EDGE_BUFFER: 50,
  PIPE_WIDTH: 40
}

export default class Level {
  constructor(dimensions) {
    this.dimensions = dimensions;

    this.firstPipeDistance = this.dimensions.width + (CONSTANTS.PIPE_SPEED * 60);

    this.pipes = [
      this.createPipe(firstPipeDistance),
      this.createPipe(firstPipeDistance + CONSTANTS.PIPE_DISTANCE),
      this.createPipe(firstPipeDistance + (CONSTANTS.PIPE_DISTANCE * 2))
    ];
  }

  drawBackground(ctx) {
    ctx.fillStyle = "skyblue";
    ctx.fillRect(0, 0, this.dimensions.width, this.dimensions.height);
  }

  animate(ctx) {
    this.drawBackground(ctx);
    this.movePipes();
    this.drawPipes();
  }

  createPipe(x) {
    const heightRange = this.dimensions.height - (2 * CONSTANTS.EDGE_BUFFER)
      - CONSTANTS.PIPE_GAP;

    const gapTop = (Math.random() * heightRange) + CONSTANTS.EDGE_BUFFER;

    const pipe = {
      topPipe: {
        left: x,
        right: CONSTANTS.PIPE_WIDTH + x,
        top: 0,
        bottom: gapTop
      },
      bottomPipe: {
        left: x,
        right: CONSTANTS.PIPE_WIDTH + x,
        top: gapTop + CONSTANTS.PIPE_GAP,
        bottom: this.dimensions.height
      },
      passed: false
    };

    return pipe;
  }

  movePipes() {

  }

  drawPipes() {

  }
}