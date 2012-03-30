class BakashasController < ApplicationController
  # GET /bakashas
  # GET /bakashas.json
  def index
    @bakashas = Bakasha.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bakashas }
    end
  end

  # GET /bakashas/1
  # GET /bakashas/1.json
  def show
    @bakasha = Bakasha.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bakasha }
    end
  end

  # GET /bakashas/new
  # GET /bakashas/new.json
  def new
    @bakasha = Bakasha.new
    @file = File.join "/docs/pics", File.basename(params[:file_name])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bakasha }
    end
  end

  # GET /bakashas/1/edit
  def edit
    @bakasha = Bakasha.find(params[:id])
  end

  # POST /bakashas
  # POST /bakashas.json
  def create
    @bakasha = Bakasha.new(params[:bakasha])

    respond_to do |format|
      if @bakasha.save
        format.html { redirect_to @bakasha, :notice => true }
        format.json { render json: @bakasha, status: :created, location: @bakasha }
      else
        format.html { render action: "new" }
        format.json { render json: @bakasha.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bakashas/1
  # PUT /bakashas/1.json
  def update
    @bakasha = Bakasha.find(params[:id])

    respond_to do |format|
      if @bakasha.update_attributes(params[:bakasha])
        format.html { redirect_to @bakasha, notice: 'Bakasha was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bakasha.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bakashas/1
  # DELETE /bakashas/1.json
  def destroy
    @bakasha = Bakasha.find(params[:id])
    @bakasha.destroy

    respond_to do |format|
      format.html { redirect_to bakashas_url }
      format.json { head :no_content }
    end
  end
end
