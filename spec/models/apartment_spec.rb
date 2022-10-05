require 'rails_helper'

RSpec.describe Apartment, type: :model do
  user = User.where(email: 'test1@test.test').first_or_create(password: '12345678', password_confirmation: '12345678')

  it 'has to exist' do 
    apartment = user.apartments.create(
      street: '123 timber rd.',
      city: 'Houston',
      state: 'Texas',
      manager: 'Tim Jackson',
      email: 'timjackson@test.com',
      price: '2000',
      bedrooms: 1,
      bathrooms: 1,
      pets: 'yes',
      image: 'https://images.unsplash.com/photo-1580041065738-e72023775cdc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
    )
    expect(apartment).to be_valid
  end

  it 'is not valid without street' do
    apartment = user.apartments.create(
      city: 'Houston',
      state: 'Texas',
      manager: 'Tim Jackson',
      email: 'timjackson@test.com',
      price: '2000',
      bedrooms: 1,
      bathrooms: 1,
      pets: 'yes',
      image: 'https://images.unsplash.com/photo-1580041065738-e72023775cdc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
    )
  end

  it 'is not valid without city' do
    apartment = user.apartments.create(
      street: '123 timber rd.',
      state: 'Texas',
      manager: 'Tim Jackson',
      email: 'timjackson@test.com',
      price: '2000',
      bedrooms: 1,
      bathrooms: 1,
      pets: 'yes',
      image: 'https://images.unsplash.com/photo-1580041065738-e72023775cdc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
    )
    expect(apartment.errors[:city]).to_not be_empty
  end

  it 'is not valid without state' do
    apartment = user.apartments.create(
      street: '123 timber rd.',
      city: 'Houston',
      manager: 'Tim Jackson',
      email: 'timjackson@test.com',
      price: '2000',
      bedrooms: 1,
      bathrooms: 1,
      pets: 'yes',
      image: 'https://images.unsplash.com/photo-1580041065738-e72023775cdc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
    )
    expect(apartment.errors[:state]).to_not be_empty
  end

  it 'is not valid without manager' do
    apartment = user.apartments.create(
      street: '123 timber rd.',
      city: 'Houston',
      state: 'Texas',
      email: 'timjackson@test.com',
      price: '2000',
      bedrooms: 1,
      bathrooms: 1,
      pets: 'yes',
      image: 'https://images.unsplash.com/photo-1580041065738-e72023775cdc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',    
    )
    expect(apartment.errors[:manager]).to_not be_empty
  end

  it 'is not valid without email' do
    apartment = user.apartments.create(
      street: '123 timber rd.',
      city: 'Houston',
      state: 'Texas',
      manager: 'Tim Jackson',
      price: '2000',
      bedrooms: 1,
      bathrooms: 1,
      pets: 'yes',
      image: 'https://images.unsplash.com/photo-1580041065738-e72023775cdc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
    )
    expect(apartment.errors[:email]).to_not be_empty
  end

  it 'is not valid without price' do
    apartment = user.apartments.create(
      street: '123 timber rd.',
      city: 'Houston',
      state: 'Texas',
      manager: 'Tim Jackson',
      email: 'timjackson@test.com',
      bedrooms: 1,
      bathrooms: 1,
      pets: 'yes',
      image: 'https://images.unsplash.com/photo-1580041065738-e72023775cdc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
    )
    expect(apartment.errors[:price]).to_not be_empty
  end

  it 'is not valid without bedrooms' do
    apartment = user.apartments.create(
      street: '123 timber rd.',
      city: 'Houston',
      state: 'Texas',
      manager: 'Tim Jackson',
      email: 'timjackson@test.com',
      price: '2000',
      bathrooms: 1,
      pets: 'yes',
      image: 'https://images.unsplash.com/photo-1580041065738-e72023775cdc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
    )
    expect(apartment.errors[:bedrooms]).to_not be_empty
  end

  it 'is not valid without bathrooms' do
    apartment = user.apartments.create(
      street: '123 timber rd.',
      city: 'Houston',
      state: 'Texas',
      manager: 'Tim Jackson',
      email: 'timjackson@test.com',
      price: '2000',
      bedrooms: 1,
      pets: 'yes',
      image: 'https://images.unsplash.com/photo-1580041065738-e72023775cdc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
    )
    expect(apartment.errors[:bathrooms]).to_not be_empty
  end

  it 'is not valid without pets' do
    apartment = user.apartments.create(
      street: '123 timber rd.',
      city: 'Houston',
      state: 'Texas',
      manager: 'Tim Jackson',
      email: 'timjackson@test.com',
      price: '2000',
      bedrooms: 1,
      bathrooms: 1,
      image: 'https://images.unsplash.com/photo-1580041065738-e72023775cdc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
    )
    expect(apartment.errors[:pets]).to_not be_empty
  end

  it 'is not valid without image' do
    apartment = user.apartments.create(
      street: '123 timber rd.',
      city: 'Houston',
      state: 'Texas',
      manager: 'Tim Jackson',
      email: 'timjackson@test.com',
      price: '2000',
      bedrooms: 1,
      bathrooms: 1,
      pets: 'yes',
    )
    expect(apartment.errors[:image]).to_not be_empty
  end
end
