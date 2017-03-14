#q1
#the most important argument is probably "decimal_mark" which determines thousand-separator

#q2
parse_number("1000.00,000", locale = locale(decimal_mark = ",", grouping_mark = ","))
        #results = 1000. this result basically ignore the two locale arguments and disregards the 0s after "."

parse_number("1000.00,000", locale = locale(decimal_mark = ".", grouping_mark = "."))
        #results = 1e+05. this result ignores the grouping argument but honors the decimal argument

parse_number("1000.00,000", locale = locale(decimal_mark = ",", grouping_mark = "."))
        #result = 1e+05. as expected. honors both.

parse_number("1000.00,000", locale = locale(decimal_mark = ".", grouping_mark = ","))
        #result = 1000. honors decimal argument, ignores grouping. so i think decimal has higher priority

parse_number("10.00.00,000", locale = locale(decimal_mark = ","))
        #result = 1e+05. the grouping becomes ".", or maybe null?

parse_number("1000.00,000", locale = locale(grouping_mark = "."))
        #result = 1000. thee decimal argument becomes default (".") and takes priority

#q3
parse_datetime("19/10/2016", format = "%d/%m/%Y") #result ="2016-10-19 UTC"
parse_datetime("19/10/2016") #result = error
parse_datetime("19/10/2016", format = "%d/%m/%Y", locale = locale(date_format = "%d-%m-%Y")) #result ="2016-10-19 UTC"
parse_guess("10/19/2016 20:10", locale = locale(date_format = "%d-%m-%Y", time_format = "%H:%M")) #result = "10/19/2016 20:10"
        #seems like with these locale argument and parse_guess, they just regurgitate the input

#q4
indolocale <- locale(date_format = "%d%.%m%.%Y", decimal_mark = ",", grouping_mark = ".")
parse_datetime("19 October 2016 20:10", format = "%d %B %Y %H:%M", locale = indolocale) #doesn't work
parse_number("Rp 1.000.000,00", locale = indolocale) #works as expected

#q5
#read_csv imports comma-separated-values (,)
#read_csv2 imports semicolon-separated values (;)

#q6
#in europe = ISO 8859
#in asia = JIS X (japanese), Guobiao (chinese), KS X (korean)

#q7
d1 <- "January 1, 2010"
d2 <- "2015-Mar-07"
d3 <- "06-Jun-2017"
d4 <- c("August 19 (2015)", "July 1 (2015)")
d5 <- "12/30/14" # Dec 30, 2014
t1 <- "1705"
t2 <- "11:15:10.12 PM"

parse_date(d1, format = "%B %d, %Y")
parse_date(d2, format = "%Y-%b-%d")
parse_date(d3, format = "%d-%b-%Y")
parse_date(d4, format = "%B %d (%Y)")
parse_date(d5, format = "%m/%d/%y")
parse_time(t1, format = "%H%M")
parse_time(t2, format = "%I:%M:%S.%OS %p") #this one doesn't work. error: unsupported format %I