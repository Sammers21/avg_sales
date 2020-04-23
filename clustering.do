use vgsales.dta, clear
describe
egen z_eu_sales = std(eu_sales)
egen z_jp_sales = std(jp_sales)
egen z_na_sales = std(na_sales)
egen z_other_sales = std(other_sales)
egen z_global_sales = std(global_sales)
egen z_year_i = std(year_i)
egen z_rank= std(rank)
cluster singlelinkage z_eu_sales z_jp_sales z_na_sales z_other_sales z_global_sales z_year_i z_rank, measure(L2) name(myclust)
cluster stop myclust,  rule(calinski) 
exit