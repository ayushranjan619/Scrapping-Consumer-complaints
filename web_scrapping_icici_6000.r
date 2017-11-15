library(rvest)
library(XML)
library(plyr)



data_subject=c()
data_complaint=c()


for(i in 2:3){
  
  
link <- paste0("https://www.consumercomplaints.in/icici-bank-b100197/page/",i)
consumer <- read_html(link)



##------------Used SelectorGadget as the CSS Selector-----------## 

nodes_subject=html_nodes(consumer,".complaint a")
nodes_complaint=html_nodes(consumer,".compl-text div")



## -----------pulling the actual text-------------###

data_sub=html_text(nodes_subject)
data_comp=html_text(nodes_complaint)

data_subject=c(data_subject,data_sub)
data_complaint=c(data_complaint,data_comp)

d=data.frame("subject"=data_subject,"complaint"=data_complaint)

}
###----------------making a dataframe------------------##

d$subject<- gsub("\r?\n|\r", " ",d$subject) 

d$complaint<- gsub("\r?\n|\r", " ",d$complaint) 

###-----------writing into a csv file-------------------------##

write.csv(d,"consumer_complaint_6000.csv",row.names = F)
