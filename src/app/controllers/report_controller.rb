class ReportController < ApplicationController
  require 'will_paginate/array'

  def index



  end

=begin
SELECT cu.first_name, cu.last_name, foo.pocet_pc FROM (
	SELECT com.customer_id as c_id, count(*) as pocet_pc FROM customers c
	JOIN computers com ON com.customer_id = c.id
	GROUP BY com.customer_id ) as foo
JOIN customers cu ON foo.c_id = cu.id;
=end
	 def customer_pc
     @vysledok = ActiveRecord::Base.connection.execute("
         SELECT c.first_name, c.last_name, foo.pocet_pc, foo.gpu_cores, foo.gpu_clock, foo.cpu_cores, foo.cpu_clock
FROM (
	SELECT com.customer_id as c_id, count(*) as pocet_pc, round(sum(com.gpu_cores),2) as gpu_cores,
		round(sum(com.gpu_clock)) as gpu_clock,
		round(sum(com.cpu_cores)) as cpu_cores,
		round(sum(com.cpu_clock)) as cpu_clock
	FROM customers c
	JOIN computers com ON com.customer_id = c.id
	GROUP BY com.customer_id) as foo
JOIN customers c ON c.id = foo.c_id
     ")
    @vysledok = @vysledok.to_a.paginate(:page => params[:page], :per_page => 12)
   end

	 def report_city

   end
#TODO opravit select
  def report_city2
    @parameter = params[:City].to_s
    @vysledok2 = ActiveRecord::Base.connection.execute("
SELECT b.bank_name, b.city, b.street, b.street_number, b.estabilished_date as date,
	coalesce(foo.pls, 0) as pools_count,
	coalesce(foo.ammount, 0) as pool_income
FROM banks b
FULL OUTER JOIN (
	SELECT bank_id as bnk, count(p.income) as pls, sum(p.income) as ammount FROM pools p
	GROUP BY p.bank_id ) as foo ON foo.bnk = b.id
WHERE b.city LIKE '"+@parameter+"%';
")
    @vysledok2 = @vysledok2.to_a.paginate(:page => params[:page], :per_page => 12)
  end
end
