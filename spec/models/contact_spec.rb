require 'rails_helper'

describe Contact do
  it "has a valid factory" do
    expect(build(:contact)).to be_valid
  end

  it "is valid with a firstname, lastname and email" do
    contact = build(:contact)
    expect(contact).to be_valid
  end

  it "is invalid without a firstname" do
    contact = build(:contact, firstname: nil)
    contact.valid?
    expect(contact.errors[:firstname]).to include("can't be blank")
  end

  it "is invalid without a lastname" do
    contact = build(:contact, lastname: nil)
    expect(contact).not_to be_valid
  end

  it "is invalid without an email address" do
    contact = build(:contact, email: nil)
    expect(contact).not_to be_valid
  end

  it "is invalid with a duplicate email address" do
    create(:contact, email: 'aaron@example.com')
    contact = build(:contact, email: 'aaron@example.com')
    contact.valid?
    expect(contact.errors[:email]).to include("has already been taken")
  end

  # Testing instance methods
  it "returns a contact's full name as a string" do
    contact = build(:contact,
    firstname: "Jane",
    lastname: "Smith"
    )
    expect(contact.name).to eq('Jane Smith')
  end

  # Testing class methods and scopes
  describe "filter last name by letter" do
    before :each do
      @smith = create(:contact,
      firstname: "Jane",
      lastname: "Smith"
      )

      @jones = create(:contact,
      firstname: "Tim",
      lastname: "Jones"
      )

      @johnson = create(:contact,
      firstname: "John",
      lastname: "Johnson"
      )
    end

    context "matching letters" do
      it "returns a sorted array of results that match" do
        expect(Contact.by_letter("J")).to eq ['Johnson','Jones']
      end
    end

    context "non-matching letters" do
      it "omits results that do not match" do
        expect(Contact.by_letter("J")).not_to include "Smith"
      end
    end
  end
end
