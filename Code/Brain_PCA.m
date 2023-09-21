clear
close all
clc
data_ = readtable("Brain_GSE50161.csv");
type = data_(:,2);
data_(:,2) = [];
data  = table2array(data_);
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
    if(strcmp(type(i,1),'pilocytic_astrocytoma'))
        plot3(x,y,z, 'k.', 'LineWidth',3);
    end 
    if(strcmp(type(i,1),'normal'))
        plot3(x,y,z, 'g.', 'LineWidth',3);
    end 
    if(strcmp(type(i,1),'medulloblastoma'))
        plot3(x,y,z, 'm.', 'LineWidth',3);
    end
    if(strcmp(type(i,1),'glioblastoma'))
        plot3(x,y,z, 'b.', 'LineWidth',3);
    end
    if(strcmp(type(i,1),'ependymoma'))
        plot3(x,y,z, 'r.', 'LineWidth',3);
    end
    

end
xlabel('PC1'), ylabel('PC2'), zlabel('PC3') 
view(85,25), grid on, set (gca, 'FontSize',15) 
set(gcf, 'Position', [1400 100 1200 900])