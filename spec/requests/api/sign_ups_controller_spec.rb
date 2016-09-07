require 'rails_helper'

RSpec.describe Api::SignUpsController, type: :request do
  
  describe '#create' do

    it 'saves the sign up to the db and syncs it to MailChimp' do
      VCR.use_cassette("sync_subscriber_job_new_member") {
        perform_enqueued_jobs {
          post api_sign_ups_path, sign_up: { email: test_email_address }

          sign_up = sign_up(test_email_address)

          expect(sign_up.synced).to eq true
          expect(response.status).to eq 201
        }
      }
    end

    context 'duplicate sign up' do

      it 'synces the existing sign up to MailChimp' do
        VCR.use_cassette("sync_subscriber_job_new_member") {
          perform_enqueued_jobs {
            create(:sign_up, email: test_email_address)

            post api_sign_ups_path, sign_up: { email: test_email_address }

            sign_up = sign_up(test_email_address)

            expect(sign_up.synced).to eq true
            expect(response.status).to eq 200
          }
        }
      end

    end

  end

end