require 'rails_helper'

RSpec.describe RegistrationsController, type: :request do

  describe '#create' do

    context 'newsletter opt in' do

      it 'syncs the user to MailChimp' do
        VCR.use_cassette("sync_subscriber_job_new_member") {
          perform_enqueued_jobs {
            post user_registration_path, user: {
              email: test_email_address,
              newsletter_opt_in: true,
              password: 'password',
              password_confirmation: 'password'
            }

            user = User.where(email: test_email_address).first

            expect(user.synced).to eq true
          }
        }
      end

    end

    context 'newsletter opt out' do

      it 'does not sync the user to MailChimp' do
        VCR.use_cassette("sync_subscriber_job_new_member") {
          perform_enqueued_jobs {
            post user_registration_path, user: {
              email: test_email_address,
              newsletter_opt_in: false,
              password: 'password',
              password_confirmation: 'password'
            }

            user = User.where(email: test_email_address).first

            expect(user.synced).to eq false
          }
        }
      end

    end

  end

end