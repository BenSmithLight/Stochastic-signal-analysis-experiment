% 设置序列长度和采样率
N = 1024; % 序列长度
fs = 1000; % 采样率
t = (0:N-1)/fs; % 时间序列

% 生成余弦信号序列
x = cos(100*pi*t) + cos(200*pi*t);

% 生成正态分布随机数
n = randn(1, N);

% 生成叠加噪声的余弦信号序列
x = x + n;

% 画出合成序列的图像
figure;
subplot(3,1,1)
plot(x)
xlim([0 N-1])
xlabel('n')
ylabel('幅度')
title('合成序列')

% 计算并画出合成序列的自相关函数
Rxx = xcorr(x); % 计算自相关函数
subplot(3,1,2)
plot(-N+1:N-1,Rxx)
xlim([-500 500])
xlabel('n')
ylabel('Rx(n)')
title('合成序列的自相关函数')

% 计算并画出合成序列的功率谱密度
pxx = periodogram(x); % 使用periodogram函数计算功率谱密度
f = (0:N/2-1)*fs/N;
subplot(3,1,3)
plot(f, 10*log(pxx(1:N/2)))
xlabel('频率（Hz）')
ylabel('PSD(db/Hz)')
title('合成序列的功率谱密度')

