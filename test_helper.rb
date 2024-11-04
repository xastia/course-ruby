require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use! [
                         Minitest::Reporters::SpecReporter.new,
                         Minitest::Reporters::HtmlReporter.new(
                                  reports_dir: 'reports/spec_reports',
                                  color: true,
                                  node: :clean
                                )
                         ]