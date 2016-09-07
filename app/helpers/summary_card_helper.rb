module SummaryCardHelper

  def summary_card_subtitle(article)
    if article.subtitle.present?
      html = content_tag :div, class: 'summary-card__subtitle' do
        article.subtitle
      end

      html << "<hr class='summary-card__title-divider'>".html_safe
    end
  end

  def homepage_summary_card_subtitle(article, url)
    if article.subtitle.present?
      html = "<hr class='summary-card__title-divider'>"

      subtitle = link_to url, class: 'summary-card__subtitle-link', target: '_blank' do
        content_tag :div, class: 'summary-card__subtitle' do
          article.subtitle
        end
      end

      (html << subtitle).html_safe
    end
  end

  def summary_card_metadata(article)
    "#{article.publication}<br><span class='summary-card__author'>#{article.author}</span><br>#{article.published_at.try(:strftime, '%B %Y')}".html_safe
  end

  def homepage_summary_card_metadata(article)
    "#{article.publication}<br>#{article.published_at.try(:strftime, '%B %Y')}".html_safe
  end

end