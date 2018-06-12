module UserHelper


  def allowed_email_domains
    allowed_email_domains = ENV['ALLOWED_EMAIL_DOMAINS'].split(',')
    allowed_email_domains = allowed_email_domains - ["yoomee.com"]
    allowed_email_domains.to_sentence.gsub! ' and ', ' or '
  end

end
