require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe CharacteristicsController do

  # This should return the minimal set of attributes required to create a valid
  # Characteristic. As you add validations to Characteristic, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "characteristicable_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CharacteristicsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all characteristics as @characteristics" do
      characteristic = Characteristic.create! valid_attributes
      get :index, {}, valid_session
      assigns(:characteristics).should eq([characteristic])
    end
  end

  describe "GET show" do
    it "assigns the requested characteristic as @characteristic" do
      characteristic = Characteristic.create! valid_attributes
      get :show, {:id => characteristic.to_param}, valid_session
      assigns(:characteristic).should eq(characteristic)
    end
  end

  describe "GET new" do
    it "assigns a new characteristic as @characteristic" do
      get :new, {}, valid_session
      assigns(:characteristic).should be_a_new(Characteristic)
    end
  end

  describe "GET edit" do
    it "assigns the requested characteristic as @characteristic" do
      characteristic = Characteristic.create! valid_attributes
      get :edit, {:id => characteristic.to_param}, valid_session
      assigns(:characteristic).should eq(characteristic)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Characteristic" do
        expect {
          post :create, {:characteristic => valid_attributes}, valid_session
        }.to change(Characteristic, :count).by(1)
      end

      it "assigns a newly created characteristic as @characteristic" do
        post :create, {:characteristic => valid_attributes}, valid_session
        assigns(:characteristic).should be_a(Characteristic)
        assigns(:characteristic).should be_persisted
      end

      it "redirects to the created characteristic" do
        post :create, {:characteristic => valid_attributes}, valid_session
        response.should redirect_to(Characteristic.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved characteristic as @characteristic" do
        # Trigger the behavior that occurs when invalid params are submitted
        Characteristic.any_instance.stub(:save).and_return(false)
        post :create, {:characteristic => { "characteristicable_id" => "invalid value" }}, valid_session
        assigns(:characteristic).should be_a_new(Characteristic)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Characteristic.any_instance.stub(:save).and_return(false)
        post :create, {:characteristic => { "characteristicable_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested characteristic" do
        characteristic = Characteristic.create! valid_attributes
        # Assuming there are no other characteristics in the database, this
        # specifies that the Characteristic created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Characteristic.any_instance.should_receive(:update).with({ "characteristicable_id" => "1" })
        put :update, {:id => characteristic.to_param, :characteristic => { "characteristicable_id" => "1" }}, valid_session
      end

      it "assigns the requested characteristic as @characteristic" do
        characteristic = Characteristic.create! valid_attributes
        put :update, {:id => characteristic.to_param, :characteristic => valid_attributes}, valid_session
        assigns(:characteristic).should eq(characteristic)
      end

      it "redirects to the characteristic" do
        characteristic = Characteristic.create! valid_attributes
        put :update, {:id => characteristic.to_param, :characteristic => valid_attributes}, valid_session
        response.should redirect_to(characteristic)
      end
    end

    describe "with invalid params" do
      it "assigns the characteristic as @characteristic" do
        characteristic = Characteristic.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Characteristic.any_instance.stub(:save).and_return(false)
        put :update, {:id => characteristic.to_param, :characteristic => { "characteristicable_id" => "invalid value" }}, valid_session
        assigns(:characteristic).should eq(characteristic)
      end

      it "re-renders the 'edit' template" do
        characteristic = Characteristic.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Characteristic.any_instance.stub(:save).and_return(false)
        put :update, {:id => characteristic.to_param, :characteristic => { "characteristicable_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested characteristic" do
      characteristic = Characteristic.create! valid_attributes
      expect {
        delete :destroy, {:id => characteristic.to_param}, valid_session
      }.to change(Characteristic, :count).by(-1)
    end

    it "redirects to the characteristics list" do
      characteristic = Characteristic.create! valid_attributes
      delete :destroy, {:id => characteristic.to_param}, valid_session
      response.should redirect_to(characteristics_url)
    end
  end

end
