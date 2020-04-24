use vgsales.dta, clear
describe
reg na_sales eu_sales jp_sales other_sales
reg eu_sales na_sales jp_sales other_sales
reg jp_sales na_sales eu_sales other_sales
exit