class ArtworksController < ApplicationController

    def index
        if params[:user_id]
            render json: Artwork.artworks_by_id(params[:user_id])
        else
            render json: User.all
        end
    end

    def show
        render json: Artwork.find(params[:id])
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork
        else
            render jason: artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy
        render json: artwork
    end

    def update
        artwork = Artwork.find(params[:id])

        if artwork.update(artwork_params)
            render jason: artwork
        else
            render jason: artwork.errors.full_messages, status: 422
        end
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end