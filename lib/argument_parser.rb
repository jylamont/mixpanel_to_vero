class ArgumentParser
  def self.parse(args)
    hash = args.flatten.map do |s|
      [$1, $2] if s =~ /(.+)=(.+)/
    end.reject(&:nil?).each_with_object({}) do |i, hash|
      hash[i.first] = i.last
    end
    puts "Arguments parsed: #{hash}"
    hash
  end
end