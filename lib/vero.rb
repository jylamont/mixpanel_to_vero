require 'csv'

class Vero
  def save_events_csv(array)
    csv_headers = ["Email", "Event name", "Time"]

    CSV.open file_name("events"), "w" do |csv|
      csv << csv_headers
      array.each do |hash|
        csv << [email_for_record(hash), event_for_record(hash), time_for_record(hash)]
      end

      puts "CSV written to #{::File.expand_path('../../' + csv.path, __FILE__)}."
    end
  end

  private

  def file_name(type)
    "vero_#{type}_csv.csv"
  end

  def event_for_record(record)
    record["event"]
  end

  def email_for_record(record)
    record["properties"]["distinct_id"]
  end

  def time_for_record(record)
    time = Time.at(record["properties"]["time"])
    time.strftime("%F %T %z")
  end
end