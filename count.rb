counts = Has.new(0)

File.open('/var/log/nginx/access.log') do |file|
 file.each do |line|
   url = line.split[6]
   counts[url] += 1
 end
end

top = counts.map{|url, count| [count, url] }.sort.reverse[0...5]
top5.each{|count, url| puts "#{count} #{url}" }
