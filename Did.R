library(tidyverse)
library(haven)
setwd("C:/Users/Muhammad/Projects/andrea")
mydata <- read_dta("for graph.dta")

names(mydata)[16]<-"Exam Marks"



mydata1<-mutate(mydata, year= ifelse(school_year=="2010/2011",2010,
                                ifelse(school_year=="2011/2012",2011,
                                  ifelse(school_year=="2012/2013",2012,
                                    ifelse(school_year=="2013/2014",2013,
                                      ifelse(school_year=="2014/2015",2014,2015))))))


mydata1%>%
  group_by(year,sub_population,public_or_independent)%>%
  summarise(avg_score=mean(`Exam Marks`))%>%
ggplot(aes(y=avg_score,x=year,color=sub_population, linetype=public_or_independent))+
  geom_line()+ggtitle("All courses average score over the years")



mydata1%>%
  filter(social11==1)%>%
  group_by(year,sub_population,public_or_independent)%>%
  summarise(`averag score`=mean(`Exam Marks`))%>%
  ggplot(aes(y=`averag score`,x=year,color=sub_population, linetype=public_or_independent))+
  geom_line()+ ggtitle("Social-11 Average Marks over the years")


mydata1%>%
  filter(English10==1)%>%
  group_by(year,sub_population,public_or_independent)%>%
  summarise(`averag score`=mean(`Exam Marks`))%>%
  ggplot(aes(y=`averag score`,x=year,color=sub_population, linetype=public_or_independent))+
  geom_line()+ ggtitle("English-10 Average Marks over the years")

mydata1%>%
  filter(English12==1)%>%
  group_by(year,sub_population,public_or_independent)%>%
  summarise(`averag score`=mean(`Exam Marks`))%>%
  ggplot(aes(y=`averag score`,x=year,color=sub_population, linetype=public_or_independent))+
  geom_line()+ ggtitle("English-12 Average Marks over the years")

mydata1%>%
  filter(math10==1)%>%
  group_by(year,sub_population,public_or_independent)%>%
  summarise(`averag score`=mean(`Exam Marks`))%>%
  ggplot(aes(y=`averag score`,x=year,color=sub_population, linetype=public_or_independent))+
  geom_line()+ ggtitle("Math-10 Average Marks over the years")



mydata1%>%
  filter(science10==1)%>%
  group_by(year,sub_population,public_or_independent)%>%
  summarise(`averag score`=mean(`Exam Marks`))%>%
  ggplot(aes(y=`averag score`,x=year,color=sub_population, linetype=public_or_independent))+
  geom_line()+ ggtitle("Science-10 Average Marks over the years")


