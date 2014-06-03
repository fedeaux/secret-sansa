class LeadEntriesController < ApplicationController
  before_action :set_lead_entry, only: [:show, :edit, :update, :destroy]

  # GET /lead_entries
  # GET /lead_entries.json
  def index
    @lead_entries = LeadEntry.where(:lead_id => params[:lead_id]).paginate(:page => params[:page])

    respond_to do |format|
      format.html { render action: 'index' }
      format.json {
        render :json => {
          :amount => @lead_entries.length,
          :success => true,
          :html => (render_to_string partial: 'list.html.haml')
        }
      }
    end
  end

  # GET /lead_entries/1
  # GET /lead_entries/1.json
  def show
  end

  # GET /lead_entries/new
  def new
    @lead_entry = LeadEntry.new
  end

  # GET /lead_entries/1/edit
  def edit
  end

  # POST /lead_entries
  # POST /lead_entries.json
  def create
    @lead_entry = LeadEntry.new lead_entry_params

    respond_to do |format|
      if @lead_entry.save
        format.html { redirect_to @lead_entry, notice: 'Lead entry was successfully created.' }
        format.json { render :json => {
            :success => true,
            :html => (render_to_string partial: 'list_item.html.haml', :lead_entry => @lead_entry)
          }
        }
      else
        format.html { render action: 'new' }
        format.json { render json: @lead_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lead_entries/1
  # PATCH/PUT /lead_entries/1.json
  def update
    respond_to do |format|
      if @lead_entry.update(lead_entry_params)
        format.html { redirect_to @lead_entry, notice: 'Lead entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lead_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lead_entries/1
  # DELETE /lead_entries/1.json
  def destroy
    @lead_entry.destroy
    respond_to do |format|
      format.html { redirect_to lead_entries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead_entry
      @lead_entry = LeadEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_entry_params
      params.require(:lead_entry).permit(:text, :date, :relation, :lead_id)
    end
end
