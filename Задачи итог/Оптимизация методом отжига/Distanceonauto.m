close all;
clear all;
clc;
    x = [26.42 28.11 28.46 25.39 21.35 26.56 24.57 22.16];   
    y = [60.52 61.03 61.11 60.59 61.30 60.28 60.10 60.27]; 
load('Goroda.mat');
t_max = 53423;
t_min = 0.001;
cities = 8;
s = 1:cities;
t = t_max;
alfa = 0.999;
i = 1;

while (t>t_min)
    s_c = NewState(s); 
    delta_E = Energy(s_c,Goroda) - Energy(s,Goroda);
    if delta_E<=0
        s = s_c;
    else
        P = exp(-delta_E/t);
        if rand <= P
            s=s_c;
        end
    end
    t = DecreaseTemprature(t,alfa);
    e_plot(i) = Energy(s,Goroda);
    i = i + 1;
end
figure;
plot(e_plot,'r');
    title('����������� ������� �� ������ ��������');
    grid('on');
    xlabel('����� ��������');
    ylabel('�������');

figure;
hold on
for i=1:length(x)
    k = mod(i - 1,length(x)) + 1;
    j=mod(i,length(x))+1;
    plot([x(s(k)),x(s(j))],[y(s(k)),y(s(j))],'m'); %������ ����������������� ��������
        title('������� "����������"');
        grid('on');
        xlabel('�������'); 
        ylabel('������'); 
        text(26.42,60.52,'�������');
        text(28.11,61.03,'�����������');
        text(28.46,61.11,'������');
        text(25.39,60.59,'�����');
        text(21.35,61.30,'�������');
        text(26.56,60.28,'�����');
        text(24.57,60.10,'���������');
        text(22.16,60.27,'�����');
end
hold off

%������ ������������������� ��������

% figure;
% hold on
% for i=1:length(x)
%     k = mod(i - 1,length(x)) + 1;
%     j=mod(i,length(x))+1;
%     plot([x(k),x(j)],[y(k),y(j)],'r');%������ ������������������� ��������
%         title('������� "����������"');
%         grid('on');
%         xlabel('�������'); 
%         ylabel('������'); 
%         text(26.42,60.52,'�������');
%         text(28.11,61.03,'�����������');
%         text(28.46,61.11,'������');
%         text(25.39,60.59,'�����');
%         text(21.35,61.30,'�������');
%         text(26.56,60.28,'�����');
%         text(24.57,60.10,'���������');
%         text(22.16,60.27,'�����');
% end
% hold off
