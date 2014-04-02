require 'spec_helper'

describe User do
  describe 'validations' do
    let(:blank) {['', nil]}
    let(:valid_attributes) {{
      username: 'Batman',
      email: 'batman@gmail.com',
      password: '12345678'
      }}
    let(:user) {User.new(valid_attributes)}

    it {should have_valid(:username).when('Batman')}
    it {should_not have_valid(:username).when(*blank)}

    it {should have_valid(:email).when('batman@gmail.com')}
    it {should_not have_valid(:email).when(*blank)}

    it {should have_valid(:password).when('12345678')}
    it {should_not have_valid(:password).when(*blank)}
    it {should_not have_valid(:password).when('1234')}

    it 'is valid when given valid attributes' do
      expect(user).to be_valid
    end
  end
end
