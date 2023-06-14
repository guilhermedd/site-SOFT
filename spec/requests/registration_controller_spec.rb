require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  describe 'before_action' do
    context 'when accessing the sign-up page' do
      it 'configures permitted parameters' do
        allow(controller).to receive(:devise_mapping).and_return(Devise.mappings[:user])

        expect(controller).to receive(:configure_permitted_parameters)
        get :new
      end
    end
  end

  describe 'protected methods' do
    describe '#configure_permitted_parameters' do
      it 'permits specific attributes for sign up' do
        expect(controller).to receive_message_chain(:devise_parameter_sanitizer, :permit)
                                .with(:sign_up, keys: [:first_name, :last_name, :username])

        controller.send(:configure_permitted_parameters)
      end
    end
  end
end
