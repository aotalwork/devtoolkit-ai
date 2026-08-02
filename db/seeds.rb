# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
tools = [
  {
    name: "Error Debugger",
    slug: "error-debugger",
    description: "Analyze Ruby and Rails errors with AI",
    icon: "🐛",
    active: true
  },
  {
    name: "Commit Coach",
    slug: "commit-coach",
    description: "Generate professional commits and PR descriptions",
    icon: "📝",
    active: true
  },
  {
    name: "Test Generator",
    slug: "test-generator",
    description: "Generate RSpec tests with AI",
    icon: "🧪",
    active: true
  },
  {
    name: "PR Reviewer",
    slug: "pr-reviewer",
    description: "Review pull requests with AI",
    icon: "👀",
    active: true
  }
]

tools.each do |tool|
  Tool.find_or_create_by!(slug: tool[:slug]) do |t|
    t.assign_attributes(tool)
  end
end
