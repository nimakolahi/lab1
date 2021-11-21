fileID = fopen('C:\Users\asus\Desktop\Term3\Integrated systems architecture\LABS\LAB1\resultsc.txt', 'r');
fileID1 = fopen('C:\Users\asus\Desktop\Term3\Integrated systems architecture\LABS\LAB1\resultsm.txt', 'r');
b = fscanf(fileID1, '%d');
a = fscanf(fileID, '%d');
thd_of_c = thd(a);
thd_of_matlab = thd(b);
figure(1);
hold on
plot(a,'r');
plot(b,'b');
