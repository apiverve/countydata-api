Pod::Spec.new do |s|
  s.name             = 'APIVerveCountyDataLookup'
  s.version          = '1.2.3'
  s.summary          = 'County Data Lookup is a county lookup API that retrieves income, poverty rate, and life expectancy for any US county by state and county...'
  s.description      = <<-'DESC'
County Data Lookup is a county lookup API that retrieves income, poverty rate, and life expectancy for any US county by state and county name. Paid plans add age demographics, educational attainment, health indicators, ZIP codes, and cost of living.

This iOS/macOS SDK provides a convenient way to access the County Data Lookup from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/countydata?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/countydata-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveCountyDataLookup/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
