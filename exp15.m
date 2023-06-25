%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       随机信号分析实验
% 功能：依据序列绘制概率密度曲线
% 作者：BenSmithLight
% 开源地址：https://github.com/BenSmithLight/Stochastic-signal-analysis-experiment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 生成高斯随机序列
% 定义高斯分布的参数
mu = 5; % 均值
sigma = sqrt(10); % 标准差

% 生成高斯随机序列
x = mu + sigma * randn(1000, 1);

%% 绘制图像
% 绘制直方图
histogram(x, 50); % 使用 50 个区间画直方图
xlabel('x'); % x 轴标签
ylabel('频数'); % y 轴标签
title('概率密度函数和直方图'); % 标题

% 绘制概率密度函数
[f, xi] = ksdensity(x); % 计算概率密度函数的值
hold on; % 在同一个图像中绘制
plot(xi, f * 500, 'r-'); % 用红色实线画概率密度函数
hold off; % 结束绘制
