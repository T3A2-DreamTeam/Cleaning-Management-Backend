class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :update, :destroy]
  before_action :authorized
  before_action :authorizedAdmin, only: [:create, :destroy, :update]

  # GET /clients
  def index
    all_clients = Client.eager_load(:contact_information)

    clients = all_clients.map do |client|
      client.serialize
    end
    render json: clients, status: :ok
  end

  # GET /clients/1
  def show
    render json: @client.serialize, status: :ok
  end

  # POST /clients
  def create
    client = Client.new()
    client.contact_information_id = checkContactInformation(client_params).id

    if client.save
      render json: client.serialize, status: :created, location: client.serialize
    else
      render json: client.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(contact_information_id: checkContactInformation(client_params).id)
      render json: @client, status: :created
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # POST /clients/:id/notes
  def create_notes
    if @client.notes.create(note: client_params[:note])
      render json: @client.serialize, status: :created
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy
    if @client.destroy
      render json: { message: "Client deleted" }, status: :ok
    else
      render json: { error: "Could not delete" }, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def client_params
    params.permit(:email, :first_name, :last_name, :phone_number, :street_number, :street_address,
                  :unit_number, :suburb, :state, :postcode, :note)
  end
end
