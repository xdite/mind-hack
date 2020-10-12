
first_year_salary = 35000
for i in 0..12
  current_sarray = (first_year_salary*(1.2**(i))).round(2)
  current_year_sarray = (current_sarray * 12/10000).round(2)
  last_year_sarray = (current_year_sarray / 1.2).round(2)
  diff = (current_year_sarray-last_year_sarray).round(2)
  puts "第#{i}年月薪#{current_sarray}，年薪 #{current_year_sarray}万，来年加薪20%，薪水比去年增加 #{diff}万"
end
