%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       随机信号分析实验
% 功能：计算随机相位信号的自相关函数和功率谱密度
% 作者：BenSmithLight
% 开源地址：https://github.com/BenSmithLight/Stochastic-signal-analysis-experiment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 生成随机相位序列
% 设置序列长度和采样率
A = 2;
w = 1000 * pi;
N = 1024; % 序列长度
fs = 2000; % 采样率
t = (0:N - 1) / fs; % 时间序列

% 生成随机相位
n = 2 * pi * rand(1);

% 生成余弦信号序列
x = w * t + n;

% 生成叠加噪声的余弦信号序列
x = A * cos(x);

% 画出随机相位序列的图像
figure;
subplot(3, 1, 1)
plot(x)
xlim([0 N - 1])
xlabel('n')
ylabel('幅度')
title('随机相位序列')

%% 计算随机相位序列的自相关函数和功率谱密度
% 计算并画出随机相位序列的自相关函数
Rxx = xcorr(x); % 计算自相关函数
subplot(3, 1, 2)
plot(-N + 1:N - 1, Rxx)
xlim([-500 500])
xlabel('n')
ylabel('Rx(n)')
title('随机相位序列的自相关函数')

% 计算并画出随机相位序列的功率谱密度
pxx = periodogram(x); % 使用periodogram函数计算功率谱密度
f = (0:N / 2 - 1) * fs / N;
subplot(3, 1, 3)
plot(f, 10 * log(pxx(1:N / 2)))
xlabel('频率（Hz）')
ylabel('PSD(db/Hz)')
title('随机相位序列的功率谱密度')
