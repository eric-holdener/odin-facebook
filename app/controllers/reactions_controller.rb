class ReactionsController < ApplicationController
  before_action :set_reaction, only: %i[ show edit update destroy ]

  # GET /reactions or /reactions.json
  def index
    @reactions = Reaction.all
  end

  # GET /reactions/1 or /reactions/1.json
  def show
  end

  # GET /reactions/new
  def new
    @reaction = Reaction.new
  end

  # GET /reactions/1/edit
  def edit
  end

  # POST /reactions or /reactions.json
  def create
    @post = Post.find(params[:post_id])
    @reaction = @post.reactions.build(reaction_params)
    respond_to do |format|
      if @reaction.save
        format.html { redirect_back(fallback_location: root_url) }
        format.json { render :show, status: :created, location: @reaction }
      else
        format.html { redirect_back(fallback_location: root_url) }
        format.json { render json: @reaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reactions/1 or /reactions/1.json
  def update
    respond_to do |format|
      if @reaction.update(reaction_params)
        format.html { redirect_to reaction_url(@reaction), notice: "Reaction was successfully updated." }
        format.json { render :show, status: :ok, location: @reaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reactions/1 or /reactions/1.json
  def destroy
    @post = Post.find(params[:post_id])
    @reaction = @post.reactions.where(user_id: params[:reaction][:user_id]).first
    @reaction.destroy
    if @reaction.reaction_type != params[:reaction][:reaction_type]
      @new_reaction = @post.reactions.build(reaction_params)
      respond_to do |format|
        if @new_reaction.save
          format.html { redirect_back(fallback_location: root_url) }
          format.json { render :show, status: :created, location: @new_reaction }
        else
          format.html { redirect_back(fallback_location: root_url) }
          format.json { render json: @new_reaction.errors, status: :unprocessable_entity }
        end

      end
    else
      respond_to do |format|
        format.html { redirect_to reactions_url, notice: "Reaction was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reaction
      @reaction = Reaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reaction_params
      params.require(:reaction).permit(:user_id, :reaction_type)
    end
end
