class CaregiversController < ApplicationController
  # GET /caregivers
  # GET /caregivers.json
  def index
    @caregivers = Caregiver.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @caregivers }
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

  # GET /caregivers/new
  # GET /caregivers/new.json
  def new
    @caregiver = Caregiver.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @caregiver }
    end
  end

  # GET /caregivers/1/edit
  def edit
    @caregiver = Caregiver.find(params[:id])
  end

  # POST /caregivers
  # POST /caregivers.json
  def create
    @caregiver = Caregiver.new(params[:caregiver])

    respond_to do |format|
      if @caregiver.save
        format.html { redirect_to @caregiver, notice: 'Caregiver was successfully created.' }
        format.json { render json: @caregiver, status: :created, location: @caregiver }
      else
        format.html { render action: "new" }
        format.json { render json: @caregiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /caregivers/1
  # PUT /caregivers/1.json
  def update
    @caregiver = Caregiver.find(params[:id])

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
