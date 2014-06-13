class CaregiversController < ApplicationController
  before_filter :authenticate_caregiver!, :except => [:index, :show]

  # GET /caregivers
  # GET /caregivers.json
  def index
    @search = Caregiver.search(params[:q].presence)
    # NOTE: The following line specifies the sort order.
    # This is reflected in the default sort criteria shown.
    # The user is free to remove these default criteria.
    @search.sorts = 'last_name asc' if @search.sorts.empty?
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
    @caregivers = @search.result
    @caregivers_count = @caregivers.count
    @caregivers = @caregivers.order("last_name").page(params[:page]).per(10)
  end

  def new
    @caregiver = Caregiver.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @caregivers }
    end
  end

  # GET /caregivers/1
  # GET /caregivers/1.json
  def show
    @caregiver = Caregiver.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @caregiver }
    end
  end


  # GET /caregivers/1/edit
  def edit
    @caregiver = current_caregiver
  end

  # PUT /caregivers/1
  # PUT /caregivers/1.json
  def update
    @caregiver = current_caregiver

    respond_to do |format|
      if @caregiver.update_attributes(params[:caregiver])
        format.html { redirect_to @caregiver, notice: 'Caregiver was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @caregiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caregivers/1
  # DELETE /caregivers/1.json
  def destroy
    @caregiver = Caregiver.find(params[:id])
    @caregiver.destroy

    respond_to do |format|
      format.html { redirect_to caregivers_url }
      format.json { head :no_content }
    end
  end
end





  def create
    @caregiver = Caregiver.create(params[:caregiver])
  end

#-------------------------------------------------------------------------------





