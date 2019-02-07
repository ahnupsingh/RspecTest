require 'rails_helper'

describe Phone do
  it "does not allow duplicate phone numbers per contact" do
    contact = Contact.create(
      firstname: 'Joe',
      lastname: 'Tester',
      email: 'joetester@example.com'
    )
    contact.phones.create(
      phone_type: 'home',
      phone: '785-555-1234'
    )
    mobile_phone = contact.phones.build(
      phone_type: 'mobile',
      phone: '785-555-1234'
    )

    expect(mobile_phone).not_to be_valid
  end

  it "allows two contacts to share a phone number" do
    contact1 = Contact.create(
      firstname: 'Joe',
      lastname: 'Tester',
      email: 'joetester@example.com'
    )
    contact2 = Contact.create(
      firstname: 'San',
      lastname: 'Chester',
      email: 'chester@example.com'
    )

    c1_phone = contact1.phones.create(
        phone_type: 'mobile',
        phone: '785-555-1234'
    )
    c2_phone = contact2.phones.build(
        phone_type: 'mobile',
        phone: '785-555-1234'
    )
    expect(c2_phone).to be_valid
  end

end
