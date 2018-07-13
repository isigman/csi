AdminUser.destroy_all
User.destroy_all
Corp.destroy_all
Record.destroy_all

if Rails.env.development?
  AdminUser.create!(
      email: 'admin@example.com',
      password: 'password',
      password_confirmation: 'password')
  Corp.create!(
      name: 'test_corp'
  )
  Corp.create!(
      name: 'another_test_corp'
  )
  User.create!(
      email: 'irasigman@gmail.com',
      password: 'password',
      corp: 'test_corp',
      client_id: 10,
      password_confirmation: 'password')

  Record.create!(
      corp_id: 1, state: 'AK', jurisdiction: 'Juno', report_name: 'E911', form_name: 'E911-Surchage', filing_format: 1, billing_month: 1, billing_year: 2017)
  Record.create!(
      corp_id: 1, state: 'AK', jurisdiction: 'Juno', report_name: 'E911', form_name: 'E911-Surchage', filing_format: 2, billing_month: 12, billing_year: 2015)
  Record.create!(
      corp_id: 1, state: 'AR', jurisdiction: 'Little Rock', report_name: 'E911-2', form_name: 'E911-Surchage', filing_format: 1, billing_month: 2, billing_year: 2013)
  Record.create!(
      corp_id: 1, state: 'AR', jurisdiction: 'Little Rock', report_name: 'E911-2', form_name: 'E911-Surchage',  filing_format: 2,billing_month: 3, billing_year: 2011)
  Record.create!(
      corp_id: 1, state: 'AR', jurisdiction: 'Wounded Knee', report_name: 'E911-3', form_name: 'E911-Surchage',  filing_format: 2,billing_month: 1, billing_year:  2002)


end