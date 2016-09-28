%histogram for all values in a same diagram with different colors
a=[accuracyarray(1,1) accuracyarray(2,1) accuracyarray(3,1) accuracyarray(4,1)]
x =[5 10 15 20];
b=bar(x,a)
xlabel('For each value of n')
ylabel('Accuracies')
title('Histogram for NaiveBayer algorithm against N=5 to 20')