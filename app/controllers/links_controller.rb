class LinksController < ApplicationController
    before_action :set_link, only: [:edit, :update, :show, :destroy]
    def new
        @link = Link.new
    end

    def create
        @link = current_user.links.build(link_params)
        if @link.save
            redirect_to link_path(@link), notice: "Success"
        else
            flash.now[:alert] = "Failed to create link"
            render :new
        end
    end

    def edit
    end

    def update
    end

    def show
    end

    def index
        if params[:category_id] && @category = Category.find_by(id: params[:id])
            @links = @category.links
        else
            flash.now[:alert] = "That Category doesn't exist" if params[:category_id]
            @links = Link.all
        end
    end

    def destroy
    end

    private

    def link_params
        params.require(:link).permit(:title, :url, :user_id, :category_id)
    end

    def set_link
        @link = Link.find_by(id: params[:id])
    end
end
