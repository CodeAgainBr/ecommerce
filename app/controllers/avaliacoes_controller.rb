class AvaliacoesController < ApplicationController
  before_action :set_avaliacao, only: [:show, :edit, :update, :destroy]

  # GET /avaliacoes
  # GET /avaliacoes.json
  def index
    @avaliacoes = Avaliacao.all
  end

  # GET /avaliacoes/1
  # GET /avaliacoes/1.json
  def show
  end

  # GET /avaliacoes/new
  def new
    @avaliacao = Avaliacao.new
  end

  # GET /avaliacoes/1/edit
  def edit
  end

  # POST /avaliacoes
  # POST /avaliacoes.json
  def create
    @avaliacao = Avaliacao.new(avaliacao_params)

    respond_to do |format|
      if @avaliacao.save
        format.html { redirect_to @avaliacao, notice: 'Avaliacao was successfully created.' }
        format.json { render :show, status: :created, location: @avaliacao }
      else
        format.html { render :new }
        format.json { render json: @avaliacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avaliacoes/1
  # PATCH/PUT /avaliacoes/1.json
  def update
    respond_to do |format|
      if @avaliacao.update(avaliacao_params)
        format.html { redirect_to @avaliacao, notice: 'Avaliacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @avaliacao }
      else
        format.html { render :edit }
        format.json { render json: @avaliacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avaliacoes/1
  # DELETE /avaliacoes/1.json
  def destroy
    @avaliacao.destroy
    respond_to do |format|
      format.html { redirect_to avaliacoes_url, notice: 'Avaliacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avaliacao
      @avaliacao = Avaliacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avaliacao_params
      params.require(:avaliacao).permit(:titulo, :descricao, :nota, :user_id, :produto_id)
    end
end
