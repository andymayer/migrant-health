class FactSheetsController < ApplicationController
  before_action :set_fact_sheet, only: [:show, :edit, :update, :destroy]

  # GET /fact_sheets
  def index
    @fact_sheets = FactSheet.all
  end

  # GET /fact_sheets/1
  def show
  end

  # GET /fact_sheets/new
  def new
    @fact_sheet = FactSheet.new
  end

  # GET /fact_sheets/1/edit
  def edit
  end

  # POST /fact_sheets
  def create
    @fact_sheet = FactSheet.new(fact_sheet_params)

    if @fact_sheet.save
      redirect_to @fact_sheet, notice: 'Fact sheet was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /fact_sheets/1
  def update
    if @fact_sheet.update(fact_sheet_params)
      redirect_to @fact_sheet, notice: 'Fact sheet was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /fact_sheets/1
  def destroy
    @fact_sheet.destroy
    redirect_to fact_sheets_url, notice: 'Fact sheet was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fact_sheet
      @fact_sheet = FactSheet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fact_sheet_params
      params.fetch(:fact_sheet, {})
    end
end
