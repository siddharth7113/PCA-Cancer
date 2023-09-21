clear
close all
clc
data1 = readtable("Leukemia_GSE63270.csv");
data2 = readtable("Leukemia_GSE71935.csv");
type1 = data1(:,2);
data1(:,[1,2]) = [];
type2 = data2(:,2);
data2(:,[1,2]) = [];
data = [data1;data2];
type = [type1;type2];
data  = table2array(data);
type  = table2array(type);
[U,S,V]= svd (data, 'econ');

figure
subplot(1,2,1)
semilogy (diag(S), 'k.', 'LineWidth', 2.5)
set(gca, 'FontSize', 15), axis tight, grid on 
subplot(1,2,2)
plot(cumsum(diag(S))./sum (diag(S)), 'k.', 'LineWidth',2.5) 
set(gca, 'FontSize', 15), axis tight, grid on
set(gcf, 'Position', [1400 100 3*600 3*250])

figure, hold on
for i=1:size(data,1)
    x = V(:,1)' *data(i,:)'; 
    y = V(:,2)' *data (i,:)';
    z = V(:,3)'*data (i,:)';
    if(strcmp(type(i,1),'AML'))
        plot3(x,y,z, 'r.', 'LineWidth',3);
    end 
    if(strcmp(type(i,1),'JMML'))
        plot3(x,y,z, 'b.', 'LineWidth',3);
    end
    

end
xlabel('PC1'), ylabel('PC2'), zlabel('PC3') 
view(85,25), grid on, set (gca, 'FontSize',15) 
set(gcf, 'Position', [1400 100 1200 900])