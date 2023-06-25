% 生成一组（0,1）均匀分布的白噪声序列
N = 1000; % 序列长度
x = rand(1, N); % 生成均匀分布随机数
% x = x - mean(x); % 去除直流分量

% 画出白噪声序列的图像
subplot(3,1,1)
plot(x)
xlabel('n')
ylabel('幅度')
title('白噪声序列')

% 计算并画出白噪声序列的自相关函数
Rxx = xcorr(x); % 计算自相关函数，使用有偏估计
subplot(3,1,2)
plot(-N + 1:N - 1, Rxx)
xlabel('n')
ylabel('Rx(n)')
title('白噪声序列的自相关函数')

% 计算并画出白噪声序列的功率谱密度
[pxx, f] = periodogram(x, [], N); % 使用periodogram函数计算功率谱密度，使用默认的矩形窗，指定DFT点数为N
subplot(3,1,3)
plot(f, pxx)
xlim([0, 3]) % 限制横坐标范围
xlabel('归一化频率（*pi rad/sample）')
ylabel('PSD(db/(rad/sample))')
title('白噪声序列的功率谱密度')
