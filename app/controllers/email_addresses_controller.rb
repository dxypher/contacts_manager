class EmailAddressesController < ApplicationController

  before_filter :lookup_email_address, only: [:edit, :update, :destroy]
  def new
    @email_address = EmailAddress.new(contact_id: params[:contact_id], contact_type: params[:contact_type])

    respond_to do |format|
      format.html
      format.json { render json: @email_address }
    end
  end

  def edit
  end

  def create
    @email_address = EmailAddress.new(params[:email_address])

    respond_to do |format|
      if @email_address.save
        format.html { redirect_to @email_address.contact, notice: 'Email address was successfully created.' }
        format.json { render json: @email_address.contact, status: :created, location: @email_address }
      else
        format.html { render action: "new" }
        format.json { render json: @email_address.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @email_address.update_attributes(params[:email_address])
        format.html { redirect_to @email_address.contact, notice: 'Email address was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @email_address.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @email_address.destroy

    respond_to do |format|
      format.html { redirect_to email_addresses_url }
      format.json { head :no_content }
    end
  end

  private

  def lookup_email_address
    @email_address = EmailAddress.find(params[:id])
  end
end
