class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /customers
  # GET /customers.json
  def index
    if params[:City] != NIL
      @customers = Customer.all.where(:city => params[:City]).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 50)
    elsif params[:Last_name] != NIL
      #@customers = Customer.all.where(:last_name => params[:Last_name]).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 50)
      @customers = Customer.where("last_name LIKE '%#{params[:Last_name]}%'").paginate(:page => params[:page], :per_page => 50)
    else
      @customers = Customer.all.order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 50)
    end
      #@customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json


=begin
  RUBY vytvara transakcie automaticky vzdy ked nejakym sposobom modifikuje databazu! :) :) We love Ruby

  def main_report
    @customer_pc = Customer.find(4)kk
  end
=end

  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html {redirect_to @customer, notice: 'Customer was successfully created.'}
        format.json {render :show, status: :created, location: @customer}
      else
        format.html {render :new}
        format.json {render json: @customer.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html {redirect_to @customer, notice: 'Customer was successfully updated.'}
        format.json {render :show, status: :ok, location: @customer}
      else
        format.html {render :edit}
        format.json {render json: @customer.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html {redirect_to customers_url, notice: 'Customer was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  def report_city

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = Customer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def customer_params
    params.require(:customer_pc).permit(:first_name, :last_name, :birth_date, :id_card_number, :street, :city, :zip)
  end

  def sort_column
    if Customer.column_names.include?(params[:sort]) then
      params[:sort]
    else
      "id"
    end
  end

  def sort_direction
    if %w[asc desc].include?(params[:direction]) then
      params[:direction]
    else
      "asc"
    end
  end
end

