class Api::BenchesController < ApplicationController
  def index 
    @benches = Bench.all
    render json: @benches
  end

  def create
    @bench = Bench.create!(bench_params)

    if @bench.save
      render :show
    else
      render @bench.errors.full_messages
    end
  end

  private
  def bench_params
    params.require(:bench).permit(:description, :lat, :lng, :seating_capacity, :img_url)
  end
end