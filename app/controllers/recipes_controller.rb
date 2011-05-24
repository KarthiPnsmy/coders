class RecipesController < ApplicationController
  require 'will_paginate'
  before_filter :protect
  
  # GET /recipes
  # GET /recipes.xml
  def index
    #@recipes = Recipe.all
    @recipes = Recipe.paginate :page => params[:page],:per_page => 3, :order => 'created_at DESC'
    #@recipes = Recipe.paginate :per_page => 2, :page=>params[:page]
    #@recipes = Recipe.paginate :per_page => 10, :page => params[:recipe_page],:order => 'name ASC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.xml
  def show
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.xml
  def new
    @recipe = Recipe.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # POST /recipes
  # POST /recipes.xml
  def create
    @user=User.find(session[:user])
    params[:recipe][:user_id]=session[:user]
    params[:recipe][:user_name]=@user.name
    @recipe = Recipe.new(params[:recipe])

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to(recipes_path, :notice => 'Recipe was successfully created.') }
        format.xml  { render :xml => recipes_path, :status => :created, :location => @recipe }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.xml
  def update
    @user=User.find(session[:user])
    params[:recipe][:user_id]=session[:user]
    params[:recipe][:user_name]=@user.name
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to(@recipe, :notice => 'Recipe was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.xml
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to(recipes_url) }
      format.xml  { head :ok }
    end
  end

  def search
    @user=User.find(session[:user])
    @query = params[:search] || ''
    @recipes = Recipe.paginate :page => params[:page],:per_page => 3, :conditions=>["name like ?","#{@query}%"], :order => 'created_at DESC'
    #@recipes = Recipe.find(:all, :conditions=>["name like ?","#{@query}%"])
    if @recipes.blank?
      puts 'ueeeeeeeeeeeeeeeeeeerrrrrrrrrr'
      flash[:notice] = 'No recipe matched your search criteria.'
      redirect_to @user
    end
    
  end

end
