# temporary payment reports code snippet, will evolve into raketask or controller

def calculate(date_from, date_to)
  vat_rate = 0.23
  reverse_vat_rate = 1.0 / (1.0+vat_rate)

  payments = Payment.where(:state => "completed").where("created_at > ? AND created_at <= ?", date_from, date_to)

  brutto_total = payments.map(&:amount).inject(:+)

  netto_total = brutto_total*reverse_vat_rate
  puts "netto #{netto_total.to_f}\t\t brutto #{brutto_total.to_f}"
end

date_from = Time.parse("2011-09-01")
date_to = Time.parse("2011-09-01")

partial_netto = 0
0.upto(6) do |i|
  date_from  = date_to
  date_to   += 5.days
  puts "calculating from #{date_from} to #{date_to}"
  calculate(date_from, date_to)
end

date_from = Time.parse("2011-09-01")
date_to = Time.parse("2011-10-01")
puts "calculating from #{date_from} to #{date_to}"
  calculate(date_from, date_to)