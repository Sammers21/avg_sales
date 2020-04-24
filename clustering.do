/* ssc install clustergram */
use vgsales.dta, clear
describe
egen z_eu_sales = std(eu_sales)
egen z_jp_sales = std(jp_sales)
egen z_na_sales = std(na_sales)
egen z_other_sales = std(other_sales)
egen z_global_sales = std(global_sales)
egen z_year_i = std(year_i)
egen z_rank = std(rank)
cluster singlelinkage z_eu_sales z_jp_sales z_na_sales  z_year_i z_rank, measure(L2) name(myclust)
cluster stop myclust, rule(calinski) 
cluster kmeans z_eu_sales z_jp_sales z_na_sales  z_year_i z_rank, k(2) measure(L2) name(kclust)
cluster kmeans z_eu_sales z_jp_sales z_na_sales  z_year_i z_rank, k(4) measure(L2) name(kclust4)
twoway (scatter rank year_i if kclust==1, mcolor("green") ) (scatter rank year_i if kclust==2, mcolor("red")),legend(off)
twoway (scatter rank year_i if kclust4==1, mcolor("green")) (scatter rank year_i if kclust4==2, mcolor("red")) (scatter rank year_i if kclust4==3, mcolor("blue")) (scatter rank year_i if kclust4==4, mcolor("yellow")),legend(off)
exit