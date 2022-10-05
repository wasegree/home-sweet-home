require 'rails_helper'

RSpec.describe "Apartments", type: :request do
    describe "GET /index" do
      it 'returns a list of apartments' do
      
        user = User.where(email: 'test@example.com').first_or_create(password: '12345678', password_confirmation: '12345678')

        user.apartments.create(
          street: '812 north wing dr.',
          city: 'San Diego',
          state: 'California',
          manager: 'Sierra Fisher',
          email: 'sierrafisher@test.com',
          price: '2700',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'yes',
          image: 'https://images.unsplash.com/photo-1585687289344-3660294921b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
        )
    
    get '/apartments'

        apartments = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        expect(apartments.length).to eq(1)
    end
  end

  describe "POST /create" do
    
    it"creates a new listing" do
      user = User.where(email: 'test@example.com').first_or_create(password: '12345678', password_confirmation: '12345678')
  
      apartment_params ={
        apartment: {
          street: '812 north wing dr.',
          city: 'San Diego',
          state: 'California',
          manager: 'Sierra Fisher',
          email: 'sierrafisher@test.com',
          price: '2700',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'yes',
          image: 'https://images.unsplash.com/photo-1585687289344-3660294921b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
          user_id: user.id 
      }
    }
  
    post '/apartments', params: apartment_params

    apartment = JSON.parse(response.body)
    expect(response).to have_http_status(200)
    
    expect(apartment['street']).to eq "812 north wing dr."
    expect(apartment['city']).to eq "San Diego"
    expect(apartment['state']).to eq "California"
    expect(apartment['manager']).to eq "Sierra Fisher"
    expect(apartment['email']).to eq "sierrafisher@test.com"
    expect(apartment['price']).to eq "2700"
    expect(apartment['bedrooms']).to eq 2
    expect(apartment['bathrooms']).to eq 2
    expect(apartment['pets']).to eq "yes"
    expect(apartment['image']).to eq "https://images.unsplash.com/photo-1585687289344-3660294921b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
    end
  end

  it "doesn't create a apartment without a street" do

    user = User.where(email: 'test@example.com').first_or_create(password: '12345678', password_confirmation: '12345678')

    apartment_params = {
      apartment: {
          city: 'San Diego',
          state: 'California',
          manager: 'Sierra Fisher',
          email: 'sierrafisher@test.com',
          price: '2700',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'yes',
          image: 'https://images.unsplash.com/photo-1585687289344-3660294921b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
          user_id: user.id  
      }
    }

    post "/apartments", params: apartment_params
    expect(response.status).to eq 422
    apartment = JSON.parse(response.body)
    expect(apartment['street']).to include "can't be blank" 
  end

  it "doesn't create a apartment without a city" do

    user = User.where(email: 'test@example.com').first_or_create(password: '12345678', password_confirmation: '12345678')

    apartment_params = {
      apartment: {
          street: '812 north wing dr.',
          state: 'California',
          manager: 'Sierra Fisher',
          email: 'sierrafisher@test.com',
          price: '2700',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'yes',
          image: 'https://images.unsplash.com/photo-1585687289344-3660294921b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
          user_id: user.id  
      }
    }

    post "/apartments", params: apartment_params
    expect(response.status).to eq 422
    apartment = JSON.parse(response.body)
    expect(apartment['city']).to include "can't be blank" 
  end
  
  it "doesn't create a apartment without a state" do

    user = User.where(email: 'test@example.com').first_or_create(password: '12345678', password_confirmation: '12345678')

    apartment_params = {
      apartment: {
          street: '812 north wing dr.',
          city: 'San Diego',
          manager: 'Sierra Fisher',
          email: 'sierrafisher@test.com',
          price: '2700',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'yes',
          image: 'https://images.unsplash.com/photo-1585687289344-3660294921b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
          user_id: user.id  
      }
    }

    post "/apartments", params: apartment_params
    expect(response.status).to eq 422
    apartment = JSON.parse(response.body)
    expect(apartment['state']).to include "can't be blank" 
  end

  it "doesn't create a apartment without a manager" do

    user = User.where(email: 'test@example.com').first_or_create(password: '12345678', password_confirmation: '12345678')

    apartment_params = {
      apartment: {
          street: '812 north wing dr.',
          city: 'San Diego',
          state: 'California',
          email: 'sierrafisher@test.com',
          price: '2700',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'yes',
          image: 'https://images.unsplash.com/photo-1585687289344-3660294921b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
          user_id: user.id  
      }
    }

    post "/apartments", params: apartment_params
    expect(response.status).to eq 422
    apartment = JSON.parse(response.body)
    expect(apartment['manager']).to include "can't be blank" 
  end

  it "doesn't create a apartment without a email" do

    user = User.where(email: 'test@example.com').first_or_create(password: '12345678', password_confirmation: '12345678')

    apartment_params = {
      apartment: {
          street: '812 north wing dr.',
          city: 'San Diego',
          state: 'California',
          manager: 'Sierra Fisher',
          price: '2700',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'yes',
          image: 'https://images.unsplash.com/photo-1585687289344-3660294921b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
          user_id: user.id  
      }
    }

    post "/apartments", params: apartment_params
    expect(response.status).to eq 422
    apartment = JSON.parse(response.body)
    expect(apartment['email']).to include "can't be blank" 
  end

  it "doesn't create a apartment without a price" do

    user = User.where(email: 'test@example.com').first_or_create(password: '12345678', password_confirmation: '12345678')

    apartment_params = {
      apartment: {
          street: '812 north wing dr.',
          city: 'San Diego',
          state: 'California',
          manager: 'Sierra Fisher',
          email: 'sierrafisher@test.com',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'yes',
          image: 'https://images.unsplash.com/photo-1585687289344-3660294921b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
          user_id: user.id  
      }
    }

    post "/apartments", params: apartment_params
    expect(response.status).to eq 422
    apartment = JSON.parse(response.body)
    expect(apartment['price']).to include "can't be blank" 
  end

  it "doesn't create a apartment without bedrooms" do

    user = User.where(email: 'test@example.com').first_or_create(password: '12345678', password_confirmation: '12345678')

    apartment_params = {
      apartment: {
          street: '812 north wing dr.',
          city: 'San Diego',
          state: 'California',
          manager: 'Sierra Fisher',
          email: 'sierrafisher@test.com',
          price: '2700',
          bathrooms: 2,
          pets: 'yes',
          image: 'https://images.unsplash.com/photo-1585687289344-3660294921b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
          user_id: user.id  
      }
    }

    post "/apartments", params: apartment_params
    expect(response.status).to eq 422
    apartment = JSON.parse(response.body)
    expect(apartment['bedrooms']).to include "can't be blank" 
  end

  it "doesn't create a apartment without bathrooms" do

    user = User.where(email: 'test@example.com').first_or_create(password: '12345678', password_confirmation: '12345678')

    apartment_params = {
      apartment: {
          street: '812 north wing dr.',
          city: 'San Diego',
          state: 'California',
          manager: 'Sierra Fisher',
          email: 'sierrafisher@test.com',
          price: '2700',
          bedrooms: 2,
          pets: 'yes',
          image: 'https://images.unsplash.com/photo-1585687289344-3660294921b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
          user_id: user.id  
      }
    }

    post "/apartments", params: apartment_params
    expect(response.status).to eq 422
    apartment = JSON.parse(response.body)
    expect(apartment['bathrooms']).to include "can't be blank" 
  end

  it "doesn't create a apartment without pets" do

    user = User.where(email: 'test@example.com').first_or_create(password: '12345678', password_confirmation: '12345678')

    apartment_params = {
      apartment: {
          street: '812 north wing dr.',
          city: 'San Diego',
          state: 'California',
          manager: 'Sierra Fisher',
          email: 'sierrafisher@test.com',
          price: '2700',
          bedrooms: 2,
          bathrooms: 2,
          image: 'https://images.unsplash.com/photo-1585687289344-3660294921b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
          user_id: user.id  
      }
    }

    post "/apartments", params: apartment_params
    expect(response.status).to eq 422
    apartment = JSON.parse(response.body)
    expect(apartment['pets']).to include "can't be blank" 
  end

  it "doesn't create a apartment without an image" do

    user = User.where(email: 'test@example.com').first_or_create(password: '12345678', password_confirmation: '12345678')

    apartment_params = {
      apartment: {
          street: '812 north wing dr.',
          city: 'San Diego',
          state: 'California',
          manager: 'Sierra Fisher',
          email: 'sierrafisher@test.com',
          price: '2700',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'yes',
          user_id: user.id  
      }
    }

    post "/apartments", params: apartment_params
    expect(response.status).to eq 422
    apartment = JSON.parse(response.body)
    expect(apartment['image']).to include "can't be blank" 
  end

  describe "PATCH /update" do
    
    it"updates an existing apartment" do
      user = User.where(email: 'test@example.com').first_or_create(password: '12345678', password_confirmation: '12345678')
  
      apartment_params ={
        apartment: {
          street: '812 north wing dr.',
          city: 'San Diego',
          state: 'California',
          manager: 'Sierra Fisher',
          email: 'sierrafisher@test.com',
          price: '2700',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'yes',
          image: 'https://images.unsplash.com/photo-1585687289344-3660294921b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
          user_id: user.id  

      }
    }
  
    post '/apartments', params: apartment_params
    apartment = Apartment.first

    updated_apartment_params = {
      apartment: {
          name: "Buzz Coffee",
          street: "123 other way",
          city: "San Diego",
          state: "CA",
          zip: "22400",
          description: "pet friendly apartment one",
          image:"https://images.hellogiggles.com/uploads/2017/06/23025549/coffeedoggettyimages-585356343-e1498237725281.jpg",
          user_id: user.id  

      }
    }

      patch "/apartments/#{apartment.id}", params: updated_apartment_params
      updated_apartment = Apartment.find(apartment.id)
      expect(response).to have_http_status(200)
      
      expect(updated_apartment.state).to eq "CA"
    end
  end

  describe"DELETE /destroy" do
    it"deletes an apartment" do

      user = User.where(email: 'test@example.com').first_or_create(password: '12345678', password_confirmation: '12345678')
      
      apartment_params = {
        apartment: {
          street: '812 north wing dr.',
          city: 'San Diego',
          state: 'California',
          manager: 'Sierra Fisher',
          email: 'sierrafisher@test.com',
          price: '2700',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'yes',
          image: 'https://images.unsplash.com/photo-1585687289344-3660294921b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
          user_id: user.id  
        }
      }

      post "/apartments", params: apartment_params
      apartment = Apartment.first
      delete"/apartments/#{apartment.id}"
      expect(response).to have_http_status(200)
      apartments = Apartment.all
      expect(apartments).to be_empty
    end
  end
end


