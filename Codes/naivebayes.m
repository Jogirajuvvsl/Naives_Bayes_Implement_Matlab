%function to implement naives bayes algorithm
%setosa recors are made as 1 and non setosa as 0 at attribute 5 in inris
%data set
function accuracy=naivebayes(iris)
yesp=1,nop=0,naivepredict=0,successcount=0,failurecount=0;
%probyn function will provide the prorbailites of yes(setosa) or no(nonsetosa)
%prb function will calculate the condition probabilites attributes values wise of yes or no 
probabilityy=probyn(yesp,iris);
probabilityn=probyn(nop,iris);
for i=[1:150]
    yespp=probabilityy*prob(yesp,iris(i,1),1,iris)*prob(yesp,iris(i,2),2,iris)*prob(yesp,iris(i,3),3,iris)*prob(yesp,iris(i,4),4,iris);
    a=probabilityn;
    b=prob(nop,iris(i,1),1,iris);
    c=prob(nop,iris(i,2),2,iris);
    d=prob(nop,iris(i,3),3,iris);
    e=prob(nop,iris(i,4),4,iris);
    nopp=probabilityn*prob(nop,iris(i,1),1,iris)*prob(nop,iris(i,2),2,iris)*prob(nop,iris(i,3),3,iris)*prob(nop,iris(i,4),4,iris);
%comparing the probabilites of yes or no for naives bayes decision
    if(yespp>nopp)
     naivepredict=1;
 else
     naivepredict=0;
 end;
 %calculating accuracy
 if (naivepredict==iris(i,5))
     successcount=successcount+1;
 else
     failurecount=failurecount+1;
 end;
 
end;
 accuracy=successcount/(successcount+failurecount)*100;

%function to determine the probabiliy of yes or no
function probabilityyn=probyn(a,iris)
count=0;
for i=[1:size(iris,1)]
        if(iris(i,5)==a)
        count=count+1;
        end;
end;
probabilityyn=count/size(iris,1);

%function to find the conditional probability given it is yes or no 
function probval=prob(yesrno,flowerattributevalue,flowerattributetype,iris)
n=0,nc=0;distinctattr=[],k=1;
for i=[1:150]
    if(iris(i,5)==yesrno)
        n=n+1;
        if(iris(i,flowerattributetype)==flowerattributevalue)
            nc=nc+1;
        end;
    end;
end;
%Below is to implement m estimate when nc=0
if nc==0
    for i=[1:size(iris,1)]
      if (isempty(find(distinctattr==iris(i,flowerattributetype))))
        distinctattr(k)=iris(i,flowerattributetype);
         k=k+1;
      end;
    end;
%m is considered to be 1 and attribute is thought be uniformally
%distributed so probability will be 1 divided by distinct values of
%attribute atht will be value of P
%here implementing the m estimate (nc+mp)/(n+m) when nc=0
%here we considered m=1 it can be
m=1
p=1/size(distinctattr,1);
probval=(p/(n+m))*m;
else
    probval=nc/n;
end;