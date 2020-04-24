set matsize 11000
use vgsales.dta, clear
describe
reg na_sales eu_sales jp_sales other_sales i.pub_i i.genre_i i.plat_i
reg eu_sales na_sales jp_sales other_sales i.pub_i i.genre_i i.plat_i
reg jp_sales na_sales eu_sales other_sales i.pub_i i.genre_i i.plat_i
exit