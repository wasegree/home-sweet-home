
user1 = User.where(email: 'test1@test.test').first_or_create(password: '12345678', password_confirmation: '12345678')
user2 = User.where(email: 'test2@test.test').first_or_create(password: '12345678', password_confirmation: '12345678')


user_apartment_one = [
    {
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
    }
]

user_apartment_two = [
    {
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
    }
]

user_apartment_one.each do |attributes|
    user1.apartments.create(attributes)
    p"each apartments attributes #{attributes}"
  end

  user_apartment_two.each do |attributes|
    user2.apartments.create(attributes)
    p"each apartments attributes #{attributes}"
  end