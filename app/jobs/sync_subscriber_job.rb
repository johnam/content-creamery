class SyncSubscriberJob < ActiveJob::Base
  queue_as :default

  def perform(subscriber)
    gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    list_id = ENV['MAILCHIMP_LIST_ID']
    email_hash = Digest::MD5.hexdigest(subscriber.email).downcase

    params = { email_address: subscriber.email,
               status: MailChimp::Status.pending }

    gibbon.lists(list_id).members(email_hash).upsert(body: params)
 
    subscriber.update_column(:synced, true)
  end
end
