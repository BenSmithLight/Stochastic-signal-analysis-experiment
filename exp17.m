%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       随机信号分析实验
% 功能：计算正态白噪声的自相关函数和功率谱密度
% 作者：BenSmithLight
% 开源地址：https://github.com/BenSmithLight/Stochastic-signal-analysis-experiment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 生成一组服从 N ~ 2,5 的正态白噪声序列
N = 1000; % 序列长度
x = normrnd(2, sqrt(5), 1, N); % 生成正态分布随机数
x = x - mean(x); % 去除直流分量

% 画出正态白噪声序列的图像
figure;
subplot(3, 1, 1)
plot(x)
xlabel('n')
ylabel('幅度')
title('正态白噪声序列')

%% 计算自相关函数和功率谱密度
% 计算并画出正态白噪声序列的自相关函数
Rxx = xcorr(x, 'biased'); % 计算自相关函数，使用有偏估计
subplot(3, 1, 2)
plot(-N + 1:N - 1, Rxx)
xlabel('n')
ylabel('Rx(n)')
title('正态白噪声序列的自相关函数')

% 计算并画出正态白噪声序列的功率谱密度
[pxx, f] = periodogram(x, [], N); % 使用periodogram函数计算功率谱密度，使用默认的矩形窗，指定DFT点数为N
subplot(3, 1, 3)
plot(f, pxx)
xlim([0, 3])
xlabel('归一化频率（*pi rad/sample）')
ylabel('PSD(db/(rad/sample))')
title('正态白噪声序列的功率谱密度')
