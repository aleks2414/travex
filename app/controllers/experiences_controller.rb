class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  before_action :filter_admin!, except: [:show, :index]

  # GET /experiences
  # GET /experiences.json
  def index
    @experiences = Experience.all

    @q= Experience.where(:disponible => true).ransack(params[:q])
    @experiences = @q.result.uniq

    prepare_meta_tags(title: "",
      description: "", 
      keywords: %w[Innovación en México, diferenciación],
      og: {
        site_name: "Inter Travex",
        title: "",
        description: "",
        type: 'website'
      }
      )

  end

  # GET /experiences/1
  # GET /experiences/1.json
  def show
    @experiences = Experience.where(:disponible => true).order('id ASC').limit(3)
    @contact = Contact.new
    @images = @experience.images.all
    @blocks = @experience.blocks.where("fecha_salida >= ?", Time.zone.now.beginning_of_day).order('id ASC')

    prepare_meta_tags(title: "",
      description: "", 
      keywords: %w[Innovación en México, diferenciación],
      og: {
        site_name: "Inter Travex",
        title: "",
        description: "",
        type: 'website'
      }
      )
  end

  # GET /experiences/new
  def new
    @experience = Experience.new
    @image = @experience.images.build
  end

  # GET /experiences/1/edit
  def edit
    @images = @experience.images
  end

  # POST /experiences
  # POST /experiences.json
  def create
    @experience = Experience.new(experience_params)
    @experience.user_id = current_user.id

    if @experience.save

      if params[:images_p] 
        params[:images_p].each do |image|
          @experience.images.create(image2: image)
        end
      end

      @images = @experience.images
      redirect_to edit_experience_path(@experience), notice: "Saved..."
    else
      render :new
    end
  end

  # PATCH/PUT /experiences/1
  # PATCH/PUT /experiences/1.json
  def update
    if @experience.update(experience_params)

      if params[:images_p] 
        params[:images_p].each do |image|
          @experience.images.create(image2: image)
        end
      end

      redirect_to edit_experience_path(@experience), notice: "Updated..."
    else
      render :edit
    end
  end

  # DELETE /experiences/1
  # DELETE /experiences/1.json
  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url, notice: 'Experience was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.friendly.find(params[:id])
    end

    def filter_admin!
     authenticate_user!
     redirect_to root_path, alert: "No tienes acceso" unless current_user.admin?
   end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_params
      params.require(:experience).permit(:disponible, :nombre, :lugar, :categoria, :dias, :foto, :slug, :user_id, :incluye, :itinerario, :que_plan, :recomendaciones, :address, :latitude, :longitude, :descripcion, images_attributes: [:id, :experience_id, :image2], blocks_attributes: [:id, :experience_id, :fecha_salida, :lugar_salida, :hora_salida, :fecha_regreso, :precio_adulto, :precio_nino, :capacidad])
    end
  end
