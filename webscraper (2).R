install.packages("rvest")
install.packages("xml2")
library("rvest")
#Pobieranie adresu URL
informacje<- read_html("http://www.indeed.com/salary/C-Developer.html")
informacje1<- read_html("http://www.goldenline.pl/praca/szukaj?query=c%2B%2B")
#Pobieranie informacji ze znacznikow CSS spod danego adresu URL
salary<-informacje%>%html_nodes(".salary")%>%html_text() #wynagrodzenie
job<-informacje%>%html_nodes(".job_title")%>%html_text() #stanowisko
location<-informacje1%>%html_nodes(".offers-listing .text span")%>%html_text() #lokalizacja
#Przypisanie danych do Data.Frame
salarydf<-data.frame(salary)
jobdf<-data.frame(job)
locationdf<-data.frame(location)
#zapisanie pliku w celu edycji
write.csv(location,file = "locations.csv",row.names = FALSE)
#wczytanie wyedytowanego pliku
locationdf<-table(read.csv(file = "D:/Dokumenty/location.csv"))
#obrobione informacje w DF
locationdf
salarydf
jobdf
#polacznie danych w DF
job<-data.frame(jobdf,salarydf,locationdf)
#Zapisanie pliku CSV z DF
write.csv(job,file = "webscrapper.csv",row.names = FALSE)
#Wczytanie informacji z pliku CSV
hon<-data.frame(read.csv(file = "D:/Dokumenty/webscrapper.csv"))
#Nazwy kolumn
colnames(hon)<-c("Praca","Wynagrodzenie","Lokalizacja","Ilosc")
#Gotowy DF 
hon<-hon[order(hon$Ilosc, decreasing=TRUE), ]
hon





