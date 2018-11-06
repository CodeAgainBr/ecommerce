class SubCategoriasController < ApplicationController
  before_action :set_sub_categoria, only: [:show, :edit, :update, :destroy]

  # GET /sub_categorias
  # GET /sub_categorias.json
  def index
    @sub_categorias = SubCategoria.all
  end

  # GET /sub_categorias/1
  # GET /sub_categorias/1.json
  def show
  end

  # GET /sub_categorias/new
  def new
    @sub_categoria = SubCategoria.new
  end

  # GET /sub_categorias/1/edit
  def edit
  end

  # POST /sub_categorias
  # POST /sub_categorias.json
  def create
    @sub_categoria = SubCategoria.new(sub_categoria_params)

    respond_to do |format|
      if @sub_categoria.save
        format.html { redirect_to @sub_categoria, notice: 'Sub categoria was successfully created.' }
        format.json { render :show, status: :created, location: @sub_categoria }
      else
        format.html { render :new }
        format.json { render json: @sub_categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_categorias/1
  # PATCH/PUT /sub_categorias/1.json
  def update
    respond_to do |format|
      if @sub_categoria.update(sub_categoria_params)
        format.html { redirect_to @sub_categoria, notice: 'Sub categoria was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_categoria }
      else
        format.html { render :edit }
        format.json { render json: @sub_categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_categorias/1
  # DELETE /sub_categorias/1.json
  def destroy
    @sub_categoria.destroy
    respond_to do |format|
      format.html { redirect_to sub_categorias_url, notice: 'Sub categoria was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_categoria
      @sub_categoria = SubCategoria.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_categoria_params
      params.require(:sub_categoria).permit(:nome, :categoria_id)
    end
end
