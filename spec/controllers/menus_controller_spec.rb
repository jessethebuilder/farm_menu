require 'rails_helper'

RSpec.describe MenusController, type: :controller do
  let(:valid_attributes) {
    attributes_for :menu
  }

  let(:invalid_attributes) {
    attributes_for :menu, :name => ''
  }
  
  
  let(:section_attrs){ attributes_for :section }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MenusController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  # Index and Show rely on the existence of callback methods called set_menus_for_index
  # and set_menu_for_show to be available. ApplicationController is a convenient place.
  
  describe "GET #index" do
    it "assigns all menus as @menus" do
      menu = Menu.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:menus)).to eq([menu])
    end
  end

  describe "GET #show" do
    it "assigns the requested menu as @menu" do
      menu = Menu.create! valid_attributes
      get :show, {:id => menu.to_param}, valid_session
      expect(assigns(:menu)).to eq(menu)
    end
  end

  describe "GET #new" do
    it "assigns a new menu as @menu" do
      get :new, {}, valid_session
      expect(assigns(:menu)).to be_a_new(Menu)
    end
  end

  describe "GET #edit" do
    it "assigns the requested menu as @menu" do
      menu = Menu.create! valid_attributes
      get :edit, {:id => menu.to_param}, valid_session
      expect(assigns(:menu)).to eq(menu)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Menu" do
        expect {
          post :create, {:menu => valid_attributes}, valid_session
        }.to change(Menu, :count).by(1)
      end

      it "assigns a newly created menu as @menu" do
        post :create, {:menu => valid_attributes}, valid_session
        expect(assigns(:menu)).to be_a(Menu)
        expect(assigns(:menu)).to be_persisted
      end

      it "redirects to the created menu" do
        post :create, {:menu => valid_attributes}, valid_session
        expect(response).to redirect_to(Menu.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved menu as @menu" do
        post :create, {:menu => invalid_attributes}, valid_session
        expect(assigns(:menu)).to be_a_new(Menu)
      end

      it "re-renders the 'new' template" do
        post :create, {:menu => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
    
    describe 'Passing Attributes' do
      it 'should pass :description' do
        d = "A description goes here, and xxxxxxxx"
        post :create, {:menu => valid_attributes.merge(:description => d)}, valid_session
        Menu.last.description.should == d
      end  
      
      it 'should pass :published' do
        post :create, {:menu => valid_attributes.merge(:published => false)}, valid_session
        Menu.last.published.should == false
      end
      
      describe 'Section Attributes' do
      
        it 'should pass Section attributes' do   
          post :create, {:menu => valid_attributes.merge(:sections_attributes => [section_attrs])}, valid_session
          Menu.last.sections.count.should == 1
        end
        
        it 'should pass :description' do
          d = Faker::Lorem.sentences.join(" ")
          post :create, {:menu => valid_attributes.merge(:sections_attributes => [section_attrs.merge(:description => d)])}, valid_session
          Menu.last.sections.first.description.should == d
        end
        
        it 'should pass :published' do
          post :create, {:menu => valid_attributes.merge(:sections_attributes => [section_attrs.merge(:published => '0')])}, valid_session
          Menu.last.sections.first.published.should == false
        end
        
        it 'should pass :order' do
          post :create, {:menu => valid_attributes.merge(:sections_attributes => [section_attrs.merge(:order => 100)])}, valid_session
          Menu.last.sections.first.order.should == 100
        end
        
        specify 'it should accept _destroy and destroy (or not create, in this case)' do
          post :create, {:menu => valid_attributes.merge(:sections_attributes => [section_attrs.merge(:_destroy => '1')])}, valid_session
          Menu.last.sections.count.should == 0
        end
 
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for :menu, :name => 'The Name of a Menu'
      }

      it "updates the requested menu" do
        menu = Menu.create! valid_attributes
        put :update, {:id => menu.to_param, :menu => new_attributes}, valid_session
        menu.reload
        menu.name.should == 'The Name of a Menu'
      end

      it "assigns the requested menu as @menu" do
        menu = Menu.create! valid_attributes
        put :update, {:id => menu.to_param, :menu => valid_attributes}, valid_session
        expect(assigns(:menu)).to eq(menu)
      end

      it "redirects to the menu" do
        menu = Menu.create! valid_attributes
        put :update, {:id => menu.to_param, :menu => valid_attributes}, valid_session
        expect(response).to redirect_to(menu)
      end
      
      describe 'Section Attributes' do
        describe ':_destroy' do
          it 'should destroy the existing Section' do
            menu = Menu.create! valid_attributes
            section = Section.create!(section_attrs)
            menu.sections << section
            
            put :update, {:id => menu.to_param, :menu => {:sections_attributes => [{:id => section.to_param, :_destroy => '1'}]}
            
            # section.reload
            
            section.destroyed?.should == true
          end
        end
      end
    end

    context "with invalid params" do
      it "assigns the menu as @menu" do
        menu = Menu.create! valid_attributes
        put :update, {:id => menu.to_param, :menu => invalid_attributes}, valid_session
        expect(assigns(:menu)).to eq(menu)
      end

      it "re-renders the 'edit' template" do
        menu = Menu.create! valid_attributes
        put :update, {:id => menu.to_param, :menu => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested menu" do
      menu = Menu.create! valid_attributes
      expect {
        delete :destroy, {:id => menu.to_param}, valid_session
      }.to change(Menu, :count).by(-1)
    end

    it "redirects to the menus list" do
      menu = Menu.create! valid_attributes
      delete :destroy, {:id => menu.to_param}, valid_session
      expect(response).to redirect_to(menus_url)
    end
  end

end
