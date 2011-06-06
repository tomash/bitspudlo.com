# temporary payment reports code snippet, will evolve into raketask or controller

vat_rate = 0.23
reverse_vat_rate = 1.0 / (1.0+vat_rate)

from_date = Time.parse("2011-05-01")
to_date = Time.parse("2011-05-31")

payments = Payment.where(:state => "completed").where("created_at >= ? AND created_at <= ?", date_from, date_to)

brutto_total = payments.map(&:amount).inject(:+)

netto_total = brutto_total*reverse_vat_rate
