require 'csv'

namespace :user do
  class Converter
    def initialize(model)
      @model = model
    end

    def csv
      attributes = @model.column_names
      CSV.generate(headers: true) do |csv|
        csv << attributes
        @model.all.find_each do |user|
          csv << attributes.map { |attr| user.send(attr) }
        end
      end
    end
  end

  desc 'import users to database'
  task :import, [:path] => :environment do |_, args|
    CSV.foreach(args[:path], headers: true) do |row|
      User.create!(row.to_h)
    end
  end

  desc 'export users to csv'
  task export: :environment do
    file_name = 'exported_user.csv'
    csv_data = Converter.new(User).csv
    File.write(file_name, csv_data)
  end
end
