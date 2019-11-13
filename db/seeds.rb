# frozen_string_literal: true

account = Account.create(account_type: 1,
               email: 'yeroshek@gmail.com',
               verified: true,
               phone_number: FFaker::PhoneNumber.phone_number,
               password: 'password', owner_mode: true)

user = User.create(name: FFaker::Lorem.word, account_id: account.id)
subscription = Subscription.create(start_at: Time.zone.today,
                                   end_at: Time.zone.today + 28.days,
                                   user_id: user.id,
                                   trial_period: true)

Institution.institution_types.each do |institution_type, _|
  institution = Institution.create(account_id: account.id,
                     institution_type: institution_type,
                     name: FFaker::Company.name,
                     latitude: 48.466496,
                     longitude: 35.050786,
                     address: FFaker::Address.street_address)

  favorite = Favorite.create(user_id: user.id)
  featured_lists = FeaturedListItem.create(institution_id: institution.id, favorite_id: favorite.id)
  category = Category.create(title: '1+1', institution_id: institution.id)

  cost = 20.0
  3.times do
    item = Item.create(category_id: category.id, cost: cost, has_discount: true, name: FFaker::Lorem.word)
    ItemDate.create(user_id: user.id, available: false, item_id: item.id)
    cost += 10.0
  end

  review = Review.create(institution_id: institution.id, user_id: user.id, rating: 3.0)
end
