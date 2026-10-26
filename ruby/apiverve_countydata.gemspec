# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "apiverve_countydata"
  spec.version       = "1.2.3"
  spec.authors       = ["APIVerve"]
  spec.email         = ["hello@apiverve.com"]

  spec.summary       = "County Data Lookup API - Ruby Client"
  spec.description   = "County Data Lookup is a county lookup API that retrieves income, poverty rate, and life expectancy for any US county by state and county name. Paid plans add age demographics, educational attainment, health indicators, ZIP codes, and cost of living."
  spec.homepage      = "https://apiverve.com/marketplace/countydata?utm_source=ruby&utm_medium=referral&utm_content=homepage"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/apiverve/countydata-API/tree/main/ruby"
  spec.metadata["changelog_uri"] = "https://apiverve.com/changelog"
  spec.metadata["documentation_uri"] = "https://docs.apiverve.com/ref/countydata"

  spec.files = Dir.glob("{lib}/**/*") + %w[README.md LICENSE]
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 1.0", "< 3.0"
  spec.add_dependency "faraday-multipart", "~> 1.0"
  spec.add_dependency "json", "~> 2.0"
end
