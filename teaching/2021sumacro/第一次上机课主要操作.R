#向量的创建
v<-5:10 #使用冒号运算符构建向量,产生等差级数量；x:y;当x<y时，将生成x+1,x+2...最后的的元素<=y
u<-5:8.4
w<-10:5 #当x>y时，将生成x-1,x-2......最后的元素>=y
t<-10:7.6
x<-5:5 #当x=y时，只生成一个元素


seq(1,4,by=0.5)#seq(from,to,by=):seq()函数用来产生等差向量，参数by设置公差的大小，最后元素<=to值
seq(2,7,by=1.1)
seq(2,7)


age<-c(4,7,6,5,6,7)#c(.....)会把所有的参数值首尾相连而形成一个向量，
new_age<-c(12,age,17)
new_age

#向量元素的访问
v[3]#访问向量v的第3个元素
v[c(3,4)]#访问向量v的第3，4个元素

#向量的简单操作
t(v)#对向量进行转置
sort(age)#对向量进行排序


#向量的运算
x<-c(1,3)
y<-c(4,3,2,1)#当向量长度不同时，短的向量会自动循环补齐至与长向量相同，然后再运算。
x+4#单个数值4补齐为（4，4）
x-y#等价于c(1,3,1,3)-c(4,3,2,1)
x/y

#内积%*&
x<-c(1,3,5)
y<-c(2,4,6)
x*y
x%*%y#1*2+3*4+5*6

#列表
#列表的创建
list_data<-list(c(1,4,7),c('apple','orange'),3)
names(list_data)<-c('a','b','c')
list_data
 #列表元素的访问
list_data[1]
list_data[c(2,3)]
list_data['a']
typeof(list_data['a'])#返回的是列表
list_data[['a']]#返回的是具体内容
list_data[[1]]
list_data$b
typeof(list_data$b)

#矩阵
#矩阵的创建：

#直接创建:matrix(data,nrow,ncol,byrow,dimnames)
#data:矩阵的数据元素，一般是个向量
#nrow和ncol:矩阵的行、列数目
#byrow:矩阵是按行(byrow=TRUE)还是按列(byrow=FALSE)填充，默认行
#dimnames:行、列名，一个列表，默认情况下没有
rownames<-c('R1','R2','R3','R4')
colnames<-c('C1','C2','C3')
P<-matrix(3:14,nrow=4,byrow=TRUE,dimnames=list(rownames,colnames))
#通过向量创建：cbind()矩阵的列；rbind()矩阵的行
x<-1:3
y<-10:12
cbind(x,y)
rbind(x,y)

#矩阵元素的访问
P[4,3]
P[ ,3]
P[4, ]

t(P)#转置
rownames(P)<-c('r1','r2','r3','r4')#重命名矩阵的行
dim(P)#获得矩阵的维数
nrow(P)#获得矩阵的行数
ncol(P)

#矩阵的运算
x<-matrix(1:4,ncol=2)
x+c(2,3)#实际上是x+matrix(c(2,3,2,3),ncol=2
det(x)#方阵行列式的值
solve(x)#方阵的逆
y<-eigen(x)
y$val#矩阵的特征值
y$vec#矩阵的特征向量


#数组
#数组的创建array(data,dim,dimnames)
#data:数组的元素；dim：维度；dimnames:维度名称
A<-array(1:24,2:4)
list1<-c('male','female')
list2<-c('yong','middle','old')
list3<-c('A','B','C','D')
dimnames(A)<-list(list1,list2,list3)

#数组元素访问
A[2,2,2]
A[2, , ]

#因子
myfactor<-factor(c("East","West","East","North","North","East","West","West","West","East","North"))
myfactor

#数据框
#数据框的创建data.frame(c(),c()...)
mydata.frame<-data.frame(c("liu","wang","zhang"),c("U432","U456","U674"),c(95,98,92))
names(mydata.frame)<-c("name","number","grade")
mydata.frame
mydata.frame$gender<-c("male","female","male")#添加列
rbind(mydata.frame,mydata.frame)#添加行，合并两个数据框
mydata.frame[1, ]#访问表格的行、列
mydata.frame[1:3,2]
mydata.frame$name

#数据的导入，read.table()和read.csv(),都是纯文本数据
#两个函数的重要参数
#file：外部文件的路径和文件名
#header：是否将原数据的第一行作为字段名，read.table()函数默认为FALSE；read.csv(默认为TRUE)
#sep:字段之间的分割符，read,table()默认空格，read.csv()默认逗号
read.table("D:/高宏实验课/data/input.txt",header=T)
read.csv("D:/高宏实验课/data/input.csv",header=T)
read_excel("D:/高宏实验课/data/input.xlsx")
data<-read.csv("D:/高宏实验课/data/input.csv",header=T)
summary(data)#所有数据的描述性统计量
summary(data$salary)#变量salary的描述性统计量
sum(data$id,na.rm=T)#变量id的总合，去除缺失值的影响
sum(data$id)
#replace函数
attach(data)#使变量可以在R中按名称访问
data$salary=replace(data$salary,data$salary<700,0)
data$salary =replace(salary,data$salary<700,0)#( 要被替换的元素  ,整数向量.指定被替换的元素的位置，替换的值)
data
#subset函数
subsetresult<-subset(data,salary==0,select=c('id','name')) #subset(数据框名，选择条件，显示的列)
subsetresult<-subset(data,salary==0,select=c(-id,-name))
subsetresult<-subset(data,salary==0)
subsetresult
#order函数
attach(data)
data[order(salary), ]#排序，逗号后留空格，表示排序应用于所有列
data[rev(order(salary)), ]#降序
data[order(data$salary), ]

#aggregate函数，按指定变量进行分组，对分组数据进行单次统计
aggregate(data,by=list(name),mean,na.rm=TRUE)

#数据的导出
write.csv(data,"D:/高宏实验课/newdata.csv")


