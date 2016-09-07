require 'rails_helper'

RSpec.describe Article, type: :model do

  describe 'process_image_attribution' do

    it 'removes extraneous html from image attribution generated by http://www.imagecodr.org/' do
      attribution = "<div about='https://farm2.static.flickr.com/1559/24877367164_c94b9200aa_m.jpg'><a href='https://www.flickr.com/photos/aperturismo/24877367164/' target='_blank'><img xmlns:dct='http://purl.org/dc/terms/' href='http://purl.org/dc/dcmitype/StillImage' rel='dct:type' src='https://farm2.static.flickr.com/1559/24877367164_c94b9200aa_m.jpg' alt='Alex test driving @teslamotors #modelx w by aperturismo, on Flickr' title='Alex test driving @teslamotors #modelx w by aperturismo, on Flickr' border='0'/></a><br/>&quot;<a href='https://www.flickr.com/photos/aperturismo/24877367164/' target='_blank'>Alex test driving @teslamotors #modelx w</a>&quot;&nbsp;(<a rel='license' href='https://creativecommons.org/licenses/by-sa/2.0/' target='_blank'>CC BY-SA 2.0</a>)&nbsp;by&nbsp;<a href='https://www.flickr.com/people/aperturismo/' target='_blank'>&nbsp;</a><a xmlns:cc='http://creativecommons.org/ns#' rel='cc:attributionURL' property='cc:attributionName' href='https://www.flickr.com/people/aperturismo/' target='_blank'>aperturismo</a><a href='http://www.imagecodr.org/' target='_blank'>&nbsp;</a></div>"
      processed_attribution = "&quot;<a href='https://www.flickr.com/photos/aperturismo/24877367164/' target='_blank'>Alex test driving @teslamotors #modelx w</a>&quot;&nbsp;(<a rel='license' href='https://creativecommons.org/licenses/by-sa/2.0/' target='_blank'>CC BY-SA 2.0</a>)&nbsp;by&nbsp;<a xmlns:cc='http://creativecommons.org/ns#' rel='cc:attributionURL' property='cc:attributionName' href='https://www.flickr.com/people/aperturismo/' target='_blank'>aperturismo</a>"

      article = create(:article, image_attribution: attribution)

      expect(article.image_attribution).to eq processed_attribution
    end

    it 'sets published to true if published_on_homepage' do
      article = create(:article, published: false, published_on_homepage: true)

      expect(article.published).to eq true
    end

    it 'allows an article to be published but not on the homepage' do
      article = create(:article, published: true, published_on_homepage: false)

      expect(article.published).to eq true
      expect(article.published_on_homepage).to eq false
    end

  end

end