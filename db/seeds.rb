# frozen_string_literal: true

account = Account.create(account_type: 1,
               email: 'emma.yeroshek@gmail.com',
               verified: true,
               phone_number: FFaker::PhoneNumber.phone_number,
               password: 'password', owner_mode: true)

user = User.create(name: FFaker::Lorem.word, account_id: account.id)

Institution.institution_types.each do |institution_type, _|
  Institution.create(account_id: account.id,
                     institution_type: institution_type,
                     name: FFaker::Company.name,
                     latitude: 48.466496,
                     longitude: 35.050786,
                     address: FFaker::Address.street_address)
end
