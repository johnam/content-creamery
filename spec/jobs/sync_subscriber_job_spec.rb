require 'rails_helper'

def init_gibbon
  Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
end

RSpec.describe SyncSubscriberJob, type: :job do

  context 'new member' do

    it 'syncs the subscriber to mailchimp' do
      sign_up = create(:sign_up, email: test_email_address)

      expect(MailChimp::Status).to receive(:pending).and_return(MailChimp::Status.pending)

      VCR.use_cassette("sync_subscriber_job_new_member") {
        SyncSubscriberJob.perform_now(sign_up)
      }

      expect(sign_up.synced).to eq true
    end

  end

end
