require 'spec_helper'

describe 'email show' do
  let(:url_args) { {preview_id: 'auth_mailer_preview-email_confirmation'} }
  it 'shows email' do
    visit rails_email_preview.rep_email_path(url_args)
    expect(page).to have_content('Dummy Email Confirmation')
    expect(page).to have_content I18n.t('rails_email_preview.emails.show.breadcrumb_list')
  end

  it 'shows email in de' do
    begin
      RailsEmailPreview.locale = :de
      visit rails_email_preview.rep_email_path(url_args)
      expect(page).to have_content('Dummy Email Confirmation')
      expect(page).to have_content I18n.t('rails_email_preview.emails.show.breadcrumb_list',
                                   locale: :de)
    ensure
      RailsEmailPreview.locale = nil
    end
  end

  it 'shows locale links' do
    visit rails_email_preview.rep_email_path(url_args)
    %w(en es).each do |locale|
      rails_email_preview.rep_email_path(url_args.merge(email_locale: locale))
    end
  end
end
