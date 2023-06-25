%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       随机信号分析实验
% 功能：产生卡方分布随机变量并绘制直方图、计算其统计特性
% 作者：BenSmithLight
% 开源地址：https://github.com/BenSmithLight/Stochastic-signal-analysis-experiment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 生成10000个服从自由度为2的中心卡方分布的随机数
x1 = chi2rnd(2, 10000, 1);

%% 绘制直方图
figure;
histogram(x1)
title('中心卡方分布随机变量的样本直方图')
xlabel('样本值')
ylabel('频数')

%% 生成10000个服从自由度为2，非中心参数为4的非中心卡方分布的随机数
x2 = ncx2rnd(2, 2, 10000, 1);

%% 绘制直方图
figure;
histogram(x2)
title('非中心卡方分布随机变量的样本直方图')
xlabel('样本值')
ylabel('频数')

%% 计算数学期望
M1 = mean(x1);
M2 = mean(x2);

%% 计算数学期望和方差
V1 = var(x1);
V2 = var(x2);
