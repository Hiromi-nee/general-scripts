#lazy script
payload = "wget http://someurl/"
tailpayload = ".extension"
(1..99).each do |n|
  final = payload + n.to_s + tailpayload
  p ">>>>[*]#{final}"
  system(final)
  sleep(0.2)
end
