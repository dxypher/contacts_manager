class PhoneNumbersController < ApplicationController

  before_filter :lookup_phone_number, only: [:edit, :update, :destroy]

  def new
    @phone_number = PhoneNumber.new(contact_id: params[:contact_id], contact_type: params[:contact_type])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @phone_number }
    end
  end

  def edit
  end

  def create
    @phone_number = PhoneNumber.new(params[:phone_number])

    respond_to do |format|
      if @phone_number.save
        format.html { redirect_to @phone_number.contact, notice: 'Phone number was successfully created.' }
        format.json { render json: @phone_number.contact, status: :created, location: @phone_number }
      else
        format.html { render action: "new" }
        format.json { render json: @phone_number.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @phone_number.update_attributes(params[:phone_number])
        format.html { redirect_to @phone_number.contact, notice: 'Phone number was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @phone_number.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @phone_number.destroy

    respond_to do |format|
      format.html { redirect_to @phone_number.contact }
      format.json { head :no_content }
    end
  end

  private
  def lookup_phone_number
    @phone_number = PhoneNumber.find(params[:id])
  end
end
